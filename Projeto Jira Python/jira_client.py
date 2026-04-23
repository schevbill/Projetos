import requests
from requests.auth import HTTPBasicAuth
from config import JIRA_URL, JIRA_EMAIL, JIRA_TOKEN, validar_config


def _auth() -> HTTPBasicAuth:
    return HTTPBasicAuth(JIRA_EMAIL, JIRA_TOKEN)


def _headers() -> dict:
    return {"Accept": "application/json", "Content-Type": "application/json"}


def conectar() -> dict:
    """Testa a conexão e retorna os dados do usuário autenticado."""
    validar_config()
    resp = requests.get(
        f"{JIRA_URL}/rest/api/3/myself",
        auth=_auth(),
        headers={"Accept": "application/json"},
    )
    resp.raise_for_status()
    return resp.json()


def buscar_issues(
    jql: str = "ORDER BY created DESC",
    campos: list[str] | None = None,
    max_resultados: int = 100,
) -> list[dict]:
    """
    Busca issues usando JQL com paginação automática (API v3 — cursor-based).

    Args:
        jql:            Query JQL. Ex: 'project = BILL AND status = "Tarefas pendentes"'
        campos:         Lista de campos a retornar. None = campos principais.
        max_resultados: Limite total (0 = sem limite).

    Returns:
        Lista de dicts com os dados de cada issue.
    """
    validar_config()
    campos = campos or ["summary", "status", "assignee", "priority", "created", "updated", "description"]
    issues = []
    next_page_token = None

    while True:
        payload = {
            "jql": jql,
            "maxResults": 50,
            "fieldsByKeys": False,
            "fields": campos,
        }
        if next_page_token:
            payload["nextPageToken"] = next_page_token

        resp = requests.post(
            f"{JIRA_URL}/rest/api/3/search/jql",
            auth=_auth(),
            headers=_headers(),
            json=payload,
        )
        resp.raise_for_status()
        dados = resp.json()

        pagina = dados.get("issues", [])
        issues.extend(pagina)

        if dados.get("isLast", True) or not pagina:
            break

        next_page_token = dados.get("nextPageToken")
        if not next_page_token:
            break

        if max_resultados and len(issues) >= max_resultados:
            issues = issues[:max_resultados]
            break

    return issues


def listar_projetos() -> list[dict]:
    """Retorna todos os projetos acessíveis."""
    validar_config()
    resp = requests.get(
        f"{JIRA_URL}/rest/api/3/project",
        auth=_auth(),
        headers={"Accept": "application/json"},
    )
    resp.raise_for_status()
    return resp.json()
