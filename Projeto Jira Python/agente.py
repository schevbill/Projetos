"""
Agente principal: lê e exibe issues do Jira no terminal.

Uso:
    python agente.py                          # Todas as issues
    python agente.py --projeto BILL           # Filtrar por projeto
    python agente.py --status "In Progress"   # Filtrar por status
    python agente.py --max 50                 # Limitar quantidade
    python agente.py --projetos               # Listar projetos disponíveis
"""

import argparse
from rich.console import Console
from rich.table import Table
from rich import box

from jira_client import conectar, buscar_issues, listar_projetos

console = Console()


def montar_jql(projeto: str | None, status: str | None) -> str:
    filtros = []
    if projeto:
        filtros.append(f'project = "{projeto}"')
    if status:
        filtros.append(f'status = "{status}"')
    base = " AND ".join(filtros) if filtros else ""
    return f"{base} ORDER BY created DESC" if base else "ORDER BY created DESC"


def exibir_issues(issues: list[dict]):
    if not issues:
        console.print("[yellow]Nenhuma issue encontrada.[/yellow]")
        return

    tabela = Table(
        title=f"Issues do Jira — {len(issues)} encontradas",
        box=box.ROUNDED,
        show_lines=True,
    )
    tabela.add_column("Chave", style="cyan bold", no_wrap=True)
    tabela.add_column("Resumo", style="white", max_width=60)
    tabela.add_column("Status", style="green")
    tabela.add_column("Prioridade", style="yellow")
    tabela.add_column("Responsável", style="blue")
    tabela.add_column("Criada", style="dim")

    for issue in issues:
        f = issue.get("fields", {})
        status = f.get("status", {})
        prioridade = f.get("priority", {})
        responsavel = f.get("assignee") or {}

        tabela.add_row(
            issue.get("key", "—"),
            f.get("summary") or "—",
            status.get("name", "—"),
            prioridade.get("name", "—") if prioridade else "—",
            responsavel.get("displayName", "Não atribuído"),
            (f.get("created") or "")[:10] or "—",
        )

    console.print(tabela)


def exibir_projetos(projetos: list[dict]):
    tabela = Table(title="Projetos disponíveis", box=box.SIMPLE)
    tabela.add_column("Chave", style="cyan bold")
    tabela.add_column("Nome", style="white")

    for p in sorted(projetos, key=lambda x: x.get("key", "")):
        tabela.add_row(p.get("key", "—"), p.get("name", "—"))

    console.print(tabela)


def main():
    parser = argparse.ArgumentParser(description="Agente leitor de issues do Jira")
    parser.add_argument("--projeto", help="Chave do projeto (ex: BILL)")
    parser.add_argument("--status", help="Filtrar por status (ex: 'In Progress')")
    parser.add_argument("--max", type=int, default=100, dest="max_issues", help="Máximo de issues (padrão: 100)")
    parser.add_argument("--projetos", action="store_true", help="Listar todos os projetos")
    args = parser.parse_args()

    console.print("[bold blue]Conectando ao Jira...[/bold blue]")
    usuario = conectar()
    console.print(f"[bold green]Conectado como: {usuario.get('displayName', usuario.get('emailAddress'))}[/bold green]\n")

    if args.projetos:
        projetos = listar_projetos()
        exibir_projetos(projetos)
        return

    jql = montar_jql(args.projeto, args.status)
    console.print(f"[dim]JQL: {jql}[/dim]\n")

    issues = buscar_issues(jql=jql, max_resultados=args.max_issues)
    exibir_issues(issues)


if __name__ == "__main__":
    main()
