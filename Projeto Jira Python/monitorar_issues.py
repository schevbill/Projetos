"""
Monitoramento automático: verifica issues com status 'Tarefas pendentes'
que ainda não têm comentário Delphi e posta a análise gerada pelo Claude AI.

Execução única (chamada pelo Task Scheduler ou rodar_monitor.bat):
    python monitorar_issues.py
"""

import re
import requests
from requests.auth import HTTPBasicAuth
from dotenv import load_dotenv
from datetime import datetime
import os

load_dotenv()

JIRA_URL = os.getenv("JIRA_URL")
AUTH     = HTTPBasicAuth(os.getenv("JIRA_EMAIL"), os.getenv("JIRA_TOKEN"))
HEADERS  = {"Accept": "application/json", "Content-Type": "application/json"}

MARCADOR     = "[AGENTE-DELPHI]"
LOG_FILE     = os.path.join(os.path.dirname(__file__), "monitoramento.log")
OLLAMA_URL   = os.getenv("OLLAMA_URL", "http://localhost:11434")
OLLAMA_MODEL = os.getenv("OLLAMA_MODEL", "qwen2.5-coder:7b")

SYSTEM_PROMPT = """\
Você é um Engenheiro de Software Sênior especializado em análise de requisitos \
e desenvolvimento na linguagem Delphi (Object Pascal). Seu objetivo é analisar \
automaticamente issues do Jira que estejam com status "Tarefas Pendentes" e gerar \
uma análise técnica completa junto com uma sugestão de implementação em Delphi.

Para cada issue recebida, você deve:

1. Ler e compreender o título, descrição e tipo da issue
2. Identificar o que precisa ser desenvolvido
3. Gerar uma análise técnica clara e objetiva
4. Propor uma solução de implementação em Delphi (Object Pascal)
5. Escrever o código-fonte Delphi funcional e comentado

Formato de resposta OBRIGATÓRIO:

**Título:** [título da issue]

**Resumo:** [breve resumo do que precisa ser feito]

**Tipo:** [Bug / Feature / Melhoria / Tarefa]

**Análise Técnica:**
[análise detalhada do problema ou funcionalidade, incluindo impacto, dependências e riscos]

**Solução Proposta:**
[descrição clara da abordagem de implementação em Delphi]

**Código Delphi:**
```delphi
[código-fonte Delphi completo e funcional]
```

Diretrizes de código:
- Use FireDAC para acesso ao banco de dados
- Use Horse para endpoints REST (quando aplicável)
- Use Indy para comunicação de rede (quando aplicável)
- Sempre use ParamByName — nunca concatene parâmetros diretamente na query
- Encapsule lógica em classes com responsabilidade única
- Inclua tratamento de exceções com try/except/finally
- Escreva comentários explicativos nas partes mais complexas
- Siga as convenções de nomenclatura Delphi (T prefix para classes, F para campos privados)
"""


# ---------------------------------------------------------------------------
# Log
# ---------------------------------------------------------------------------

def log(mensagem: str):
    linha = f"[{datetime.now().strftime('%d/%m/%Y %H:%M:%S')}] {mensagem}"
    print(linha)
    with open(LOG_FILE, "a", encoding="utf-8") as f:
        f.write(linha + "\n")


# ---------------------------------------------------------------------------
# Jira: busca de issues e detalhes
# ---------------------------------------------------------------------------

def buscar_issues_pendentes() -> list[dict]:
    payload = {
        "jql": "project = BILL AND status = 10004 ORDER BY created ASC",
        "maxResults": 100,
        "fieldsByKeys": False,
        "fields": ["summary", "status", "issuetype", "priority", "created"],
    }
    resp = requests.post(
        f"{JIRA_URL}/rest/api/3/search/jql",
        auth=AUTH, headers=HEADERS, json=payload,
    )
    resp.raise_for_status()
    return resp.json().get("issues", [])


def buscar_detalhes_issue(issue_key: str) -> dict:
    """Busca campos completos da issue, incluindo descrição."""
    resp = requests.get(
        f"{JIRA_URL}/rest/api/3/issue/{issue_key}",
        auth=AUTH,
        headers={"Accept": "application/json"},
        params={"fields": "summary,description,issuetype,priority,status,comment"},
    )
    resp.raise_for_status()
    return resp.json()


def extrair_texto_adf(adf) -> str:
    """Extrai texto puro de um documento ADF recursivamente."""
    texto = []
    if isinstance(adf, dict):
        if adf.get("type") == "text":
            texto.append(adf.get("text", ""))
        for valor in adf.values():
            if isinstance(valor, (dict, list)):
                texto.append(extrair_texto_adf(valor))
    elif isinstance(adf, list):
        for item in adf:
            texto.append(extrair_texto_adf(item))
    return " ".join(texto)


def issue_ja_comentada(issue_key: str) -> bool:
    """Verifica se esta issue já tem comentário do agente."""
    resp = requests.get(
        f"{JIRA_URL}/rest/api/3/issue/{issue_key}/comment",
        auth=AUTH, headers={"Accept": "application/json"},
    )
    if resp.status_code != 200:
        return False
    for c in resp.json().get("comments", []):
        if MARCADOR in extrair_texto_adf(c.get("body", {})):
            return True
    return False


# ---------------------------------------------------------------------------
# Claude AI: geração de análise Delphi
# ---------------------------------------------------------------------------

def gerar_analise_ollama(issue_key: str, summary: str, tipo: str, descricao: str) -> str:
    """Chama o Ollama local para gerar análise técnica e código Delphi."""
    descricao_formatada = descricao.strip() if descricao.strip() else "(sem descrição)"

    mensagem_usuario = (
        f"**Issue:** {issue_key}\n"
        f"**Título:** {summary}\n"
        f"**Tipo:** {tipo}\n\n"
        f"**Descrição:**\n{descricao_formatada}\n\n"
        "Analise esta issue e gere a implementação Delphi conforme as instruções do sistema."
    )

    payload = {
        "model": OLLAMA_MODEL,
        "messages": [
            {"role": "system", "content": SYSTEM_PROMPT},
            {"role": "user",   "content": mensagem_usuario},
        ],
        "stream": False,
    }

    resp = requests.post(
        f"{OLLAMA_URL}/api/chat",
        json=payload,
        timeout=300,  # modelos locais podem demorar mais
    )
    resp.raise_for_status()
    return resp.json()["message"]["content"]


# ---------------------------------------------------------------------------
# ADF: converte resposta markdown do Claude para Atlassian Document Format
# ---------------------------------------------------------------------------

def _p(texto: str) -> dict:
    return {"type": "paragraph", "content": [{"type": "text", "text": texto}]}


def _h(texto: str, nivel: int = 3) -> dict:
    return {
        "type": "heading",
        "attrs": {"level": nivel},
        "content": [{"type": "text", "text": texto}],
    }


def _code(src: str) -> dict:
    return {
        "type": "codeBlock",
        "attrs": {"language": "pascal"},
        "content": [{"type": "text", "text": src}],
    }


def montar_adf_de_markdown(issue_key: str, markdown: str) -> dict:
    """
    Converte a resposta markdown do Claude para ADF.
    Extrai blocos de código Delphi e transforma o restante em parágrafos.
    """
    content = [
        _h(f"Analise Delphi — {issue_key}", 3),
        _p(f"{MARCADOR} Gerado pelo Claude AI em {datetime.now().strftime('%d/%m/%Y %H:%M')}"),
    ]

    # Separa blocos de código do texto de análise
    partes = re.split(r"```(?:delphi|pascal)?\n(.*?)```", markdown, flags=re.DOTALL)

    for i, parte in enumerate(partes):
        parte = parte.strip()
        if not parte:
            continue

        if i % 2 == 1:
            # Parte ímpar = conteúdo do bloco de código capturado pelo grupo
            content.append(_h("Codigo Delphi", 4))
            content.append(_code(parte))
        else:
            # Texto de análise: dividir em parágrafos por linha em branco
            for bloco in re.split(r"\n{2,}", parte):
                bloco = bloco.strip()
                if not bloco:
                    continue
                # Remove marcadores markdown (**, ##, etc.) para o ADF
                bloco_limpo = re.sub(r"\*\*(.+?)\*\*", r"\1", bloco)
                bloco_limpo = re.sub(r"^#{1,6}\s*", "", bloco_limpo, flags=re.MULTILINE)
                bloco_limpo = bloco_limpo.strip()
                if bloco_limpo:
                    content.append(_p(bloco_limpo))

    content.append(_p("Revise e adapte ao contexto real do projeto antes de usar em producao."))

    return {"version": 1, "type": "doc", "content": content}


# ---------------------------------------------------------------------------
# Jira: postagem de comentário
# ---------------------------------------------------------------------------

def postar_comentario(issue_key: str, adf: dict) -> bool:
    resp = requests.post(
        f"{JIRA_URL}/rest/api/3/issue/{issue_key}/comment",
        auth=AUTH, headers=HEADERS, json={"body": adf},
    )
    return resp.status_code == 201


# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------

def main():
    log("=== Inicio da verificacao ===")

    log(f"Usando Ollama em {OLLAMA_URL} com modelo '{OLLAMA_MODEL}'.")

    try:
        issues = buscar_issues_pendentes()
    except Exception as e:
        log(f"ERRO ao buscar issues: {e}")
        return

    log(f"{len(issues)} issue(s) com status 'Tarefas pendentes' encontrada(s).")

    novas = 0
    for issue in issues:
        key     = issue["key"]
        summary = issue["fields"].get("summary", "")

        try:
            if issue_ja_comentada(key):
                log(f"Ignorando {key} — ja tem comentario do agente.")
                continue

            # Busca detalhes completos para dar contexto ao Claude
            detalhes   = buscar_detalhes_issue(key)
            fields     = detalhes.get("fields", {})
            tipo       = (fields.get("issuetype") or {}).get("name", "Tarefa")
            desc_adf   = fields.get("description") or {}
            descricao  = extrair_texto_adf(desc_adf)

            log(f"Gerando analise Ollama para {key}: {summary}")
            resposta = gerar_analise_ollama(key, summary, tipo, descricao)

            adf = montar_adf_de_markdown(key, resposta)

            if postar_comentario(key, adf):
                log(f"OK - Comentario postado em {key}: {summary}")
                novas += 1
            else:
                log(f"ERRO - Falha ao postar em {key}")

        except Exception as e:
            log(f"ERRO em {key}: {e}")

    if novas == 0:
        log("Nenhuma issue nova encontrada. Nada a fazer.")
    else:
        log(f"Concluido: {novas} comentario(s) novo(s) postado(s).")

    log("=== Fim da verificacao ===\n")


if __name__ == "__main__":
    main()
