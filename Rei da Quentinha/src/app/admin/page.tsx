'use client'
import { useEffect, useState, useCallback } from 'react'
import { ShoppingBag, DollarSign, Clock, TrendingUp, Star, BarChart2, CalendarDays, CheckCircle } from 'lucide-react'
import {
  ResponsiveContainer, AreaChart, Area, BarChart, Bar,
  XAxis, YAxis, CartesianGrid, Tooltip, Legend,
} from 'recharts'

interface DashboardData {
  totalOrders: number
  todayOrders: number
  pendingOrders: number
  deliveredOrders: number
  totalRevenue: number
  todayRevenue: number
  topProducts: { productId: string; _sum: { quantity: number | null }; product?: { name: string } }[]
  recentOrders: {
    id: string; customerName: string; total: number; status: string; paymentMethod: string; createdAt: string
    items: { quantity: number; product: { name: string } }[]
  }[]
}

interface ChartData {
  data: { date: string; label: string; pedidos: number; faturamento: number }[]
  totalPedidos: number
  totalFaturamento: number
  ticketMedio: number
}

const STATUS_COLORS: Record<string, string> = {
  PENDING: 'bg-yellow-100 text-yellow-700',
  CONFIRMED: 'bg-blue-100 text-blue-700',
  PREPARING: 'bg-brand-100 text-brand-700',
  READY: 'bg-purple-100 text-purple-700',
  DELIVERING: 'bg-indigo-100 text-indigo-700',
  DELIVERED: 'bg-green-100 text-green-700',
  CANCELLED: 'bg-red-100 text-red-700',
}
const STATUS_LABELS: Record<string, string> = {
  PENDING: 'Pendente', CONFIRMED: 'Confirmado', PREPARING: 'Preparando',
  READY: 'Pronto', DELIVERING: 'Entregando', DELIVERED: 'Entregue', CANCELLED: 'Cancelado',
}

function fmt(v: number) { return v.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' }) }

const PRESETS = [
  { label: 'Hoje', days: 1 },
  { label: '7 dias', days: 7 },
  { label: '15 dias', days: 15 },
  { label: '30 dias', days: 30 },
  { label: 'Este mês', days: 0 },
]

function getPresetRange(days: number) {
  const nowBrazil = new Date(Date.now() - 3 * 60 * 60 * 1000)
  const todayStr = nowBrazil.toISOString().split('T')[0]
  let fromStr: string
  if (days === 0) {
    fromStr = new Date(Date.UTC(nowBrazil.getUTCFullYear(), nowBrazil.getUTCMonth(), 1)).toISOString().split('T')[0]
  } else {
    const d = new Date(nowBrazil)
    d.setUTCDate(d.getUTCDate() - (days - 1))
    fromStr = d.toISOString().split('T')[0]
  }
  return { from: fromStr, to: todayStr }
}

const CustomTooltipOrders = ({ active, payload, label }: any) => {
  if (!active || !payload?.length) return null
  return (
    <div className="bg-white border border-gray-200 rounded-xl shadow-lg px-4 py-3 text-sm">
      <p className="font-semibold text-gray-700 mb-1">{label}</p>
      <p className="text-blue-600">{payload[0]?.value} pedidos</p>
    </div>
  )
}

const CustomTooltipRevenue = ({ active, payload, label }: any) => {
  if (!active || !payload?.length) return null
  return (
    <div className="bg-white border border-gray-200 rounded-xl shadow-lg px-4 py-3 text-sm">
      <p className="font-semibold text-gray-700 mb-1">{label}</p>
      <p className="text-green-600">{fmt(payload[0]?.value ?? 0)}</p>
    </div>
  )
}

export default function AdminDashboard() {
  const [data, setData] = useState<DashboardData | null>(null)
  const [loading, setLoading] = useState(true)
  const [chart, setChart] = useState<ChartData | null>(null)
  const [chartLoading, setChartLoading] = useState(false)
  const [preset, setPreset] = useState(30)
  const [from, setFrom] = useState(() => getPresetRange(30).from)
  const [to, setTo] = useState(() => getPresetRange(30).to)

  useEffect(() => {
    fetch('/api/dashboard', { cache: 'no-store' })
      .then(r => r.ok ? r.json() : null)
      .then(setData)
      .finally(() => setLoading(false))
  }, [])

  const loadChart = useCallback(async (f: string, t: string) => {
    setChartLoading(true)
    const res = await fetch(`/api/dashboard/charts?from=${f}&to=${t}`, { cache: 'no-store' })
    if (res.ok) setChart(await res.json())
    setChartLoading(false)
  }, [])

  useEffect(() => { loadChart(from, to) }, [from, to, loadChart])

  const applyPreset = (days: number) => {
    setPreset(days)
    const range = getPresetRange(days)
    setFrom(range.from)
    setTo(range.to)
  }

  if (loading) return (
    <div className="p-8 flex items-center justify-center h-full">
      <div className="animate-spin rounded-full h-10 w-10 border-b-2 border-brand-500" />
    </div>
  )
  if (!data) return <div className="p-8 text-red-500">Erro ao carregar dashboard</div>

  const stats = [
    { label: 'Pedidos Hoje',     value: data.todayOrders,     icon: ShoppingBag,   color: 'bg-blue-500' },
    { label: 'Pedidos Pendentes',value: data.pendingOrders,   icon: Clock,         color: 'bg-yellow-500' },
    { label: 'Pedidos Entregues',value: data.deliveredOrders, icon: CheckCircle,   color: 'bg-green-600' },
    { label: 'Faturamento Hoje', value: fmt(data.todayRevenue || 0), icon: DollarSign, color: 'bg-emerald-500' },
    { label: 'Faturamento Total',value: fmt(data.totalRevenue || 0), icon: TrendingUp,  color: 'bg-brand-500' },
  ]

  return (
    <div className="p-8">
      <h1 className="text-3xl font-bold text-gray-800 mb-8">Dashboard</h1>

      {/* Cards */}
      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-5 gap-6 mb-8">
        {stats.map(stat => (
          <div key={stat.label} className="card p-6 flex items-center gap-4">
            <div className={`${stat.color} text-white p-3 rounded-xl`}>
              <stat.icon size={24} />
            </div>
            <div>
              <p className="text-gray-500 text-sm">{stat.label}</p>
              <p className="text-2xl font-bold text-gray-800">{stat.value}</p>
            </div>
          </div>
        ))}
      </div>

      {/* Filtro de período */}
      <div className="card p-5 mb-6">
        <div className="flex flex-wrap items-center gap-3">
          <div className="flex items-center gap-2 text-gray-600 font-medium text-sm">
            <CalendarDays size={16} className="text-brand-500" />
            Período:
          </div>
          <div className="flex gap-1">
            {PRESETS.map(p => (
              <button key={p.label} onClick={() => applyPreset(p.days)}
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

        {/* Totais do período */}
        {chart && (
          <div className="grid grid-cols-3 gap-4 mt-4 pt-4 border-t border-gray-100">
            <div className="text-center">
              <p className="text-xs text-gray-400 mb-0.5">Pedidos no período</p>
              <p className="text-xl font-bold text-blue-600">{chart.totalPedidos}</p>
            </div>
            <div className="text-center">
              <p className="text-xs text-gray-400 mb-0.5">Faturamento no período</p>
              <p className="text-xl font-bold text-green-600">{fmt(chart.totalFaturamento)}</p>
            </div>
            <div className="text-center">
              <p className="text-xs text-gray-400 mb-0.5">Ticket médio</p>
              <p className="text-xl font-bold text-brand-600">{fmt(chart.ticketMedio || 0)}</p>
            </div>
          </div>
        )}
      </div>

      {/* Gráficos */}
      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6 mb-8">
        {/* Gráfico de Pedidos */}
        <div className="card p-6">
          <h2 className="text-base font-bold text-gray-800 mb-5 flex items-center gap-2">
            <BarChart2 size={18} className="text-blue-500" /> Pedidos por Dia
          </h2>
          {chartLoading ? (
            <div className="h-52 flex items-center justify-center">
              <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-blue-500" />
            </div>
          ) : (
            <ResponsiveContainer width="100%" height={220}>
              <BarChart data={chart?.data ?? []} margin={{ top: 4, right: 8, left: -20, bottom: 0 }}>
                <CartesianGrid strokeDasharray="3 3" stroke="#f0f0f0" vertical={false} />
                <XAxis dataKey="label" tick={{ fontSize: 11, fill: '#9ca3af' }} axisLine={false} tickLine={false} interval="preserveStartEnd" />
                <YAxis tick={{ fontSize: 11, fill: '#9ca3af' }} axisLine={false} tickLine={false} allowDecimals={false} />
                <Tooltip content={<CustomTooltipOrders />} />
                <Bar dataKey="pedidos" fill="#3b82f6" radius={[4, 4, 0, 0]} maxBarSize={40} />
              </BarChart>
            </ResponsiveContainer>
          )}
        </div>

        {/* Gráfico de Faturamento */}
        <div className="card p-6">
          <h2 className="text-base font-bold text-gray-800 mb-5 flex items-center gap-2">
            <TrendingUp size={18} className="text-green-500" /> Faturamento por Dia (R$)
          </h2>
          {chartLoading ? (
            <div className="h-52 flex items-center justify-center">
              <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-green-500" />
            </div>
          ) : (
            <ResponsiveContainer width="100%" height={220}>
              <AreaChart data={chart?.data ?? []} margin={{ top: 4, right: 8, left: -10, bottom: 0 }}>
                <defs>
                  <linearGradient id="gradRevenue" x1="0" y1="0" x2="0" y2="1">
                    <stop offset="5%" stopColor="#16a34a" stopOpacity={0.15} />
                    <stop offset="95%" stopColor="#16a34a" stopOpacity={0} />
                  </linearGradient>
                </defs>
                <CartesianGrid strokeDasharray="3 3" stroke="#f0f0f0" vertical={false} />
                <XAxis dataKey="label" tick={{ fontSize: 11, fill: '#9ca3af' }} axisLine={false} tickLine={false} interval="preserveStartEnd" />
                <YAxis tick={{ fontSize: 11, fill: '#9ca3af' }} axisLine={false} tickLine={false}
                  tickFormatter={v => v === 0 ? '0' : `${(v / 1000).toFixed(0)}k`} />
                <Tooltip content={<CustomTooltipRevenue />} />
                <Area type="monotone" dataKey="faturamento" stroke="#16a34a" strokeWidth={2}
                  fill="url(#gradRevenue)" dot={false} activeDot={{ r: 4, fill: '#16a34a' }} />
              </AreaChart>
            </ResponsiveContainer>
          )}
        </div>
      </div>

      {/* Pedidos recentes + Mais vendidos */}
      <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
        <div className="lg:col-span-2 card p-6">
          <h2 className="text-lg font-bold text-gray-800 mb-4">Pedidos Recentes</h2>
          <div className="overflow-x-auto">
            <table className="w-full text-sm">
              <thead>
                <tr className="border-b text-gray-500">
                  <th className="text-left pb-2">Pedido</th>
                  <th className="text-left pb-2">Cliente</th>
                  <th className="text-left pb-2">Itens</th>
                  <th className="text-left pb-2">Total</th>
                  <th className="text-left pb-2">Status</th>
                </tr>
              </thead>
              <tbody>
                {data.recentOrders.map(order => (
                  <tr key={order.id} className="border-b hover:bg-gray-50">
                    <td className="py-2 font-mono text-xs text-gray-500">#{order.id.slice(-6).toUpperCase()}</td>
                    <td className="py-2 font-medium">{order.customerName}</td>
                    <td className="py-2 text-gray-600 text-xs max-w-[180px] truncate">
                      {order.items.map(i => `${i.quantity}x ${i.product.name}`).join(', ')}
                    </td>
                    <td className="py-2 font-bold text-brand-500">{fmt(order.total)}</td>
                    <td className="py-2">
                      <span className={`px-2 py-0.5 rounded-full text-xs font-medium ${STATUS_COLORS[order.status] || 'bg-gray-100 text-gray-600'}`}>
                        {STATUS_LABELS[order.status] || order.status}
                      </span>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>

        <div className="card p-6">
          <h2 className="text-lg font-bold text-gray-800 mb-4 flex items-center gap-2">
            <Star size={18} className="text-brand-500" /> Mais Vendidos
          </h2>
          <div className="space-y-3">
            {data.topProducts.map((item, i) => (
              <div key={item.productId} className="flex items-center gap-3">
                <span className="w-6 h-6 bg-brand-100 text-brand-600 rounded-full flex items-center justify-center text-xs font-bold">
                  {i + 1}
                </span>
                <div className="flex-1">
                  <p className="text-sm font-medium text-gray-700">{item.product?.name || 'Produto'}</p>
                  <p className="text-xs text-gray-500">{item._sum.quantity} vendidos</p>
                </div>
              </div>
            ))}
            {data.topProducts.length === 0 && <p className="text-gray-400 text-sm">Nenhuma venda ainda</p>}
          </div>
        </div>
      </div>
    </div>
  )
}
