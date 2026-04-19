@echo off
echo ============================================
echo   MARMITASHOP - Instalacao e Configuracao
echo ============================================
echo.

REM Verifica se Node.js esta instalado
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERRO] Node.js nao encontrado!
    echo.
    echo Por favor, instale o Node.js em: https://nodejs.org
    echo Recomendado: versao LTS (20.x ou superior)
    echo.
    echo Apos instalar, execute este arquivo novamente.
    pause
    exit /b 1
)

echo [OK] Node.js encontrado:
node --version
echo.

echo Instalando dependencias...
call npm install
if %errorlevel% neq 0 (
    echo [ERRO] Falha ao instalar dependencias
    pause
    exit /b 1
)

echo.
echo Configurando banco de dados...
call npx prisma db push
if %errorlevel% neq 0 (
    echo [ERRO] Falha ao configurar banco de dados
    pause
    exit /b 1
)

echo.
echo Criando dados iniciais (admin + produtos demo)...
call npx ts-node --compiler-options "{\"module\":\"CommonJS\"}" prisma/seed.ts

echo.
echo ============================================
echo   Instalacao concluida com sucesso!
echo ============================================
echo.
echo Para iniciar o servidor, execute: iniciar.bat
echo Ou execute: npm run dev
echo.
echo Acesse: http://localhost:3000
echo Admin:  http://localhost:3000/admin
echo.
echo Login admin:
echo   Email: admin@rei-da-quentinha.com
echo   Senha: admin123
echo.
pause
