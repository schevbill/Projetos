import os
from dotenv import load_dotenv

load_dotenv()

JIRA_URL = os.getenv("JIRA_URL")
JIRA_EMAIL = os.getenv("JIRA_EMAIL")
JIRA_TOKEN = os.getenv("JIRA_TOKEN")

def validar_config():
    faltando = [k for k, v in {
        "JIRA_URL": JIRA_URL,
        "JIRA_EMAIL": JIRA_EMAIL,
        "JIRA_TOKEN": JIRA_TOKEN,
    }.items() if not v]

    if faltando:
        raise EnvironmentError(
            f"Variáveis de ambiente não configuradas: {', '.join(faltando)}\n"
            "Copie .env.example para .env e preencha os valores."
        )
