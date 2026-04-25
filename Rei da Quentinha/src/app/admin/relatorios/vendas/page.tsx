'use client'
import { useEffect, useState, useCallback } from 'react'
import Link from 'next/link'
import {
  ChevronLeft, CalendarDays, Printer, ShoppingBag,
  DollarSign, TrendingUp, XCircle, BarChart2, AlignLeft,
} from 'lucide-react'
import {
  ResponsiveContainer, BarChart, Bar, AreaChart, Area,
  PieChart, Pie, Cell, XAxis, YAxis, CartesianGrid,
  Tooltip, Legend,
} from 'recharts'

interface OrderItem { quantity: number; price: number; product: { name: string } }
interface Order {
  id: string; customerName: string; customerPhone: string; address: string
  items: OrderItem[]; subtotal: number; discount: number; total: number
  paymentMethod: string; paymentStatus: string; status: string
  createdAt: string; motoboy?: { name: string } | null
}

const PAYMENT_LABELS: Record<string, string> = {
  PIX: 'PIX', CREDIT_CARD: 'Cartão Crédito', DEBIT_CARD: 'Cartão Débito', CASH: 'Dinheiro',
}
const STATUS_LABELS: Record<string, string> = {
  PENDING: 'Pendente', CONFIRMED: 'Confirmado', PREPARING: 'Preparando',
  READY: 'Pronto', DELIVERING: 'Entregando', DELIVERED: 'Entregue', CANCELLED: 'Cancelado',
}
const STATUS_COLORS_CLASS: Record<string, string> = {
  PENDING: 'bg-yellow-100 text-yellow-700', CONFIRMED: 'bg-blue-100 text-blue-700',
  PREPARING: 'bg-orange-100 text-orange-700', READY: 'bg-purple-100 text-purple-700',
  DELIVERING: 'bg-indigo-100 text-indigo-700', DELIVERED: 'bg-green-100 text-green-700',
  CANCELLED: 'bg-red-100 text-red-700',
}
const PIE_COLORS = ['#e53e3e', '#3b82f6', '#16a34a', '#d97706', '#7c3aed', '#0891b2']
const STATUS_PIE_COLORS: Record<string, string> = {
  DELIVERED: '#16a34a', PENDING: '#d97706', CONFIRMED: '#3b82f6',
  PREPARING: '#f97316', DELIVERING: '#6366f1', CANCELLED: '#ef4444', READY: '#9333ea',
}

const PRESETS = [
  { label: 'Hoje', days: 1 }, { label: '7 dias', days: 7 },
  { label: '15 dias', days: 15 }, { label: '30 dias', days: 30 },
  { label: 'Este mês', days: 0 },
]

function getRange(days: number) {
  const nowBR = new Date(Date.now() - 3 * 60 * 60 * 1000)
  const today = nowBR.toISOString().split('T')[0]
  if (days === 0) {
    const from = new Date(Date.UTC(nowBR.getUTCFullYear(), nowBR.getUTCMonth(), 1)).toISOString().split('T')[0]
    return { from, to: today }
  }
  const d = new Date(nowBR)
  d.setUTCDate(d.getUTCDate() - (days - 1))
  return { from: d.toISOString().split('T')[0], to: today }
}

function fmt(v: number) { return v.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' }) }
function fmtDate(s: string) {
  return new Date(s).toLocaleString('pt-BR', { day: '2-digit', month: '2-digit', year: 'numeric', hour: '2-digit', minute: '2-digit' })
}
function fmtDateShort(s: string) {
  return new Date(s).toLocaleDateString('pt-BR', { day: '2-digit', month: '2-digit', year: 'numeric' })
}

const TooltipMoney = ({ active, payload, label }: any) => {
  if (!active || !payload?.length) return null
  return (
    <div className="bg-white border border-gray-200 rounded-xl shadow-lg px-4 py-3 text-sm">
      <p className="font-semibold text-gray-700 mb-1">{label}</p>
      {payload.map((p: any) => (
        <p key={p.dataKey} style={{ color: p.color }}>
          {p.name}: {p.dataKey === 'faturamento' ? fmt(p.value) : p.value}
        </p>
      ))}
    </div>
  )
}

export default function RelatorioVendas() {
  const [orders, setOrders] = useState<Order[]>([])
  const [loading, setLoading] = useState(false)
  const [preset, setPreset] = useState(7)
  const [from, setFrom] = useState(() => getRange(7).from)
  const [to, setTo] = useState(() => getRange(7).to)
  const [mode, setMode] = useState<'visual' | 'simples'>('simples')

  const load = useCallback(async (f: string, t: string) => {
    setLoading(true)
    const res = await fetch(`/api/orders?from=${f}&to=${t}`)
    if (res.ok) setOrders(await res.json())
    setLoading(false)
  }, [])

  useEffect(() => { load(from, to) }, [from, to, load])

  const applyPreset = (days: number) => {
    setPreset(days)
    const r = getRange(days)
    setFrom(r.from); setTo(r.to)
  }

  // ── Métricas ──
  const cancelled = orders.filter(o => o.status === 'CANCELLED')
  const paid = orders.filter(o => o.paymentStatus === 'PAID')
  const revenue = paid.reduce((s, o) => s + o.total, 0)
  const ticket = paid.length ? revenue / paid.length : 0

  const paymentBreakdown = paid.reduce<Record<string, number>>((acc, o) => {
    acc[o.paymentMethod] = (acc[o.paymentMethod] || 0) + o.total
    return acc
  }, {})

  // ── Dados dos gráficos ──
  const ordersByDay = Object.entries(
    orders.reduce<Record<string, { pedidos: number; faturamento: number }>>((acc, o) => {
      const day = new Date(o.createdAt).toLocaleDateString('pt-BR', { day: '2-digit', month: '2-digit' })
      if (!acc[day]) acc[day] = { pedidos: 0, faturamento: 0 }
      acc[day].pedidos++
      if (o.paymentStatus === 'PAID') acc[day].faturamento += o.total
      return acc
    }, {})
  ).map(([label, v]) => ({ label, ...v }))

  const paymentPie = Object.entries(paymentBreakdown).map(([name, value]) => ({
    name: PAYMENT_LABELS[name] ?? name, value,
  }))

  const statusCount = orders.reduce<Record<string, number>>((acc, o) => {
    acc[o.status] = (acc[o.status] || 0) + 1
    return acc
  }, {})
  const statusPie = Object.entries(statusCount).map(([name, value]) => ({
    name: STATUS_LABELS[name] ?? name, value, key: name,
  }))

  const topProducts = Object.entries(
    orders.flatMap(o => o.items).reduce<Record<string, number>>((acc, i) => {
      acc[i.product.name] = (acc[i.product.name] || 0) + i.quantity
      return acc
    }, {})
  )
    .sort((a, b) => b[1] - a[1])
    .slice(0, 6)
    .map(([name, qty]) => ({ name: name.length > 22 ? name.slice(0, 20) + '…' : name, qty }))

  const generatedAt = new Date().toLocaleString('pt-BR')

  return (
    <>
      <style>{`
        @media print {
          * { -webkit-print-color-adjust: exact !important; print-color-adjust: exact !important; }
          body { margin: 0; background: #fff !important; }
          aside { display: none !important; }
          main  { overflow: visible !important; }
          .no-print { display: none !important; }

          /* ── Modo Simples: exibe bloco texto ── */
          body[data-pmode="simples"] .rpt-wrap { display: block !important;
            font-family: 'Courier New', Courier, monospace; font-size: 10pt; color: #000; line-height: 1.5; }

          /* ── Modo Visual: exibe bloco com gráficos de barra CSS ── */
          body[data-pmode="visual"] .visual-rpt-wrap { display: block !important;
            font-family: Arial, sans-serif; font-size: 9.5pt; color: #000; line-height: 1.5; }
          .vr-co-name  { font-size: 15pt; font-weight: bold; text-transform: uppercase;
                         letter-spacing: 2px; text-align: center; margin-bottom: 2px; }
          .vr-co-sub   { font-size: 8.5pt; text-align: center; color: #444; margin-bottom: 2px; }
          .vr-title    { font-size: 12pt; font-weight: bold; text-transform: uppercase;
                         letter-spacing: 1px; text-align: center; margin: 4px 0; }
          .vr-period   { font-size: 8.5pt; text-align: center; color: #333; margin-bottom: 4px; }
          .vr-divider  { border: none; border-top: 1px solid #000; margin: 6px 0; }
          .vr-divider2 { border: none; border-top: 2px solid #000; margin: 6px 0; }
          .vr-sec      { font-weight: bold; font-size: 8.5pt; text-transform: uppercase;
                         letter-spacing: 1px; margin: 12px 0 6px; border-bottom: 1px solid #ddd; padding-bottom: 2px; }
          .vr-kpis     { display: grid !important; grid-template-columns: 1fr 1fr 1fr 1fr; gap: 6px; margin-bottom: 12px; }
          .vr-kpi      { border: 1px solid #e5e7eb; border-radius: 4px; padding: 6px 8px; }
          .vr-kpi-lbl  { font-size: 7.5pt; color: #666; }
          .vr-kpi-val  { font-size: 13pt; font-weight: bold; }
          .vr-cols2    { display: grid !important; grid-template-columns: 1fr 1fr; gap: 10px; margin-bottom: 12px; }
          .vr-cols3    { display: grid !important; grid-template-columns: 1fr 1fr 1fr; gap: 10px; margin-bottom: 12px; }
          .vr-chart-box{ border: 1px solid #e5e7eb; border-radius: 4px; padding: 8px; }
          .vr-chart-ttl{ font-weight: bold; font-size: 8pt; margin-bottom: 6px; text-transform: uppercase;
                         letter-spacing: 0.5px; color: #333; }
          .vr-bar-row  { display: flex !important; align-items: center; gap: 5px; margin-bottom: 3px; }
          .vr-bar-lbl  { font-size: 7.5pt; color: #444; flex-shrink: 0; width: 64px;
                         overflow: hidden; white-space: nowrap; text-overflow: ellipsis; }
          .vr-bar-lbl-w{ width: 90px; }
          .vr-bar-track{ flex: 1; background: #f3f4f6; height: 11px; border-radius: 2px; overflow: hidden; }
          .vr-bar-fill { height: 11px; border-radius: 2px; min-width: 2px; }
          .vr-bar-val  { font-size: 7.5pt; font-weight: bold; flex-shrink: 0; width: 42px; text-align: right; }
          .vr-table    { width: 100%; border-collapse: collapse; font-size: 7.5pt; margin-top: 4px; }
          .vr-table thead th { border-top: 1px solid #000; border-bottom: 1px solid #000;
            padding: 3px 5px; text-align: left; font-weight: bold; font-size: 7pt;
            text-transform: uppercase; letter-spacing: 0.5px; background: #f9fafb; }
          .vr-table thead th:last-child { text-align: right; }
          .vr-table tbody td { padding: 3px 5px; border-bottom: 1px solid #f0f0f0; vertical-align: top; }
          .vr-table tbody td:last-child { text-align: right; font-weight: bold; }
          .vr-table tfoot td { border-top: 1px solid #000; padding: 4px 5px; font-weight: bold; font-size: 8.5pt; }
          .vr-table tfoot td:last-child { text-align: right; }
          .vr-foot     { margin-top: 14px; font-size: 7.5pt; color: #666;
                         display: flex !important; justify-content: space-between;
                         border-top: 1px solid #ccc; padding-top: 5px; }

          /* ── Estilos do bloco texto ── */
          .rpt-co-name  { font-size: 16pt; font-weight: bold; text-transform: uppercase;
                          letter-spacing: 2px; text-align: center; margin-bottom: 2px; }
          .rpt-co-sub   { font-size: 9pt; text-align: center; color: #444; margin-bottom: 2px; }
          .rpt-divider  { border: none; border-top: 1px solid #000; margin: 6px 0; }
          .rpt-divider2 { border: none; border-top: 2px solid #000; margin: 6px 0; }
          .rpt-title    { font-size: 13pt; font-weight: bold; text-transform: uppercase;
                          letter-spacing: 1px; text-align: center; margin: 4px 0; }
          .rpt-period   { font-size: 9pt; text-align: center; color: #333; margin-bottom: 4px; }
          .rpt-summary  { margin: 10px 0; }
          .rpt-sum-row  { display: flex !important; justify-content: space-between;
                          border-bottom: 1px dotted #bbb; padding: 3px 0; font-size: 10pt; }
          .rpt-sum-label{ color: #444; }
          .rpt-sum-value{ font-weight: bold; }
          .rpt-pay-row  { display: flex !important; justify-content: space-between; padding: 2px 0; font-size: 9.5pt; }
          .rpt-table { width: 100%; border-collapse: collapse; font-size: 8.5pt;
                       font-family: 'Courier New', Courier, monospace; }
          .rpt-table thead th { border-top: 1px solid #000; border-bottom: 1px solid #000;
            padding: 4px 6px; text-align: left; font-weight: bold; font-size: 8pt;
            text-transform: uppercase; letter-spacing: 0.5px; }
          .rpt-table thead th:last-child { text-align: right; }
          .rpt-table tbody td { padding: 3px 6px; border-bottom: 1px dotted #ccc; vertical-align: top; }
          .rpt-table tbody td:last-child { text-align: right; font-weight: bold; }
          .rpt-table tfoot td { border-top: 1px solid #000; padding: 5px 6px; font-weight: bold; font-size: 10pt; }
          .rpt-table tfoot td:last-child { text-align: right; }
          .rpt-sec  { font-weight: bold; font-size: 9pt; text-transform: uppercase;
                      letter-spacing: 1px; margin: 10px 0 4px; }
          .rpt-foot { margin-top: 16px; font-size: 8pt; color: #666;
                      display: flex !important; justify-content: space-between; }
          @page { margin: 15mm 18mm; size: A4 portrait; }
        }
      `}</style>

      <div className="p-8">

        {/* ── Barra de ações ── */}
        <div className="no-print flex items-center justify-between mb-6 flex-wrap gap-3">
          <div className="flex items-center gap-3">
            <Link href="/admin/relatorios" className="text-gray-400 hover:text-gray-600 transition-colors">
              <ChevronLeft size={24} />
            </Link>
            <div>
              <h1 className="text-3xl font-bold text-gray-800">Relatório de Vendas</h1>
              <p className="text-gray-500 text-sm">Pedidos e faturamento por período</p>
            </div>
          </div>
          <div className="flex items-center gap-3">
            {/* Toggle simples / visual */}
            <div className="flex bg-gray-100 rounded-xl p-1 gap-1">
              <button
                onClick={() => setMode('simples')}
                className={`flex items-center gap-1.5 px-4 py-2 rounded-lg text-sm font-medium transition-all ${mode === 'simples' ? 'bg-white shadow text-brand-600' : 'text-gray-500 hover:text-gray-700'}`}
              >
                <AlignLeft size={15} /> Simples
              </button>
              <button
                onClick={() => setMode('visual')}
                className={`flex items-center gap-1.5 px-4 py-2 rounded-lg text-sm font-medium transition-all ${mode === 'visual' ? 'bg-white shadow text-brand-600' : 'text-gray-500 hover:text-gray-700'}`}
              >
                <BarChart2 size={15} /> Com Gráficos
              </button>
            </div>
            <button onClick={() => {
              document.body.setAttribute('data-pmode', mode)
              requestAnimationFrame(() => { window.print(); document.body.removeAttribute('data-pmode') })
            }} className="btn-primary flex items-center gap-2">
              <Printer size={16} /> Imprimir / PDF
            </button>
          </div>
        </div>

        {/* ── Filtro de período ── */}
        <div className="no-print card p-4 mb-6">
          <div className="flex flex-wrap items-center gap-3">
            <div className="flex items-center gap-2 text-gray-600 font-medium text-sm">
              <CalendarDays size={16} className="text-brand-500" /> Período:
            </div>
            <div className="flex gap-1 flex-wrap">
              {PRESETS.map(p => (
                <button key={p.days} onClick={() => applyPreset(p.days)}
                  className={`px-3 py-1.5 rounded-lg text-sm font-medium transition-all ${preset === p.days ? 'bg-brand-500 text-white' : 'bg-gray-100 text-gray-600 hover:bg-gray-200'}`}>
                  {p.label}
                </button>
              ))}
            </div>
            <div className="flex items-center gap-2 ml-auto">
              <input type="date" value={from} onChange={e => { setFrom(e.target.value); setPreset(-1) }}
                className="input-field text-sm py-1.5 w-36" />
              <span className="text-gray-400 text-sm">até</span>
              <input type="date" value={to} onChange={e => { setTo(e.target.value); setPreset(-1) }}
                className="input-field text-sm py-1.5 w-36" />
            </div>
          </div>
        </div>

        {loading ? (
          <div className="flex items-center justify-center py-20">
            <div className="w-8 h-8 border-4 border-brand-500 border-t-transparent rounded-full animate-spin" />
          </div>
        ) : (
          <>
            {/* ════════════════════════════
                MODO VISUAL — COM GRÁFICOS
            ════════════════════════════ */}
            {mode === 'visual' && (
              <div className="visual-content no-print space-y-6">

                {/* Cards métricas */}
                <div className="grid grid-cols-2 lg:grid-cols-4 gap-4">
                  <div className="card p-5 flex items-center gap-3">
                    <div className="bg-blue-500 text-white p-2.5 rounded-xl"><ShoppingBag size={20} /></div>
                    <div><p className="text-gray-500 text-xs">Total de Pedidos</p><p className="text-2xl font-bold text-gray-800">{orders.length}</p></div>
                  </div>
                  <div className="card p-5 flex items-center gap-3">
                    <div className="bg-emerald-500 text-white p-2.5 rounded-xl"><DollarSign size={20} /></div>
                    <div><p className="text-gray-500 text-xs">Faturamento</p><p className="text-2xl font-bold text-gray-800">{fmt(revenue)}</p></div>
                  </div>
                  <div className="card p-5 flex items-center gap-3">
                    <div className="bg-brand-500 text-white p-2.5 rounded-xl"><TrendingUp size={20} /></div>
                    <div><p className="text-gray-500 text-xs">Ticket Médio</p><p className="text-2xl font-bold text-gray-800">{fmt(ticket)}</p></div>
                  </div>
                  <div className="card p-5 flex items-center gap-3">
                    <div className="bg-red-500 text-white p-2.5 rounded-xl"><XCircle size={20} /></div>
                    <div><p className="text-gray-500 text-xs">Cancelados</p><p className="text-2xl font-bold text-gray-800">{cancelled.length}</p></div>
                  </div>
                </div>

                {/* Gráficos linha 1: Pedidos por dia + Faturamento por dia */}
                <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
                  <div className="card p-6">
                    <h2 className="text-base font-bold text-gray-800 mb-4">Pedidos por Dia</h2>
                    {ordersByDay.length > 0 ? (
                      <ResponsiveContainer width="100%" height={220}>
                        <BarChart data={ordersByDay} margin={{ top: 4, right: 8, left: -20, bottom: 0 }}>
                          <CartesianGrid strokeDasharray="3 3" stroke="#f0f0f0" vertical={false} />
                          <XAxis dataKey="label" tick={{ fontSize: 11, fill: '#9ca3af' }} axisLine={false} tickLine={false} />
                          <YAxis tick={{ fontSize: 11, fill: '#9ca3af' }} axisLine={false} tickLine={false} allowDecimals={false} />
                          <Tooltip content={<TooltipMoney />} />
                          <Bar dataKey="pedidos" name="Pedidos" fill="#3b82f6" radius={[4, 4, 0, 0]} maxBarSize={40} />
                        </BarChart>
                      </ResponsiveContainer>
                    ) : <p className="text-gray-400 text-sm text-center py-16">Sem dados no período</p>}
                  </div>

                  <div className="card p-6">
                    <h2 className="text-base font-bold text-gray-800 mb-4">Faturamento por Dia (R$)</h2>
                    {ordersByDay.length > 0 ? (
                      <ResponsiveContainer width="100%" height={220}>
                        <AreaChart data={ordersByDay} margin={{ top: 4, right: 8, left: -10, bottom: 0 }}>
                          <defs>
                            <linearGradient id="gradVendas" x1="0" y1="0" x2="0" y2="1">
                              <stop offset="5%" stopColor="#16a34a" stopOpacity={0.15} />
                              <stop offset="95%" stopColor="#16a34a" stopOpacity={0} />
                            </linearGradient>
                          </defs>
                          <CartesianGrid strokeDasharray="3 3" stroke="#f0f0f0" vertical={false} />
                          <XAxis dataKey="label" tick={{ fontSize: 11, fill: '#9ca3af' }} axisLine={false} tickLine={false} />
                          <YAxis tick={{ fontSize: 11, fill: '#9ca3af' }} axisLine={false} tickLine={false}
                            tickFormatter={v => v === 0 ? '0' : `${(v / 1000).toFixed(0)}k`} />
                          <Tooltip content={<TooltipMoney />} />
                          <Area type="monotone" dataKey="faturamento" name="Faturamento" stroke="#16a34a"
                            strokeWidth={2} fill="url(#gradVendas)" dot={false} activeDot={{ r: 4, fill: '#16a34a' }} />
                        </AreaChart>
                      </ResponsiveContainer>
                    ) : <p className="text-gray-400 text-sm text-center py-16">Sem dados no período</p>}
                  </div>
                </div>

                {/* Gráficos linha 2: Pagamentos + Status + Top Produtos */}
                <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">

                  {/* Pizza: formas de pagamento */}
                  <div className="card p-6">
                    <h2 className="text-base font-bold text-gray-800 mb-4">Formas de Pagamento</h2>
                    {paymentPie.length > 0 ? (
                      <>
                        <ResponsiveContainer width="100%" height={180}>
                          <PieChart>
                            <Pie data={paymentPie} cx="50%" cy="50%" innerRadius={45} outerRadius={75}
                              dataKey="value" paddingAngle={3}>
                              {paymentPie.map((_, i) => <Cell key={i} fill={PIE_COLORS[i % PIE_COLORS.length]} />)}
                            </Pie>
                            <Tooltip formatter={(v: number) => fmt(v)} />
                          </PieChart>
                        </ResponsiveContainer>
                        <div className="space-y-1.5 mt-2">
                          {paymentPie.map((p, i) => (
                            <div key={p.name} className="flex items-center justify-between text-sm">
                              <div className="flex items-center gap-2">
                                <div className="w-2.5 h-2.5 rounded-full flex-shrink-0" style={{ background: PIE_COLORS[i % PIE_COLORS.length] }} />
                                <span className="text-gray-600">{p.name}</span>
                              </div>
                              <span className="font-semibold text-gray-800">{fmt(p.value)}</span>
                            </div>
                          ))}
                        </div>
                      </>
                    ) : <p className="text-gray-400 text-sm text-center py-16">Sem dados</p>}
                  </div>

                  {/* Pizza: status dos pedidos */}
                  <div className="card p-6">
                    <h2 className="text-base font-bold text-gray-800 mb-4">Status dos Pedidos</h2>
                    {statusPie.length > 0 ? (
                      <>
                        <ResponsiveContainer width="100%" height={180}>
                          <PieChart>
                            <Pie data={statusPie} cx="50%" cy="50%" innerRadius={45} outerRadius={75}
                              dataKey="value" paddingAngle={3}>
                              {statusPie.map((s) => (
                                <Cell key={s.key} fill={STATUS_PIE_COLORS[s.key] ?? '#94a3b8'} />
                              ))}
                            </Pie>
                            <Tooltip />
                          </PieChart>
                        </ResponsiveContainer>
                        <div className="space-y-1.5 mt-2">
                          {statusPie.map(s => (
                            <div key={s.key} className="flex items-center justify-between text-sm">
                              <div className="flex items-center gap-2">
                                <div className="w-2.5 h-2.5 rounded-full flex-shrink-0"
                                  style={{ background: STATUS_PIE_COLORS[s.key] ?? '#94a3b8' }} />
                                <span className="text-gray-600">{s.name}</span>
                              </div>
                              <span className="font-semibold text-gray-800">{s.value}</span>
                            </div>
                          ))}
                        </div>
                      </>
                    ) : <p className="text-gray-400 text-sm text-center py-16">Sem dados</p>}
                  </div>

                  {/* Barras horizontais: top produtos */}
                  <div className="card p-6">
                    <h2 className="text-base font-bold text-gray-800 mb-4">Produtos Mais Vendidos</h2>
                    {topProducts.length > 0 ? (
                      <ResponsiveContainer width="100%" height={220}>
                        <BarChart data={topProducts} layout="vertical"
                          margin={{ top: 0, right: 16, left: 0, bottom: 0 }}>
                          <CartesianGrid strokeDasharray="3 3" stroke="#f0f0f0" horizontal={false} />
                          <XAxis type="number" tick={{ fontSize: 11, fill: '#9ca3af' }} axisLine={false} tickLine={false} allowDecimals={false} />
                          <YAxis type="category" dataKey="name" tick={{ fontSize: 10, fill: '#6b7280' }}
                            axisLine={false} tickLine={false} width={90} />
                          <Tooltip formatter={(v: number) => [`${v} un.`, 'Vendidos']} />
                          <Bar dataKey="qty" name="Vendidos" fill="#e53e3e" radius={[0, 4, 4, 0]} maxBarSize={18} />
                        </BarChart>
                      </ResponsiveContainer>
                    ) : <p className="text-gray-400 text-sm text-center py-16">Sem dados</p>}
                  </div>
                </div>

                {/* Cabeçalho visível apenas no print do modo visual */}
                <div className="visual-print-header hidden">
                  <div style={{ textAlign: 'center', fontWeight: 'bold', fontSize: '16pt', textTransform: 'uppercase', letterSpacing: '2px' }}>Rei da Quentinha</div>
                  <div style={{ textAlign: 'center', fontSize: '9pt', color: '#444', marginBottom: '4px' }}>Painel Administrativo</div>
                  <div style={{ borderTop: '2px solid #000', margin: '6px 0' }} />
                  <div style={{ textAlign: 'center', fontWeight: 'bold', fontSize: '13pt', textTransform: 'uppercase', letterSpacing: '1px' }}>Relatório de Vendas — Com Gráficos</div>
                  <div style={{ textAlign: 'center', fontSize: '9pt', color: '#333', marginBottom: '8px' }}>
                    Período: {fmtDateShort(from)} a {fmtDateShort(to)} &nbsp;|&nbsp; Gerado em: {generatedAt}
                  </div>
                  <div style={{ borderTop: '1px solid #000', margin: '6px 0 12px' }} />
                </div>

                {/* Tabela de pedidos */}
                <div className="card overflow-hidden">
                  <div className="p-5 border-b border-gray-100 flex items-center justify-between">
                    <h2 className="font-bold text-gray-800">Detalhamento dos Pedidos</h2>
                    <span className="text-sm text-gray-500">{orders.length} pedido{orders.length !== 1 ? 's' : ''}</span>
                  </div>
                  <div className="overflow-x-auto">
                    <table className="w-full text-sm">
                      <thead className="bg-gray-50 text-gray-500 text-xs uppercase">
                        <tr>
                          <th className="text-left px-4 py-3">Data/Hora</th>
                          <th className="text-left px-4 py-3">Pedido</th>
                          <th className="text-left px-4 py-3">Cliente</th>
                          <th className="text-left px-4 py-3">Itens</th>
                          <th className="text-left px-4 py-3">Pagamento</th>
                          <th className="text-left px-4 py-3">Status</th>
                          <th className="text-right px-4 py-3">Total</th>
                        </tr>
                      </thead>
                      <tbody className="divide-y divide-gray-100">
                        {orders.map(o => (
                          <tr key={o.id} className="hover:bg-gray-50">
                            <td className="px-4 py-3 text-gray-500 whitespace-nowrap text-xs">{fmtDate(o.createdAt)}</td>
                            <td className="px-4 py-3 font-mono text-xs text-gray-500">#{o.id.slice(-6).toUpperCase()}</td>
                            <td className="px-4 py-3 font-medium text-gray-800">{o.customerName}</td>
                            <td className="px-4 py-3 text-gray-600 max-w-[180px]">
                              <span className="truncate block text-xs">{o.items.map(i => `${i.quantity}x ${i.product.name}`).join(', ')}</span>
                            </td>
                            <td className="px-4 py-3">
                              <span className={`text-xs px-2 py-0.5 rounded-full ${o.paymentStatus === 'PAID' ? 'bg-green-100 text-green-700' : 'bg-yellow-100 text-yellow-700'}`}>
                                {PAYMENT_LABELS[o.paymentMethod] ?? o.paymentMethod}
                              </span>
                            </td>
                            <td className="px-4 py-3">
                              <span className={`text-xs px-2 py-0.5 rounded-full font-medium ${STATUS_COLORS_CLASS[o.status] ?? 'bg-gray-100 text-gray-600'}`}>
                                {STATUS_LABELS[o.status] ?? o.status}
                              </span>
                            </td>
                            <td className="px-4 py-3 text-right font-bold text-gray-800 whitespace-nowrap">{fmt(o.total)}</td>
                          </tr>
                        ))}
                        {orders.length === 0 && (
                          <tr><td colSpan={7} className="px-4 py-12 text-center text-gray-400">Nenhum pedido no período</td></tr>
                        )}
                      </tbody>
                      {orders.length > 0 && (
                        <tfoot className="bg-gray-50 font-bold">
                          <tr>
                            <td colSpan={6} className="px-4 py-3 text-right text-gray-700">Total Faturado (pagos):</td>
                            <td className="px-4 py-3 text-right text-emerald-700">{fmt(revenue)}</td>
                          </tr>
                        </tfoot>
                      )}
                    </table>
                  </div>
                </div>
              {/* Rodapé visível apenas no print do modo visual */}
              <div className="visual-foot hidden">
                <span>Rei da Quentinha — Relatório de Vendas</span>
                <span>{generatedAt}</span>
              </div>
            </div>
            )}

            {/* ════════════════════════════
                MODO SIMPLES — TEXTO
            ════════════════════════════ */}
            {mode === 'simples' && (
              <div className="no-print space-y-6">

                {/* Cards métricas */}
                <div className="grid grid-cols-2 lg:grid-cols-4 gap-4">
                  <div className="card p-5 flex items-center gap-3">
                    <div className="bg-blue-500 text-white p-2.5 rounded-xl"><ShoppingBag size={20} /></div>
                    <div><p className="text-gray-500 text-xs">Total de Pedidos</p><p className="text-2xl font-bold text-gray-800">{orders.length}</p></div>
                  </div>
                  <div className="card p-5 flex items-center gap-3">
                    <div className="bg-emerald-500 text-white p-2.5 rounded-xl"><DollarSign size={20} /></div>
                    <div><p className="text-gray-500 text-xs">Faturamento</p><p className="text-2xl font-bold text-gray-800">{fmt(revenue)}</p></div>
                  </div>
                  <div className="card p-5 flex items-center gap-3">
                    <div className="bg-brand-500 text-white p-2.5 rounded-xl"><TrendingUp size={20} /></div>
                    <div><p className="text-gray-500 text-xs">Ticket Médio</p><p className="text-2xl font-bold text-gray-800">{fmt(ticket)}</p></div>
                  </div>
                  <div className="card p-5 flex items-center gap-3">
                    <div className="bg-red-500 text-white p-2.5 rounded-xl"><XCircle size={20} /></div>
                    <div><p className="text-gray-500 text-xs">Cancelados</p><p className="text-2xl font-bold text-gray-800">{cancelled.length}</p></div>
                  </div>
                </div>

                {/* Pagamento simples */}
                {paid.length > 0 && (
                  <div className="card p-5">
                    <h2 className="text-sm font-bold text-gray-700 mb-3">Faturamento por Forma de Pagamento</h2>
                    <div className="flex flex-wrap gap-6">
                      {Object.entries(paymentBreakdown).map(([method, total]) => (
                        <div key={method} className="flex items-center gap-2">
                          <span className="text-sm font-medium text-gray-500">{PAYMENT_LABELS[method] ?? method}:</span>
                          <span className="text-sm font-bold text-emerald-700">{fmt(total)}</span>
                        </div>
                      ))}
                    </div>
                  </div>
                )}

                {/* Tabela simples */}
                <div className="card overflow-hidden">
                  <div className="p-5 border-b border-gray-100 flex items-center justify-between">
                    <h2 className="font-bold text-gray-800">Detalhamento dos Pedidos</h2>
                    <span className="text-sm text-gray-500">{orders.length} pedido{orders.length !== 1 ? 's' : ''}</span>
                  </div>
                  <div className="overflow-x-auto">
                    <table className="w-full text-sm">
                      <thead className="bg-gray-50 text-gray-500 text-xs uppercase">
                        <tr>
                          <th className="text-left px-4 py-3">Data/Hora</th>
                          <th className="text-left px-4 py-3">Pedido</th>
                          <th className="text-left px-4 py-3">Cliente</th>
                          <th className="text-left px-4 py-3">Itens</th>
                          <th className="text-left px-4 py-3">Pagamento</th>
                          <th className="text-left px-4 py-3">Status</th>
                          <th className="text-right px-4 py-3">Total</th>
                        </tr>
                      </thead>
                      <tbody className="divide-y divide-gray-100">
                        {orders.map(o => (
                          <tr key={o.id} className="hover:bg-gray-50">
                            <td className="px-4 py-3 text-gray-500 whitespace-nowrap text-xs">{fmtDate(o.createdAt)}</td>
                            <td className="px-4 py-3 font-mono text-xs text-gray-500">#{o.id.slice(-6).toUpperCase()}</td>
                            <td className="px-4 py-3 font-medium text-gray-800">{o.customerName}</td>
                            <td className="px-4 py-3 text-gray-600 max-w-[180px]">
                              <span className="truncate block text-xs">{o.items.map(i => `${i.quantity}x ${i.product.name}`).join(', ')}</span>
                            </td>
                            <td className="px-4 py-3">
                              <span className={`text-xs px-2 py-0.5 rounded-full ${o.paymentStatus === 'PAID' ? 'bg-green-100 text-green-700' : 'bg-yellow-100 text-yellow-700'}`}>
                                {PAYMENT_LABELS[o.paymentMethod] ?? o.paymentMethod}
                              </span>
                            </td>
                            <td className="px-4 py-3">
                              <span className={`text-xs px-2 py-0.5 rounded-full font-medium ${STATUS_COLORS_CLASS[o.status] ?? 'bg-gray-100 text-gray-600'}`}>
                                {STATUS_LABELS[o.status] ?? o.status}
                              </span>
                            </td>
                            <td className="px-4 py-3 text-right font-bold text-gray-800 whitespace-nowrap">{fmt(o.total)}</td>
                          </tr>
                        ))}
                        {orders.length === 0 && (
                          <tr><td colSpan={7} className="px-4 py-12 text-center text-gray-400">Nenhum pedido no período</td></tr>
                        )}
                      </tbody>
                      {orders.length > 0 && (
                        <tfoot className="bg-gray-50 font-bold">
                          <tr>
                            <td colSpan={6} className="px-4 py-3 text-right text-gray-700">Total Faturado (pagos):</td>
                            <td className="px-4 py-3 text-right text-emerald-700">{fmt(revenue)}</td>
                          </tr>
                        </tfoot>
                      )}
                    </table>
                  </div>
                </div>
              </div>
            )}

            {/* ════════════════════════════
                BLOCO IMPRESSO (texto puro)
            ════════════════════════════ */}
            <div className="rpt-wrap hidden">
              <div className="rpt-co-name">Rei da Quentinha</div>
              <div className="rpt-co-sub">Painel Administrativo</div>
              <hr className="rpt-divider2" />
              <div className="rpt-title">Relatório de Vendas</div>
              <div className="rpt-period">
                Período: {fmtDateShort(from)} a {fmtDateShort(to)} &nbsp;|&nbsp; Gerado em: {generatedAt}
              </div>
              <hr className="rpt-divider" />

              <div className="rpt-sec">Resumo do Período</div>
              <div className="rpt-summary">
                <div className="rpt-sum-row"><span className="rpt-sum-label">Total de pedidos</span><span className="rpt-sum-value">{orders.length}</span></div>
                <div className="rpt-sum-row"><span className="rpt-sum-label">Pedidos pagos</span><span className="rpt-sum-value">{paid.length}</span></div>
                <div className="rpt-sum-row"><span className="rpt-sum-label">Pedidos cancelados</span><span className="rpt-sum-value">{cancelled.length}</span></div>
                <div className="rpt-sum-row"><span className="rpt-sum-label">Faturamento total (pagos)</span><span className="rpt-sum-value">{fmt(revenue)}</span></div>
                <div className="rpt-sum-row"><span className="rpt-sum-label">Ticket médio</span><span className="rpt-sum-value">{fmt(ticket)}</span></div>
              </div>

              {paid.length > 0 && (
                <>
                  <div className="rpt-sec" style={{ marginTop: '12px' }}>Faturamento por Forma de Pagamento</div>
                  <hr className="rpt-divider" />
                  {Object.entries(paymentBreakdown).map(([method, total]) => (
                    <div key={method} className="rpt-pay-row">
                      <span>{PAYMENT_LABELS[method] ?? method}</span>
                      <span style={{ fontWeight: 'bold' }}>{fmt(total)}</span>
                    </div>
                  ))}
                  <hr className="rpt-divider" />
                </>
              )}

              <div className="rpt-sec" style={{ marginTop: '12px' }}>
                Detalhamento dos Pedidos ({orders.length} registro{orders.length !== 1 ? 's' : ''})
              </div>
              <table className="rpt-table">
                <thead>
                  <tr>
                    <th>Data/Hora</th><th>Pedido</th><th>Cliente</th>
                    <th>Itens</th><th>Pagamento</th><th>Status</th>
                    <th style={{ textAlign: 'right' }}>Total</th>
                  </tr>
                </thead>
                <tbody>
                  {orders.map(o => (
                    <tr key={o.id}>
                      <td style={{ whiteSpace: 'nowrap' }}>{fmtDate(o.createdAt)}</td>
                      <td>#{o.id.slice(-6).toUpperCase()}</td>
                      <td>{o.customerName}</td>
                      <td>{o.items.map(i => `${i.quantity}x ${i.product.name}`).join(', ')}</td>
                      <td>{PAYMENT_LABELS[o.paymentMethod] ?? o.paymentMethod}{o.paymentStatus === 'PAID' ? ' [P]' : ''}</td>
                      <td>{STATUS_LABELS[o.status] ?? o.status}</td>
                      <td>{fmt(o.total)}</td>
                    </tr>
                  ))}
                  {orders.length === 0 && (
                    <tr><td colSpan={7} style={{ textAlign: 'center', padding: '12px' }}>Nenhum pedido no período</td></tr>
                  )}
                </tbody>
                {orders.length > 0 && (
                  <tfoot>
                    <tr>
                      <td colSpan={6} style={{ textAlign: 'right' }}>TOTAL FATURADO (pagos):</td>
                      <td>{fmt(revenue)}</td>
                    </tr>
                  </tfoot>
                )}
              </table>

              <div className="rpt-foot">
                <span>Rei da Quentinha — Relatório de Vendas</span>
                <span>{generatedAt}</span>
              </div>
            </div>
          </>
        )}
      </div>
    </>
  )
}
