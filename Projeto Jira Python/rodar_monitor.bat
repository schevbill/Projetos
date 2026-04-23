@echo off
:: Loop infinito: executa o monitor e aguarda 15 minutos entre cada checagem.
:: Deixe esta janela aberta em segundo plano.

set SCRIPT="D:\Renato\Desenvolvimento\Projetos\Projeto Jira Python\monitorar_issues.py"
cd /d "D:\Renato\Desenvolvimento\Projetos\Projeto Jira Python"

echo ============================================
echo  Agente Jira - Monitor de Issues Delphi
echo  Verificando a cada 15 minutos...
echo  Pressione Ctrl+C para parar.
echo ============================================
echo.

:loop
echo [%DATE% %TIME:~0,8%] Verificando issues...
python %SCRIPT%
echo.
echo Proxima verificacao em 15 minutos...
timeout /t 900 /nobreak >nul
goto loop
