@echo off
:: Execute este arquivo como ADMINISTRADOR (clique direito > Executar como administrador)

set PYTHON=python
set SCRIPT="D:\Renato\Desenvolvimento\Projetos\Projeto Jira Python\monitorar_issues.py"
set WORKDIR="D:\Renato\Desenvolvimento\Projetos\Projeto Jira Python"
set TASKNAME=JiraAgenteDelphiMonitor

echo Removendo tarefa anterior (se existir)...
schtasks /delete /tn "%TASKNAME%" /f 2>nul

echo Criando tarefa agendada a cada 15 minutos...
schtasks /create ^
  /tn "%TASKNAME%" ^
  /tr "%PYTHON% %SCRIPT%" ^
  /sc minute ^
  /mo 15 ^
  /sd %DATE% ^
  /st %TIME:~0,5% ^
  /rl HIGHEST ^
  /f

if %errorlevel%==0 (
    echo.
    echo SUCESSO! Tarefa "%TASKNAME%" criada.
    echo O agente rodara automaticamente a cada 15 minutos.
) else (
    echo.
    echo ERRO ao criar tarefa. Verifique se executou como Administrador.
)

pause
