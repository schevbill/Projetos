'use client'
import Link from 'next/link'
import { useCart } from '@/store/cart'
import { ShoppingCart, Menu, X, UtensilsCrossed } from 'lucide-react'
import { useState, useEffect } from 'react'

export default function Navbar() {
  const { itemCount } = useCart()
  const [menuOpen, setMenuOpen] = useState(false)
  const [count, setCount] = useState(0)
  const [user, setUser] = useState<{ name: string; role: string } | null>(null)

  useEffect(() => {
    setCount(itemCount())
  }, [itemCount])

  useEffect(() => {
    fetch('/api/auth/me').then(r => r.ok ? r.json() : null).then(data => {
      if (data?.user) setUser(data.user)
    })
  }, [])

  const handleLogout = async () => {
    await fetch('/api/auth/logout', { method: 'POST' })
    setUser(null)
    window.location.href = '/'
  }

  return (
    <nav className="bg-orange-500 text-white shadow-lg">
      <div className="max-w-6xl mx-auto px-4">
        <div className="flex items-center justify-between h-16">
          <Link href="/" className="flex items-center gap-2 font-bold text-xl">
            <UtensilsCrossed size={28} />
            Rei da Quentinha
          </Link>

          <div className="hidden md:flex items-center gap-6">
            <Link href="/" className="hover:text-orange-100 transition-colors">Cardápio</Link>
            {user ? (
              <>
                {user.role === 'ADMIN' && (
                  <Link href="/admin" className="hover:text-orange-100 transition-colors">Admin</Link>
                )}
                <span className="text-orange-100 text-sm">Olá, {user.name.split(' ')[0]}</span>
                <button onClick={handleLogout} className="hover:text-orange-100 text-sm transition-colors">Sair</button>
              </>
            ) : (
              <>
                <Link href="/auth/login" className="hover:text-orange-100 transition-colors">Entrar</Link>
                <Link href="/auth/register" className="bg-white text-orange-500 px-4 py-1.5 rounded-lg font-semibold hover:bg-orange-50 transition-colors">Cadastrar</Link>
              </>
            )}
            <Link href="/cart" className="relative">
              <ShoppingCart size={24} />
              {count > 0 && (
                <span className="absolute -top-2 -right-2 bg-red-500 text-white text-xs rounded-full w-5 h-5 flex items-center justify-center font-bold">
                  {count}
                </span>
              )}
            </Link>
          </div>

          <div className="md:hidden flex items-center gap-4">
            <Link href="/cart" className="relative">
              <ShoppingCart size={24} />
              {count > 0 && (
                <span className="absolute -top-2 -right-2 bg-red-500 text-white text-xs rounded-full w-5 h-5 flex items-center justify-center font-bold">
                  {count}
                </span>
              )}
            </Link>
            <button onClick={() => setMenuOpen(!menuOpen)}>
              {menuOpen ? <X size={24} /> : <Menu size={24} />}
            </button>
          </div>
        </div>

        {menuOpen && (
          <div className="md:hidden pb-4 flex flex-col gap-3">
            <Link href="/" onClick={() => setMenuOpen(false)}>Cardápio</Link>
            {user ? (
              <>
                {user.role === 'ADMIN' && <Link href="/admin" onClick={() => setMenuOpen(false)}>Admin</Link>}
                <button onClick={handleLogout} className="text-left">Sair ({user.name.split(' ')[0]})</button>
              </>
            ) : (
              <>
                <Link href="/auth/login" onClick={() => setMenuOpen(false)}>Entrar</Link>
                <Link href="/auth/register" onClick={() => setMenuOpen(false)}>Cadastrar</Link>
              </>
            )}
          </div>
        )}
      </div>
    </nav>
  )
}
