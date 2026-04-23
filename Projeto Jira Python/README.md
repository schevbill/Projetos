# Agente Jira — Monitor de Issues Delphi

Agente Python que monitora automaticamente issues do Jira com status **"Tarefas pendentes"** e posta uma análise técnica com código-fonte Delphi gerado pela IA local (Ollama).

---

## Requisitos

- Python 3.10+
- [Ollama](https://ollama.com) instalado e rodando
- Conta no Jira Cloud com token de API

---

## Instalação

### 1. Clone o projeto e instale as dependências

```bash
cd "D:\Renato\Desenvolvimento\Projetos\Projeto Jira Python"
pip install -r requirements.txt
```

### 2. Configure as variáveis de ambiente

Copie o arquivo de exemplo e preencha com seus dados:

```bash
copy .env.example .env
```

Edite o `.env`:

```env
JIRA_URL=https://sua-empresa.atlassian.net
JIRA_EMAIL=seu-email@empresa.com
JIRA_TOKEN=seu_token_api_aqui

OLLAMA_URL=http://localhost:11434
OLLAMA_MODEL=qwen2.5-coder:7b
```

**Como obter o token do Jira:**
1. Acesse https://id.atlassian.com/manage-profile/security/api-tokens
2. Clique em **Create API token**
3. Copie o token gerado e cole no `.env`

### 3. Instale e configure o Ollama

1. Baixe e instale em [ollama.com](https://ollama.com)
2. Baixe o modelo de geração de código:

```bash
ollama pull qwen2.5-coder:7b
```

3. Verifique se está funcionando:

```bash
ollama list
```

---

## Como usar

### Executar uma vez manualmente

```bash
cd "D:\Renato\Desenvolvimento\Projetos\Projeto Jira Python"
python monitorar_issues.py
```

O script vai:
1. Buscar todas as issues com status "Tarefas pendentes" no projeto BILL
2. Ignorar issues que já têm comentário do agente (`[AGENTE-DELPHI]`)
3. Chamar o Ollama para gerar análise técnica + código Delphi
4. Postar o comentário automaticamente no Jira

---

## Automação (rodar a cada 15 minutos)

### Opção A — Loop simples (sem precisar de administrador)

Deixe a janela aberta em segundo plano:

```bash
rodar_monitor.bat
```

### Opção B — Tarefa agendada do Windows (roda mesmo sem janela aberta)

Execute como **Administrador**:

```bash
registrar_tarefa.bat
```

---

## Arquivos do projeto

| Arquivo | Descrição |
|---|---|
| `monitorar_issues.py` | Script principal do agente |
| `jira_client.py` | Funções de acesso à API do Jira |
| `agente.py` | CLI para consultar issues manualmente |
| `comentar_issues.py` | Script para postar comentários em lote |
| `rodar_monitor.bat` | Loop de 15 minutos sem precisar de admin |
| `registrar_tarefa.bat` | Registra tarefa no Agendador do Windows |
| `monitoramento.log` | Log de execuções do agente |
| `.env` | Credenciais (nunca versionar este arquivo) |
| `.env.example` | Modelo do `.env` para novos desenvolvedores |

---

## Outros modelos Ollama suportados

Troque o valor de `OLLAMA_MODEL` no `.env` conforme sua preferência:

| Modelo | Tamanho | Indicado para |
|---|---|---|
| `qwen2.5-coder:7b` | 4.7 GB | Geração de código (padrão) |
| `codellama:7b` | 3.8 GB | Geração de código |
| `llama3.1:8b` | 4.9 GB | Uso geral |
| `deepseek-coder-v2` | 8.9 GB | Código avançado |

---

## Verificar issues pelo terminal

```bash
# Listar issues do projeto BILL com status "Tarefas pendentes"
python agente.py --projeto BILL --status "Tarefas pendentes"

# Listar todos os projetos disponíveis
python agente.py --projetos
```
