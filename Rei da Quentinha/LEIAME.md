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

> **Importante:** altere a senha padrão imediatamente após o primeiro acesso em Admin → Usuários.

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
| Admin | Dashboard com métricas e gráficos de pedidos e faturamento |
| Admin | Filtro de período no dashboard (7, 15, 30 dias ou personalizado) |
| Admin | Gerenciar pedidos com data/hora, status, pagamento e motoboy |
| Admin | Notificação via WhatsApp ao cliente ao alterar status do pedido |
| Admin | Notificação via WhatsApp ao motoboy ao ser atribuído ao pedido |
| Admin | Cadastro de produtos com imagem e categoria |
| Admin | Gerenciar categorias de produtos |
| Admin | Cadastro de cupons de desconto |
| Admin | Cadastro e gestão de usuários |
| Admin | Cadastro de motoboys (dados pessoais, endereço, veículos) |
| Admin | Tipos de veículo para motoboys |
| Admin | Configuração de impressoras térmicas |
| Admin | Configurações → PIX (chave criptografada, nome, cidade) |
| Admin | Configurações → E-mail SMTP (senha criptografada) |
| Admin | Configurações → Sistema (WhatsApp, limpeza automática de logs) |
| Admin | Log completo de atividades com diff antes/depois |
| Admin | Log de erros do sistema e tentativas de login bloqueadas |
| Impressão | Impressão automática ao confirmar pedido (ESC/POS) |
| E-mail | Notificação ao cliente em cada mudança de status do pedido |
| Segurança | Sessão única por usuário (bloqueio de login duplo) |
| Segurança | Sessão expira após 40 minutos de inatividade |
| Segurança | Dados sensíveis criptografados com AES-256-CBC |

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

## Configurar WhatsApp

As notificações via WhatsApp funcionam através de links `wa.me` — ao alterar o status de um pedido ou atribuir um motoboy, o WhatsApp abre automaticamente com a mensagem pré-preenchida para o admin enviar.

Para ativar ou desativar:
1. Acesse Admin → Configurações → aba **Sistema**
2. Use os toggles **WhatsApp para o Cliente** e **WhatsApp para o Motoboy**
3. Clique em **Salvar Configurações**

> O número do motoboy deve estar cadastrado com DDD (ex: `11999999999`).

---

## Configurar Impressora Térmica

1. Acesse Admin → Impressoras
2. Clique em "Nova Impressora"
3. Informe o IP e porta (padrão: 9100) da impressora na rede
4. Marque como "Padrão"

Ao confirmar um pedido, o comprovante é enviado automaticamente pela rede.

**Protocolo suportado:** ESC/POS (impressoras térmicas padrão)

---

## Limpeza Automática de Logs

1. Acesse Admin → Configurações → aba **Sistema**
2. Defina o número de dias em **Manter logs dos últimos X dias**
3. Use `0` para nunca apagar os logs
4. Clique em **Salvar Configurações**

A limpeza ocorre automaticamente em background toda vez que a tela de Logs é acessada.

---

## Sessão e Segurança

- Apenas **uma sessão ativa por usuário** é permitida. Uma segunda tentativa de login enquanto a sessão estiver ativa retorna erro.
- A sessão expira automaticamente após **40 minutos de inatividade**.
- Ao expirar, o sistema redireciona para o login com aviso.
- Para forçar acesso em outro dispositivo, faça logout no dispositivo atual primeiro.

---

## Variáveis de Ambiente (.env)

```env
DATABASE_URL="mysql://usuario:senha@host:3306/rei_da_quentinha"
JWT_SECRET="chave-secreta-jwt-minimo-32-chars"
ENCRYPTION_KEY="chave-hex-64-chars-32-bytes-para-aes-256"
NEXT_PUBLIC_APP_URL="http://localhost:4000"

# PIX (valores iniciais, sobrescritos pelas configurações do painel)
PIX_KEY="sua-chave-pix"
PIX_NAME="Rei da Quentinha"
PIX_CITY="Sao Paulo"
```

> **ENCRYPTION_KEY**: gere com `node -e "console.log(require('crypto').randomBytes(32).toString('hex'))"`.
> Não altere após salvar configurações — os dados criptografados (senha SMTP, chave PIX) ficarão ilegíveis.

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
│   │   ├── page.tsx          # Dashboard com gráficos
│   │   ├── orders/           # Pedidos
│   │   ├── products/         # Produtos + Categorias
│   │   ├── coupons/          # Cupons
│   │   ├── users/            # Usuários
│   │   ├── motoboys/         # Motoboys + Tipos de Veículo
│   │   ├── printers/         # Impressoras
│   │   ├── configuracoes/    # Sistema + PIX + E-mail
│   │   └── logs/             # Log de atividades e erros
│   └── api/                  # API REST
├── components/               # Componentes reutilizáveis
├── lib/
│   ├── prisma.ts             # Banco de dados
│   ├── auth.ts               # Autenticação JWT + controle de sessão
│   ├── email.ts              # Envio de e-mails (nodemailer)
│   ├── crypto.ts             # Criptografia AES-256-CBC
│   ├── logger.ts             # Sistema de logs (ações, erros, login bloqueado)
│   └── print.ts              # Impressão ESC/POS
└── store/
    └── cart.ts               # Estado do carrinho (Zustand)
```

---

## Banco de Dados

MySQL — configurado via `DATABASE_URL` no `.env`

Para aplicar alterações de schema: `npx prisma db push`
Para visualizar os dados: `npx prisma studio`

### Tabelas principais

| Tabela | Descrição |
|--------|-----------|
| User | Clientes e administradores |
| Order / OrderItem | Pedidos e itens |
| Product / Category | Produtos e categorias |
| Motoboy / MotoboyVehicle | Entregadores e veículos |
| VehicleType | Tipos de veículo |
| Coupon | Cupons de desconto |
| Printer | Impressoras térmicas |
| ConfigPix | Chave PIX criptografada |
| ConfigEmail | Configuração SMTP criptografada |
| ConfigSystem | Configurações do sistema (WhatsApp, logs) |
| Log | Auditoria completa de ações e erros |
