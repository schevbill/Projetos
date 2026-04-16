'use client'
import { useCart } from '@/store/cart'
import toast from 'react-hot-toast'
import { ShoppingCart, Package } from 'lucide-react'

interface Product {
  id: string
  name: string
  description?: string | null
  price: number
  image?: string | null
  category?: string | null
  available: boolean
}

export default function ProductCard({ product }: { product: Product }) {
  const { addItem } = useCart()

  const handleAdd = () => {
    addItem({ id: product.id, name: product.name, price: product.price, image: product.image })
    toast.success(`${product.name} adicionado!`)
  }

  return (
    <div className="card overflow-hidden hover:shadow-md transition-shadow">
      <div className="h-40 bg-gradient-to-br from-orange-100 to-orange-200 flex items-center justify-center">
        {product.image ? (
          <img src={product.image} alt={product.name} className="h-full w-full object-cover" />
        ) : (
          <Package size={48} className="text-orange-400" />
        )}
      </div>
      <div className="p-4">
        {product.category && (
          <span className="text-xs text-orange-500 font-semibold uppercase tracking-wide">{product.category}</span>
        )}
        <h3 className="font-bold text-gray-800 mt-1">{product.name}</h3>
        {product.description && (
          <p className="text-gray-500 text-sm mt-1 line-clamp-2">{product.description}</p>
        )}
        <div className="flex items-center justify-between mt-4">
          <span className="text-xl font-bold text-orange-500">
            {product.price.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' })}
          </span>
          <button
            onClick={handleAdd}
            disabled={!product.available}
            className="btn-primary flex items-center gap-2 py-1.5 px-3 text-sm disabled:opacity-50 disabled:cursor-not-allowed"
          >
            <ShoppingCart size={16} />
            {product.available ? 'Adicionar' : 'Indisponível'}
          </button>
        </div>
      </div>
    </div>
  )
}
