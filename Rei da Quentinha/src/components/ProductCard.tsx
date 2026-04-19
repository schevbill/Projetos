'use client'
import { useCart } from '@/store/cart'
import toast from 'react-hot-toast'
import { ShoppingCart, Flame } from 'lucide-react'

interface Product {
  id: string
  name: string
  description?: string | null
  price: number
  image?: string | null
  category?: string | null
  categoryRel?: { name: string } | null
  available: boolean
}

export default function ProductCard({ product }: { product: Product }) {
  const { addItem } = useCart()

  const handleAdd = () => {
    addItem({ id: product.id, name: product.name, price: product.price, image: product.image })
    toast.success(`${product.name} adicionado!`)
  }

  return (
    <div className="group card overflow-hidden hover:shadow-hover transition-all duration-200 hover:-translate-y-0.5">
      <div className="h-44 bg-gradient-to-br from-brand-50 to-brand-100 flex items-center justify-center overflow-hidden relative">
        {product.image ? (
          <img src={product.image} alt={product.name} className="h-full w-full object-cover group-hover:scale-105 transition-transform duration-300" />
        ) : (
          <Flame size={52} className="text-brand-300" />
        )}
        {!product.available && (
          <div className="absolute inset-0 bg-black/50 flex items-center justify-center">
            <span className="bg-gray-800 text-white text-xs font-bold px-3 py-1 rounded-full">Indisponível</span>
          </div>
        )}
      </div>
      <div className="p-4">
        {(product.categoryRel?.name || product.category) && (
          <span className="text-xs text-brand-500 font-bold uppercase tracking-wider">{product.categoryRel?.name || product.category}</span>
        )}
        <h3 className="font-bold text-gray-900 mt-1 text-base">{product.name}</h3>
        {product.description && (
          <p className="text-gray-500 text-sm mt-1 line-clamp-2 leading-relaxed">{product.description}</p>
        )}
        <div className="flex items-center justify-between mt-4">
          <div>
            <span className="text-2xl font-extrabold text-brand-600">
              {product.price.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' })}
            </span>
          </div>
          <button
            onClick={handleAdd}
            disabled={!product.available}
            className="btn-primary flex items-center gap-1.5 py-2 px-3 text-sm disabled:opacity-50 disabled:cursor-not-allowed"
          >
            <ShoppingCart size={15} />
            Adicionar
          </button>
        </div>
      </div>
    </div>
  )
}
