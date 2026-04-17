'use client'
import { useEffect, useState } from 'react'
import { ShoppingBag, DollarSign, Clock, TrendingUp, Star } from 'lucide-react'

interface DashboardData {
  totalOrders: number
  todayOrders: number
  pendingOrders: number
  totalRevenue: number
  todayRevenue: number
  topProducts: { productId: string; _sum: { quantity: number | null }; product?: { name: string } }[]
  recentOrders: {
    id: string; customerName: string; total: number; status: string; paymentMethod: string; createdAt: string
    items: { quantity: number; product: { name: string } }[]
  }[]
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

export default function AdminDashboard() {
  const [data, setData] = useState<DashboardData | null>(null)
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    fetch('/api/dashboard').then(r => r.json()).then(setData).finally(() => setLoading(false))
  }, [])

  if (loading) return (
    <div className="p-8 flex items-center justify-center h-full">
      <div className="animate-spin rounded-full h-10 w-10 border-b-2 border-brand-500" />
    </div>
  )

  if (!data) return <div className="p-8 text-red-500">Erro ao carregar dashboard</div>

  const stats = [
    { label: 'Pedidos Hoje', value: data.todayOrders, icon: ShoppingBag, color: 'bg-blue-500' },
    { label: 'Faturamento Hoje', value: (data.todayRevenue || 0).toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' }), icon: DollarSign, color: 'bg-green-500' },
    { label: 'Pedidos Pendentes', value: data.pendingOrders, icon: Clock, color: 'bg-yellow-500' },
    { label: 'Faturamento Total', value: (data.totalRevenue || 0).toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' }), icon: TrendingUp, color: 'bg-brand-500' },
  ]

  return (
    <div className="p-8">
      <h1 className="text-3xl font-bold text-gray-800 mb-8">Dashboard</h1>

      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
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
                    <td className="py-2 text-gray-600 text-xs">
                      {order.items.map(i => `${i.quantity}x ${i.product.name}`).join(', ')}
                    </td>
                    <td className="py-2 font-bold text-brand-500">
                      {order.total.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' })}
                    </td>
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
