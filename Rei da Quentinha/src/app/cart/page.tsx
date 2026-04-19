'use client'
import { useCart } from '@/store/cart'
import Navbar from '@/components/Navbar'
import Link from 'next/link'
import { useRouter } from 'next/navigation'
import { useEffect, useState } from 'react'
import { Trash2, Plus, Minus, ShoppingBag, ArrowRight, LogIn } from 'lucide-react'

export default function CartPage() {
  const { items, removeItem, updateQuantity, total } = useCart()
  const router = useRouter()
  const [user, setUser] = useState<{ name: string } | null | undefined>(undefined)

  useEffect(() => {
    fetch('/api/auth/me')
      .then(r => r.ok ? r.json() : null)
      .then(data => setUser(data?.user ?? null))
      .catch(() => setUser(null))
  }, [])

  const handleCheckout = () => {
    if (!user) {
      router.push('/auth/login?redirect=/checkout')
    } else {
      router.push('/checkout')
    }
  }

  return (
    <div className="min-h-screen">
      <Navbar />
      <main className="max-w-4xl mx-auto px-4 py-10">
        <h1 className="text-3xl font-bold text-gray-800 mb-8">Carrinho de Compras</h1>

        {items.length === 0 ? (
          <div className="text-center py-20">
            <ShoppingBag size={64} className="mx-auto text-gray-300 mb-4" />
            <p className="text-xl text-gray-500 mb-6">Seu carrinho está vazio</p>
            <Link href="/" className="btn-primary inline-flex items-center gap-2">
              Ver Cardápio
            </Link>
          </div>
        ) : (
          <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
            <div className="lg:col-span-2 space-y-4">
              {items.map(item => (
                <div key={item.id} className="card p-4 flex items-center gap-4">
                  <div className="w-16 h-16 bg-brand-50 rounded-lg flex items-center justify-center flex-shrink-0">
                    {item.image ? (
                      <img src={item.image} alt={item.name} className="w-full h-full object-cover rounded-lg" />
                    ) : (
                      <ShoppingBag size={24} className="text-brand-400" />
                    )}
                  </div>
                  <div className="flex-1">
                    <h3 className="font-semibold text-gray-800">{item.name}</h3>
                    <p className="text-brand-600 font-bold">
                      {item.price.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' })}
                    </p>
                  </div>
                  <div className="flex items-center gap-2">
                    <button
                      onClick={() => updateQuantity(item.id, item.quantity - 1)}
                      className="w-8 h-8 rounded-full bg-gray-100 hover:bg-gray-200 flex items-center justify-center"
                    >
                      <Minus size={14} />
                    </button>
                    <span className="w-8 text-center font-semibold">{item.quantity}</span>
                    <button
                      onClick={() => updateQuantity(item.id, item.quantity + 1)}
                      className="w-8 h-8 rounded-full bg-gray-100 hover:bg-gray-200 flex items-center justify-center"
                    >
                      <Plus size={14} />
                    </button>
                  </div>
                  <div className="text-right">
                    <p className="font-bold text-gray-800">
                      {(item.price * item.quantity).toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' })}
                    </p>
                    <button onClick={() => removeItem(item.id)} className="text-red-400 hover:text-red-600 mt-1">
                      <Trash2 size={16} />
                    </button>
                  </div>
                </div>
              ))}
            </div>

            <div className="card p-6 h-fit sticky top-4">
              <h2 className="text-xl font-bold text-gray-800 mb-4">Resumo</h2>
              <div className="space-y-2 mb-4">
                {items.map(item => (
                  <div key={item.id} className="flex justify-between text-sm text-gray-600">
                    <span>{item.quantity}x {item.name}</span>
                    <span>{(item.price * item.quantity).toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' })}</span>
                  </div>
                ))}
              </div>
              <div className="border-t pt-4">
                <div className="flex justify-between font-bold text-lg text-gray-800">
                  <span>Total</span>
                  <span className="text-brand-600">
                    {total().toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' })}
                  </span>
                </div>
              </div>
              {user === undefined ? (
                <div className="btn-primary w-full mt-6 flex items-center justify-center gap-2 opacity-50 cursor-wait">
                  Carregando...
                </div>
              ) : user ? (
                <button
                  onClick={handleCheckout}
                  className="btn-primary w-full mt-6 flex items-center justify-center gap-2"
                >
                  Finalizar Pedido
                  <ArrowRight size={18} />
                </button>
              ) : (
                <div className="mt-6 space-y-2">
                  <p className="text-sm text-center text-gray-500">Faça login para finalizar o pedido</p>
                  <button
                    onClick={handleCheckout}
                    className="btn-primary w-full flex items-center justify-center gap-2"
                  >
                    <LogIn size={18} />
                    Entrar para Finalizar
                  </button>
                </div>
              )}
              <Link href="/" className="btn-secondary w-full mt-2 flex items-center justify-center text-sm">
                Continuar Comprando
              </Link>
            </div>
          </div>
        )}
      </main>
    </div>
  )
}
