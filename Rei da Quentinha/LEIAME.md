# Rei da Quentinha — E-commerce de Marmitas

## Como instalar

### 1. Instale o Node.js
Baixe em: https://nodejs.org (versão LTS recomendada)

### 2. Execute o instalador
Dê duplo clique em **instalar.bat**

### 3. Inicie o servidor
Dê duplo clique em **iniciar.bat** ou execute `npm run dev`

Acesse: **http://localhost:3000**

---

## Acesso Admin

- URL: http://localhost:3000/admin
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
| Admin | Gerenciar pedidos (status + motoboy) |
| Admin | Cadastro de produtos |
| Admin | Cadastro de cupons de desconto |
| Admin | Cadastro de usuários |
| Admin | Cadastro de motoboys |
| Admin | Configuração de impressoras |
| Impressão | Impressão automática ao confirmar pedido |
| Impressão | Layout com valor, troco e itens |

---

## Configurar Impressora Térmica

1. Acesse Admin → Impressoras
2. Clique em "Nova Impressora"
3. Informe o IP e porta (padrão: 9100) da impressora na rede
4. Marque como "Padrão"

Ao confirmar um pedido pago, o comprovante é enviado automaticamente pela rede.

**Protocolo suportado:** ESC/POS (impressoras térmicas padrão)

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
│   │   ├── products/         # Produtos
│   │   ├── coupons/          # Cupons
│   │   ├── users/            # Usuários
│   │   ├── motoboys/         # Motoboys
│   │   └── printers/         # Impressoras
│   └── api/                  # API REST
├── components/               # Componentes reutilizáveis
├── lib/
│   ├── prisma.ts             # Banco de dados
│   ├── auth.ts               # Autenticação JWT
│   └── print.ts              # Impressão ESC/POS
└── store/
    └── cart.ts               # Estado do carrinho (Zustand)
```

---

## Banco de Dados

SQLite (arquivo local `prisma/dev.db`)

Para visualizar os dados: `npm run db:studio`
