import nodemailer from 'nodemailer'
import { prisma } from '@/lib/prisma'
import { decrypt } from '@/lib/crypto'

interface OrderEmailData {
  orderId: string
  customerName: string
  customerEmail: string
  items: { name: string; quantity: number; price: number }[]
  subtotal: number
  discount: number
  total: number
  paymentMethod: string
  paymentStatus: string
  address: string
  motoboyName?: string | null
  createdAt: Date
}

const PAYMENT_LABELS: Record<string, string> = {
  PIX: 'PIX',
  CREDIT_CARD: 'Cartão de Crédito',
  DEBIT_CARD: 'Cartão de Débito',
  CASH: 'Dinheiro',
  MONEY: 'Dinheiro',
}

function formatCurrency(value: number) {
  return value.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' })
}

function orderItemsTable(items: OrderEmailData['items']) {
  return items.map(i => `
    <tr>
      <td style="padding:8px 12px;border-bottom:1px solid #f0f0f0;">${i.name}</td>
      <td style="padding:8px 12px;border-bottom:1px solid #f0f0f0;text-align:center;">${i.quantity}</td>
      <td style="padding:8px 12px;border-bottom:1px solid #f0f0f0;text-align:right;">${formatCurrency(i.price)}</td>
      <td style="padding:8px 12px;border-bottom:1px solid #f0f0f0;text-align:right;font-weight:600;">${formatCurrency(i.price * i.quantity)}</td>
    </tr>`).join('')
}

function baseTemplate(title: string, color: string, icon: string, body: string) {
  return `<!DOCTYPE html>
<html lang="pt-BR">
<head><meta charset="UTF-8"><meta name="viewport" content="width=device-width,initial-scale=1"></head>
<body style="margin:0;padding:0;background:#f5f5f5;font-family:Arial,sans-serif;">
  <table width="100%" cellpadding="0" cellspacing="0" style="background:#f5f5f5;padding:32px 0;">
    <tr><td align="center">
      <table width="600" cellpadding="0" cellspacing="0" style="background:#fff;border-radius:12px;overflow:hidden;box-shadow:0 2px 8px rgba(0,0,0,0.08);max-width:600px;">
        <tr>
          <td style="background:${color};padding:28px 32px;text-align:center;">
            <div style="font-size:36px;margin-bottom:8px;">${icon}</div>
            <h1 style="margin:0;color:#fff;font-size:22px;font-weight:700;">${title}</h1>
          </td>
        </tr>
        <tr><td style="padding:32px;">${body}</td></tr>
        <tr>
          <td style="background:#f9f9f9;padding:20px 32px;text-align:center;border-top:1px solid #eee;">
            <p style="margin:0;color:#999;font-size:12px;">Rei da Quentinha — Atendimento ao cliente</p>
          </td>
        </tr>
      </table>
    </td></tr>
  </table>
</body></html>`
}

function orderSummaryBlock(data: OrderEmailData) {
  return `
    <p style="color:#555;font-size:15px;margin:0 0 20px;">Olá, <strong>${data.customerName}</strong>! Aqui está o resumo do seu pedido:</p>

    <table width="100%" cellpadding="0" cellspacing="0" style="border:1px solid #eee;border-radius:8px;overflow:hidden;margin-bottom:20px;">
      <thead>
        <tr style="background:#f7f7f7;">
          <th style="padding:10px 12px;text-align:left;font-size:13px;color:#666;">Produto</th>
          <th style="padding:10px 12px;text-align:center;font-size:13px;color:#666;">Qtd</th>
          <th style="padding:10px 12px;text-align:right;font-size:13px;color:#666;">Unit.</th>
          <th style="padding:10px 12px;text-align:right;font-size:13px;color:#666;">Total</th>
        </tr>
      </thead>
      <tbody>${orderItemsTable(data.items)}</tbody>
    </table>

    <table width="100%" cellpadding="0" cellspacing="0" style="margin-bottom:20px;">
      ${data.discount > 0 ? `
      <tr>
        <td style="padding:4px 0;color:#555;font-size:14px;">Subtotal</td>
        <td style="padding:4px 0;text-align:right;color:#555;font-size:14px;">${formatCurrency(data.subtotal)}</td>
      </tr>
      <tr>
        <td style="padding:4px 0;color:#16a34a;font-size:14px;">Desconto</td>
        <td style="padding:4px 0;text-align:right;color:#16a34a;font-size:14px;">-${formatCurrency(data.discount)}</td>
      </tr>` : ''}
      <tr>
        <td style="padding:8px 0;color:#111;font-size:16px;font-weight:700;border-top:2px solid #eee;">Total</td>
        <td style="padding:8px 0;text-align:right;color:#e53e3e;font-size:16px;font-weight:700;border-top:2px solid #eee;">${formatCurrency(data.total)}</td>
      </tr>
    </table>

    <table width="100%" cellpadding="0" cellspacing="0" style="background:#f9f9f9;border-radius:8px;padding:16px;margin-bottom:20px;">
      <tr>
        <td style="padding:4px 0;color:#666;font-size:13px;"><strong>Pedido:</strong> #${data.orderId.slice(-6).toUpperCase()}</td>
      </tr>
      <tr>
        <td style="padding:4px 0;color:#666;font-size:13px;"><strong>Pagamento:</strong> ${PAYMENT_LABELS[data.paymentMethod] ?? data.paymentMethod}</td>
      </tr>
      <tr>
        <td style="padding:4px 0;color:#666;font-size:13px;"><strong>Endereço:</strong> ${data.address}</td>
      </tr>
      ${data.motoboyName ? `
      <tr>
        <td style="padding:4px 0;color:#666;font-size:13px;"><strong>Entregador:</strong> ${data.motoboyName}</td>
      </tr>` : ''}
    </table>`
}

const STATUS_CONFIG: Record<string, { subject: string; title: string; color: string; icon: string; message: string }> = {
  CONFIRMED: {
    subject: 'Pedido confirmado! 🎉',
    title: 'Pedido Confirmado!',
    color: '#16a34a',
    icon: '✅',
    message: 'Ótimas notícias! Seu pedido foi confirmado e já está sendo preparado.',
  },
  PREPARING: {
    subject: 'Seu pedido está sendo preparado 🍱',
    title: 'Preparando seu pedido...',
    color: '#d97706',
    icon: '🍱',
    message: 'Nossa equipe está preparando seu pedido com todo carinho. Em breve ele estará a caminho!',
  },
  OUT_FOR_DELIVERY: {
    subject: 'Pedido saiu para entrega 🛵',
    title: 'Pedido a Caminho!',
    color: '#2563eb',
    icon: '🛵',
    message: 'Seu pedido saiu para entrega e já está a caminho. Prepare-se para receber!',
  },
  DELIVERED: {
    subject: 'Pedido entregue! ✅',
    title: 'Pedido Entregue!',
    color: '#16a34a',
    icon: '🎉',
    message: 'Seu pedido foi entregue com sucesso! Esperamos que aproveite muito. Bom apetite!',
  },
  CANCELLED: {
    subject: 'Pedido cancelado',
    title: 'Pedido Cancelado',
    color: '#dc2626',
    icon: '❌',
    message: 'Infelizmente seu pedido foi cancelado. Se tiver dúvidas, entre em contato conosco.',
  },
  PAID: {
    subject: 'Pagamento confirmado! 💰',
    title: 'Pagamento Confirmado!',
    color: '#16a34a',
    icon: '💰',
    message: 'Seu pagamento foi confirmado com sucesso! Seu pedido será preparado em breve.',
  },
  PENDING: {
    subject: 'Aguardando pagamento ⏳',
    title: 'Aguardando Pagamento',
    color: '#d97706',
    icon: '⏳',
    message: 'Seu pedido foi recebido e está aguardando a confirmação do pagamento.',
  },
  REFUNDED: {
    subject: 'Reembolso processado',
    title: 'Reembolso Processado',
    color: '#7c3aed',
    icon: '↩️',
    message: 'O reembolso do seu pedido foi processado. O valor será estornado conforme a forma de pagamento utilizada.',
  },
}

export async function sendOrderStatusEmail(status: string, data: OrderEmailData, isPayment = false) {
  const config = await prisma.configEmail.findUnique({ where: { id: 'default' } })
  if (!config?.active || !config.user || !config.pass) return

  const key = isPayment
    ? (['PAID', 'PENDING', 'REFUNDED'].includes(status) ? status : null)
    : status
  if (!key) return
  const cfg = STATUS_CONFIG[key]
  if (!cfg) return

  const transporter = nodemailer.createTransport({
    host: config.host,
    port: config.port,
    secure: config.port === 465,
    auth: { user: config.user, pass: decrypt(config.pass) },
    tls: { rejectUnauthorized: false },
  })

  const body = `
    <div style="background:#fffbeb;border-left:4px solid ${cfg.color};padding:14px 16px;border-radius:4px;margin-bottom:24px;">
      <p style="margin:0;color:#333;font-size:15px;">${cfg.message}</p>
    </div>
    ${orderSummaryBlock(data)}
  `

  await transporter.sendMail({
    from: resolveFrom(config.from, config.user),
    to: data.customerEmail,
    subject: `${cfg.subject} — Pedido #${data.orderId.slice(-6).toUpperCase()}`,
    html: baseTemplate(cfg.title, cfg.color, cfg.icon, body),
  })
}

function resolveFrom(from: string, user: string) {
  if (!from || !from.includes('@')) return `Rei da Quentinha <${user}>`
  if (!from.includes('<')) return `Rei da Quentinha <${from}>`
  return from
}

export async function sendTestEmail(to: string) {
  const config = await prisma.configEmail.findUnique({ where: { id: 'default' } })
  if (!config?.user || !config.pass) throw new Error('SMTP não configurado. Configure o servidor SMTP nas Configurações.')

  const transporter = nodemailer.createTransport({
    host: config.host,
    port: config.port,
    secure: config.port === 465,
    auth: { user: config.user, pass: decrypt(config.pass) },
    tls: { rejectUnauthorized: false },
  })

  await transporter.sendMail({
    from: resolveFrom(config.from, config.user),
    to,
    subject: 'Teste de e-mail — Rei da Quentinha',
    html: baseTemplate(
      'Configuração de E-mail OK!',
      '#16a34a',
      '✅',
      `<p style="color:#555;font-size:15px;">Este é um e-mail de teste enviado pelo painel do <strong>Rei da Quentinha</strong>.</p>
       <p style="color:#555;font-size:15px;">Se você recebeu esta mensagem, as configurações de SMTP estão corretas!</p>`
    ),
  })
}
