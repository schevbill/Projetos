'use client'
import { useEffect, useState } from 'react'
import toast from 'react-hot-toast'
import { Printer, RefreshCw } from 'lucide-react'

interface OrderItem { quantity: number; price: number; product: { name: string } }
interface Motoboy { id: string; name: string; phone: string }
interface Order {
  id: string; customerName: string; customerPhone: string; address: string
  items: OrderItem[]; total: number; discount: number; subtotal: number
  paymentMethod: string; paymentStatus: string; status: string
  notes?: string | null; printedLabel: boolean; createdAt: string
  motoboy?: Motoboy | null; motoboyId?: string | null
}

const STATUSES = ['PENDING','CONFIRMED','PREPARING','READY','DELIVERING','DELIVERED','CANCELLED']
const STATUS_LABELS: Record<string, string> = {
  PENDING: 'Pendente', CONFIRMED: 'Confirmado', PREPARING: 'Preparando',
  READY: 'Pronto', DELIVERING: 'Entregando', DELIVERED: 'Entregue', CANCELLED: 'Cancelado',
}
const STATUS_COLORS: Record<string, string> = {
  PENDING: 'bg-yellow-100 text-yellow-700', CONFIRMED: 'bg-blue-100 text-blue-700',
  PREPARING: 'bg-brand-100 text-brand-700', READY: 'bg-purple-100 text-purple-700',
  DELIVERING: 'bg-indigo-100 text-indigo-700', DELIVERED: 'bg-green-100 text-green-700',
  CANCELLED: 'bg-red-100 text-red-700',
}
const PAYMENT_LABELS: Record<string, string> = {
  PIX: 'PIX', CREDIT_CARD: 'Cartão Crédito', DEBIT_CARD: 'Cartão Débito', CASH: 'Dinheiro'
}

const WA_STATUS_CONFIG: Record<string, { icon: string; message: string }> = {
  CONFIRMED:        { icon: '✅', message: 'Seu pedido foi *confirmado* e já está sendo preparado!' },
  PREPARING:        { icon: '🍱', message: 'Nossa equipe está *preparando* seu pedido com todo carinho. Em breve estará a caminho!' },
  READY:            { icon: '🔔', message: 'Seu pedido está *pronto* e aguardando o entregador!' },
  DELIVERING:       { icon: '🛵', message: 'Seu pedido *saiu para entrega* e já está a caminho. Prepare-se para receber!' },
  DELIVERED:        { icon: '🎉', message: 'Seu pedido foi *entregue*! Esperamos que aproveite. Bom apetite! 😋' },
  CANCELLED:        { icon: '❌', message: 'Infelizmente seu pedido foi *cancelado*. Em caso de dúvidas, entre em contato conosco.' },
  PAID:             { icon: '💰', message: 'Seu *pagamento foi confirmado*! Seu pedido será preparado em breve.' },
  PENDING:          { icon: '⏳', message: 'Seu pedido está *aguardando confirmação de pagamento*.' },
  REFUNDED:         { icon: '↩️', message: 'O *reembolso* do seu pedido foi processado. O valor será estornado conforme a forma de pagamento.' },
}

function buildWhatsAppMsg(order: Order, status: string, isPayment = false) {
  const cfg = WA_STATUS_CONFIG[status]
  if (!cfg) return null
  const itemsList = order.items.map(i => `  • ${i.quantity}x ${i.product.name}`).join('\n')
  const total = order.total.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' })
  const lines = [
    `${cfg.icon} *Rei da Quentinha*`,
    ``,
    `Olá, *${order.customerName}*!`,
    cfg.message,
    ``,
    `*Pedido:* #${order.id.slice(-6).toUpperCase()}`,
    `*Itens:*`,
    itemsList,
    ``,
    `*Total:* ${total}`,
    `*Pagamento:* ${PAYMENT_LABELS[order.paymentMethod] || order.paymentMethod}`,
  ]
  if (order.notes) lines.push(`*Obs:* ${order.notes}`)
  return lines.join('\n')
}

function openWhatsAppCustomer(order: Order, status: string, isPayment = false) {
  if (!order.customerPhone) return
  const msg = buildWhatsAppMsg(order, status, isPayment)
  if (!msg) return
  const phone = order.customerPhone.replace(/\D/g, '')
  const phoneWithCountry = phone.startsWith('55') ? phone : `55${phone}`
  window.open(`https://wa.me/${phoneWithCountry}?text=${encodeURIComponent(msg)}`, '_blank')
}

export default function AdminOrders() {
  const [orders, setOrders] = useState<Order[]>([])
  const [filter, setFilter] = useState('')
  const [motoboys, setMotoboys] = useState<Motoboy[]>([])
  const [selected, setSelected] = useState<Order | null>(null)
  const [loading, setLoading] = useState(false)
  const [sysConfig, setSysConfig] = useState({ whatsappCustomer: true, whatsappMotoboy: true })

  const load = () => {
    const url = filter ? `/api/orders?status=${filter}` : '/api/orders'
    fetch(url).then(r => r.json()).then(setOrders)
  }

  useEffect(() => { load() }, [filter])
  useEffect(() => { fetch('/api/motoboys').then(r => r.json()).then(setMotoboys) }, [])
  useEffect(() => {
    fetch('/api/config-system').then(r => r.ok ? r.json() : null).then(d => { if (d) setSysConfig(d) })
  }, [])

  const updateStatus = async (id: string, status: string, order: Order) => {
    setLoading(true)
    try {
      const res = await fetch(`/api/orders/${id}`, {
        method: 'PATCH',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ status }),
      })
      if (!res.ok) throw new Error()
      toast.success('Status atualizado!')
      load()
      if (selected?.id === id) setSelected(await res.json())
      if (sysConfig.whatsappCustomer) openWhatsAppCustomer(order, status)
    } catch {
      toast.error('Erro ao atualizar')
    } finally {
      setLoading(false)
    }
  }

  const updatePayment = async (id: string, paymentStatus: string, order: Order) => {
    const res = await fetch(`/api/orders/${id}`, {
      method: 'PATCH',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ paymentStatus }),
    })
    if (res.ok) {
      toast.success('Pagamento atualizado!')
      load()
      if (sysConfig.whatsappCustomer) openWhatsAppCustomer(order, paymentStatus, true)
    }
  }

  const assignMotoboy = async (id: string, motoboyId: string, order: Order) => {
    const res = await fetch(`/api/orders/${id}`, {
      method: 'PATCH',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ motoboyId: motoboyId || null }),
    })
    if (!res.ok) return
    toast.success('Motoboy atribuído!')
    load()

    if (!motoboyId || !sysConfig.whatsappMotoboy) return
    const motoboy = motoboys.find(m => m.id === motoboyId)
    if (!motoboy?.phone) return

    const phone = motoboy.phone.replace(/\D/g, '')
    const phoneWithCountry = phone.startsWith('55') ? phone : `55${phone}`
    const itemsList = order.items.map(i => `  • ${i.quantity}x ${i.product.name}`).join('\n')
    const total = order.total.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' })
    const msg = [
      `🛵 *Novo Pedido para Entrega* 🛵`,
      ``,
      `*Pedido:* #${order.id.slice(-6).toUpperCase()}`,
      `*Cliente:* ${order.customerName}`,
      `*Fone:* ${order.customerPhone}`,
      `*Endereço:* ${order.address}`,
      ``,
      `*Itens:*`,
      itemsList,
      ``,
      `*Total:* ${total}`,
      `*Pagamento:* ${PAYMENT_LABELS[order.paymentMethod] || order.paymentMethod}${order.paymentStatus === 'PAID' ? ' ✅ Pago' : ' ⏳ Aguardando'}`,
      order.notes ? `\n*Obs:* ${order.notes}` : '',
    ].filter(l => l !== undefined && l !== null).join('\n').trim()

    window.open(`https://wa.me/${phoneWithCountry}?text=${encodeURIComponent(msg)}`, '_blank')
  }

  const printOrder = (order: Order) => {
    const win = window.open('', '_blank', 'width=400,height=600')
    if (!win) return
    const items = order.items.map(i => `
      <tr>
        <td>${i.quantity}x ${i.product.name}</td>
        <td style="text-align:right">${(i.price * i.quantity).toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' })}</td>
      </tr>`).join('')
    win.document.write(`
      <!DOCTYPE html><html><head>
      <meta charset="utf-8">
      <title>Pedido #${order.id.slice(-6).toUpperCase()}</title>
      <style>
        body { font-family: monospace; max-width: 300px; margin: 0 auto; padding: 20px; font-size: 13px; }
        h2,h3 { text-align: center; margin: 4px 0; }
        hr { border: 1px dashed #999; }
        table { width: 100%; border-collapse: collapse; }
        td { padding: 2px 0; }
        .total { font-size: 16px; font-weight: bold; }
        .right { text-align: right; }
        @media print { button { display: none; } }
      </style>
      </head><body>
      <h2>REI DA QUENTINHA</h2>
      <h3>Pedido #${order.id.slice(-6).toUpperCase()}</h3>
      <p style="text-align:center;font-size:11px">${new Date(order.createdAt).toLocaleString('pt-BR')}</p>
      <hr>
      <p><strong>Cliente:</strong> ${order.customerName}</p>
      <p><strong>Fone:</strong> ${order.customerPhone}</p>
      <p><strong>End.:</strong> ${order.address}</p>
      ${order.notes ? `<p><strong>Obs:</strong> ${order.notes}</p>` : ''}
      <hr>
      <table>${items}</table>
      <hr>
      ${order.discount > 0 ? `<p class="right">Desconto: -${order.discount.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' })}</p>` : ''}
      <p class="total right">TOTAL: ${order.total.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' })}</p>
      <p><strong>Pagamento:</strong> ${PAYMENT_LABELS[order.paymentMethod] || order.paymentMethod}</p>
      <hr>
      <button onclick="window.print()">Imprimir</button>
      </body></html>`)
    win.document.close()
    setTimeout(() => win.print(), 500)
  }

  return (
    <div className="p-8">
      <div className="flex justify-between items-center mb-6">
        <h1 className="text-3xl font-bold text-gray-800">Pedidos</h1>
        <button onClick={load} className="btn-secondary flex items-center gap-2"><RefreshCw size={16} /> Atualizar</button>
      </div>

      <div className="flex gap-2 mb-6 flex-wrap">
        <button onClick={() => setFilter('')} className={`px-3 py-1.5 rounded-lg text-sm font-medium transition-colors ${!filter ? 'bg-brand-500 text-white' : 'bg-white text-gray-600 border hover:bg-gray-50'}`}>
          Todos
        </button>
        {STATUSES.map(s => (
          <button key={s} onClick={() => setFilter(s)} className={`px-3 py-1.5 rounded-lg text-sm font-medium transition-colors ${filter === s ? 'bg-brand-500 text-white' : 'bg-white text-gray-600 border hover:bg-gray-50'}`}>
            {STATUS_LABELS[s]}
          </button>
        ))}
      </div>

      <div className="grid grid-cols-1 xl:grid-cols-2 gap-4">
        {orders.map(order => (
          <div key={order.id} className="card p-5">
            <div className="flex justify-between items-start mb-3">
              <div>
                <span className="font-mono text-sm text-gray-500">#{order.id.slice(-6).toUpperCase()}</span>
                <p className="text-xs text-gray-400">{new Date(order.createdAt).toLocaleString('pt-BR', { day: '2-digit', month: '2-digit', year: 'numeric', hour: '2-digit', minute: '2-digit' })}</p>
                <h3 className="font-bold text-gray-800">{order.customerName}</h3>
                <p className="text-sm text-gray-500">{order.customerPhone}</p>
              </div>
              <div className="text-right">
                <span className={`px-2 py-0.5 rounded-full text-xs font-medium ${STATUS_COLORS[order.status]}`}>
                  {STATUS_LABELS[order.status]}
                </span>
                <p className="text-lg font-bold text-brand-500 mt-1">
                  {order.total.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' })}
                </p>
              </div>
            </div>

            <div className="text-sm text-gray-600 mb-3">
              <p className="truncate">{order.address}</p>
              <p>{order.items.map(i => `${i.quantity}x ${i.product.name}`).join(', ')}</p>
              <p className="mt-1">
                <span className={`inline-block px-2 py-0.5 rounded text-xs ${order.paymentStatus === 'PAID' ? 'bg-green-100 text-green-700' : 'bg-yellow-100 text-yellow-700'}`}>
                  {PAYMENT_LABELS[order.paymentMethod]} — {order.paymentStatus === 'PAID' ? 'Pago' : 'Aguardando'}
                </span>
              </p>
            </div>

            <div className="flex flex-wrap gap-2">
              <select
                value={order.status}
                onChange={e => updateStatus(order.id, e.target.value, order)}
                disabled={loading}
                className="text-sm border rounded-lg px-2 py-1 focus:outline-none focus:ring-1 focus:ring-brand-400"
              >
                {STATUSES.map(s => <option key={s} value={s}>{STATUS_LABELS[s]}</option>)}
              </select>

              <select
                value={order.paymentStatus}
                onChange={e => updatePayment(order.id, e.target.value, order)}
                className="text-sm border rounded-lg px-2 py-1 focus:outline-none focus:ring-1 focus:ring-brand-400"
              >
                <option value="PENDING">Pagto. Pendente</option>
                <option value="PAID">Pago</option>
                <option value="FAILED">Falhou</option>
              </select>

              <select
                value={order.motoboyId || ''}
                onChange={e => assignMotoboy(order.id, e.target.value, order)}
                className="text-sm border rounded-lg px-2 py-1 focus:outline-none focus:ring-1 focus:ring-brand-400"
              >
                <option value="">Motoboy...</option>
                {motoboys.filter(m => m).map(m => <option key={m.id} value={m.id}>{m.name}</option>)}
              </select>

              <button onClick={() => printOrder(order)} className="p-1.5 text-gray-500 hover:bg-gray-100 rounded" title="Imprimir">
                <Printer size={16} />
              </button>
            </div>

            {order.notes && <p className="text-xs text-gray-400 mt-2 italic">Obs: {order.notes}</p>}
          </div>
        ))}
        {orders.length === 0 && <div className="col-span-2 text-center py-20 text-gray-400">Nenhum pedido encontrado</div>}
      </div>
    </div>
  )
}
