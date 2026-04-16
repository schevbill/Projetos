import { prisma } from '@/lib/prisma'
import Navbar from '@/components/Navbar'
import Link from 'next/link'
import { CheckCircle, Package, Clock, Truck } from 'lucide-react'
import { notFound } from 'next/navigation'

export const dynamic = 'force-dynamic'

const STATUS_LABELS: Record<string, { label: string; color: string }> = {
  PENDING: { label: 'Aguardando confirmação', color: 'text-yellow-600' },
  CONFIRMED: { label: 'Confirmado', color: 'text-blue-600' },
  PREPARING: { label: 'Em preparo', color: 'text-orange-600' },
  READY: { label: 'Pronto para entrega', color: 'text-purple-600' },
  DELIVERING: { label: 'Saiu para entrega', color: 'text-indigo-600' },
  DELIVERED: { label: 'Entregue', color: 'text-green-600' },
  CANCELLED: { label: 'Cancelado', color: 'text-red-600' },
}

export default async function OrderPage({ params }: { params: { id: string } }) {
  const order = await prisma.order.findUnique({
    where: { id: params.id },
    include: { items: { include: { product: true } }, motoboy: true },
  })

  if (!order) return notFound()

  const status = STATUS_LABELS[order.status] || { label: order.status, color: 'text-gray-600' }

  return (
    <div className="min-h-screen">
      <Navbar />
      <main className="max-w-2xl mx-auto px-4 py-10">
        <div className="card p-8 text-center mb-6">
          <CheckCircle size={64} className="mx-auto text-green-500 mb-4" />
          <h1 className="text-2xl font-bold text-gray-800 mb-2">Pedido Realizado!</h1>
          <p className="text-gray-500">Pedido #{order.id.slice(-6).toUpperCase()}</p>
          <p className={`font-semibold mt-2 ${status.color}`}>{status.label}</p>
        </div>

        <div className="card p-6 mb-4">
          <h2 className="font-bold text-gray-800 mb-3 flex items-center gap-2">
            <Package size={18} className="text-orange-500" /> Itens do Pedido
          </h2>
          <div className="space-y-2">
            {order.items.map(item => (
              <div key={item.id} className="flex justify-between text-sm">
                <span className="text-gray-700">{item.quantity}x {item.product.name}</span>
                <span className="font-medium">
                  {(item.price * item.quantity).toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' })}
                </span>
              </div>
            ))}
          </div>
          <div className="border-t mt-4 pt-4">
            {order.discount > 0 && (
              <div className="flex justify-between text-green-600 text-sm mb-1">
                <span>Desconto</span>
                <span>- {order.discount.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' })}</span>
              </div>
            )}
            <div className="flex justify-between font-bold text-lg">
              <span>Total</span>
              <span className="text-orange-500">
                {order.total.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' })}
              </span>
            </div>
          </div>
        </div>

        <div className="card p-6 mb-4">
          <h2 className="font-bold text-gray-800 mb-3 flex items-center gap-2">
            <Truck size={18} className="text-orange-500" /> Entrega
          </h2>
          <p className="text-gray-600 text-sm">{order.customerName}</p>
          <p className="text-gray-600 text-sm">{order.customerPhone}</p>
          <p className="text-gray-600 text-sm">{order.address}</p>
          <p className="text-gray-600 text-sm mt-2">Pagamento: <strong>{order.paymentMethod}</strong></p>
          {order.motoboy && (
            <p className="text-gray-600 text-sm">Motoboy: <strong>{order.motoboy.name}</strong> — {order.motoboy.phone}</p>
          )}
        </div>

        <div className="card p-6 mb-6">
          <h2 className="font-bold text-gray-800 mb-3 flex items-center gap-2">
            <Clock size={18} className="text-orange-500" /> Acompanhe seu pedido
          </h2>
          <div className="space-y-2">
            {['PENDING','CONFIRMED','PREPARING','READY','DELIVERING','DELIVERED'].map((s, i) => {
              const statuses = ['PENDING','CONFIRMED','PREPARING','READY','DELIVERING','DELIVERED']
              const currentIdx = statuses.indexOf(order.status)
              const isDone = i <= currentIdx
              return (
                <div key={s} className={`flex items-center gap-3 text-sm ${isDone ? 'text-orange-500' : 'text-gray-300'}`}>
                  <div className={`w-3 h-3 rounded-full ${isDone ? 'bg-orange-500' : 'bg-gray-200'}`} />
                  {STATUS_LABELS[s]?.label || s}
                </div>
              )
            })}
          </div>
        </div>

        <Link href="/" className="btn-primary w-full flex items-center justify-center">
          Fazer Novo Pedido
        </Link>
      </main>
    </div>
  )
}
