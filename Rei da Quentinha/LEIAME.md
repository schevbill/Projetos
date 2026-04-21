# Rei da Quentinha — E-commerce de Marmitas

## Como instalar

### 1. Instale o Node.js
Baixe em: https://nodejs.org (versão LTS recomendada)

### 2. Execute o instalador
Dê duplo clique em **instalar.bat**

### 3. Inicie o servidor
Dê duplo clique em **iniciar.bat** ou execute `npm run dev -- --port 4000`

Acesse: **http://localhost:4000**

---

## Acesso Admin

- URL: http://localhost:4000/admin
- Email: `admin@rei-da-quentinha.com`
- Senha: `admin123`

---

## Funcionalidades

| Área | Recurso |
|------|---------|
| Loja | Página inicial com cardápio por categorias |
| Loja | Carrinho de compras |
| Loja | Checkout com PIX, Cartão, Dinheiro, Débito |
| Loja | Cupom de desconto |
| Loja | Rastreamento de pedido |
| Conta | Cadastro e login de clientes |
| Admin | Dashboard com vendas e métricas |
| Admin | Gerenciar pedidos (status, pagamento, motoboy) |
| Admin | Cadastro de produtos com imagem e categoria |
| Admin | Gerenciar categorias de produtos |
| Admin | Cadastro de cupons de desconto |
| Admin | Cadastro e gestão de usuários |
| Admin | Cadastro de motoboys (dados pessoais, endereço, veículos) |
| Admin | Tipos de veículo para motoboys |
| Admin | Configuração de impressoras térmicas |
| Admin | Configurações PIX (chave, nome, cidade) |
| Admin | Configurações de e-mail SMTP |
| Admin | Log completo de atividades com diff antes/depois |
| Impressão | Impressão automática ao confirmar pedido (ESC/POS) |
| E-mail | Notificação ao cliente em cada mudança de status do pedido |

---

## Configurar E-mail (Notificações de Pedido)

1. Acesse Admin → Configurações → aba **E-mail**
2. Preencha os dados do servidor SMTP
3. Ative o toggle **Ativo**
4. Clique em **Salvar Configurações**
5. Clique em **Enviar E-mail de Teste** para confirmar

### Usando Gmail

1. Acesse [myaccount.google.com/security](https://myaccount.google.com/security)
2. Ative a **Verificação em 2 etapas**
3. Pesquise por **"Senhas de app"** nas configurações da conta
4. Crie uma senha para **Email** → **Outro** → nome "Rei da Quentinha"
5. Use a senha de 16 caracteres gerada (sem espaços) no campo Senha

| Campo | Valor para Gmail |
|-------|-----------------|
| Servidor SMTP | smtp.gmail.com |
| Porta | 587 |
| Usuário | seuemail@gmail.com |
| Senha | senha de app (16 chars) |

---

## Configurar Impressora Térmica

1. Acesse Admin → Impressoras
2. Clique em "Nova Impressora"
3. Informe o IP e porta (padrão: 9100) da impressora na rede
4. Marque como "Padrão"

Ao confirmar um pedido, o comprovante é enviado automaticamente pela rede.

**Protocolo suportado:** ESC/POS (impressoras térmicas padrão)

---

## Variáveis de Ambiente (.env)

```env
DATABASE_URL="mysql://usuario:senha@host:3306/rei_da_quentinha"
JWT_SECRET="chave-secreta-jwt"
ENCRYPTION_KEY="chave-hex-32-bytes-para-criptografar-senhas"
NEXT_PUBLIC_APP_URL="http://localhost:4000"

# PIX (sobrescrito pelas configurações do painel)
PIX_KEY="sua-chave-pix"
PIX_NAME="Rei da Quentinha"
PIX_CITY="Sao Paulo"
```

> **ENCRYPTION_KEY**: não altere após salvar configurações de e-mail — a senha SMTP ficará ilegível.

---

## Estrutura do Projeto

```
src/
├── app/
│   ├── page.tsx              # Página inicial / cardápio
│   ├── cart/                 # Carrinho
│   ├── checkout/             # Finalizar pedido
│   ├── pedido/[id]/          # Acompanhar pedido
│   ├── auth/login/           # Login
│   ├── auth/register/        # Cadastro cliente
│   ├── admin/
│   │   ├── page.tsx          # Dashboard
│   │   ├── orders/           # Pedidos
│   │   ├── products/         # Produtos + Categorias
│   │   ├── coupons/          # Cupons
│   │   ├── users/            # Usuários
│   │   ├── motoboys/         # Motoboys + Tipos de Veículo
│   │   ├── printers/         # Impressoras
│   │   ├── configuracoes/    # PIX + E-mail
│   │   └── logs/             # Log de atividades
│   └── api/                  # API REST
├── components/               # Componentes reutilizáveis
├── lib/
│   ├── prisma.ts             # Banco de dados
│   ├── auth.ts               # Autenticação JWT
│   ├── email.ts              # Envio de e-mails (nodemailer)
│   ├── crypto.ts             # Criptografia AES-256 de senhas
│   ├── logger.ts             # Sistema de logs
│   └── print.ts              # Impressão ESC/POS
└── store/
    └── cart.ts               # Estado do carrinho (Zustand)
```

---

## Banco de Dados

MySQL — configurado via `DATABASE_URL` no `.env`

Para aplicar alterações de schema: `npx prisma db push`
Para visualizar os dados: `npx prisma studio`
