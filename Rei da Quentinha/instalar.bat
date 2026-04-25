@echo off
echo ============================================
echo   REI DA QUENTINHA - Instalacao
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

REM Verifica se o arquivo .env existe
if not exist ".env" (
    echo [AVISO] Arquivo .env nao encontrado!
    echo.
    echo Crie o arquivo .env na raiz do projeto com o seguinte conteudo:
    echo.
    echo   DATABASE_URL="mysql://usuario:senha@host:3306/rei_da_quentinha"
    echo   JWT_SECRET="sua-chave-secreta-jwt"
    echo   ENCRYPTION_KEY="chave-hex-64-chars"
    echo   NEXT_PUBLIC_APP_URL="http://localhost:4000"
    echo.
    echo Para gerar a ENCRYPTION_KEY execute:
    echo   node -e "console.log(require('crypto').randomBytes(32).toString('hex'))"
    echo.
    pause
    exit /b 1
)

echo [OK] Arquivo .env encontrado.
echo.

echo Instalando dependencias...
call npm install
if %errorlevel% neq 0 (
    echo [ERRO] Falha ao instalar dependencias
    pause
    exit /b 1
)
echo [OK] Dependencias instaladas.
echo.

echo Aplicando schema no banco de dados...
call npx prisma db push
if %errorlevel% neq 0 (
    echo [ERRO] Falha ao aplicar schema no banco de dados.
    echo Verifique se o banco MySQL esta rodando e o DATABASE_URL no .env esta correto.
    pause
    exit /b 1
)
echo [OK] Banco de dados configurado.
echo.

echo Gerando Prisma Client...
call npx prisma generate
if %errorlevel% neq 0 (
    echo [ERRO] Falha ao gerar Prisma Client
    pause
    exit /b 1
)
echo [OK] Prisma Client gerado.
echo.

echo Criando dados iniciais (admin + produtos demo)...
call npx ts-node --compiler-options "{\"module\":\"CommonJS\"}" prisma/seed.ts
if %errorlevel% neq 0 (
    echo [AVISO] Seed nao executado (pode ja ter sido executado antes).
)
echo.

echo ============================================
echo   Instalacao concluida com sucesso!
echo ============================================
echo.
echo Para iniciar o servidor, execute: iniciar.bat
echo.
echo Acesse:       http://localhost:4000
echo Admin:        http://localhost:4000/admin
echo.
echo Login admin:
echo   Email: admin@rei-da-quentinha.com
echo   Senha: admin123
echo.
echo IMPORTANTE: Altere a senha do admin apos o primeiro acesso!
echo.
pause
