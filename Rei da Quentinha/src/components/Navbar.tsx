'use client'
import Link from 'next/link'
import { useCart } from '@/store/cart'
import { ShoppingCart, Menu, X, Flame } from 'lucide-react'
import { useState, useEffect } from 'react'

export default function Navbar() {
  const count = useCart(state => state.items.reduce((sum, i) => sum + i.quantity, 0))
  const [menuOpen, setMenuOpen] = useState(false)
  const [user, setUser] = useState<{ name: string; role: string } | null>(null)

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
    <nav className="bg-gray-950 text-white shadow-lg">
      <div className="max-w-6xl mx-auto px-4">
        <div className="flex items-center justify-between h-16">
          <Link href="/" className="flex items-center gap-2 font-extrabold text-xl tracking-tight">
            <span className="bg-brand-600 text-white p-1.5 rounded-lg">
              <Flame size={20} />
            </span>
            <span>
              <span className="text-white">Rei da </span>
              <span className="text-brand-400">Quentinha</span>
            </span>
          </Link>

          <div className="hidden md:flex items-center gap-6 text-sm font-medium">
            <Link href="/" className="text-gray-300 hover:text-white transition-colors">Cardápio</Link>
            {user ? (
              <>
                {user.role === 'ADMIN' && (
                  <Link href="/admin" className="text-gray-300 hover:text-white transition-colors">Admin</Link>
                )}
                <Link href="/perfil" className="text-gray-300 hover:text-white transition-colors">Olá, {user.name.split(' ')[0]}</Link>
                <button onClick={handleLogout} className="text-gray-400 hover:text-white transition-colors">Sair</button>
              </>
            ) : (
              <>
                <Link href="/auth/login" className="text-gray-300 hover:text-white transition-colors">Entrar</Link>
                <Link href="/auth/register" className="bg-brand-600 hover:bg-brand-700 text-white px-4 py-1.5 rounded-lg font-semibold transition-colors">
                  Cadastrar
                </Link>
              </>
            )}
            <Link href="/cart" className="relative text-gray-300 hover:text-white transition-colors">
              <ShoppingCart size={22} />
              {count > 0 && (
                <span className="absolute -top-2 -right-2 bg-gold-500 text-gray-900 text-xs rounded-full w-5 h-5 flex items-center justify-center font-bold">
                  {count}
                </span>
              )}
            </Link>
          </div>

          <div className="md:hidden flex items-center gap-4">
            <Link href="/cart" className="relative text-gray-300">
              <ShoppingCart size={22} />
              {count > 0 && (
                <span className="absolute -top-2 -right-2 bg-gold-500 text-gray-900 text-xs rounded-full w-5 h-5 flex items-center justify-center font-bold">
                  {count}
                </span>
              )}
            </Link>
            <button onClick={() => setMenuOpen(!menuOpen)} className="text-gray-300 hover:text-white">
              {menuOpen ? <X size={24} /> : <Menu size={24} />}
            </button>
          </div>
        </div>

        {menuOpen && (
          <div className="md:hidden pb-4 flex flex-col gap-3 border-t border-gray-800 pt-4 text-sm">
            <Link href="/" onClick={() => setMenuOpen(false)} className="text-gray-300 hover:text-white">Cardápio</Link>
            {user ? (
              <>
                {user.role === 'ADMIN' && <Link href="/admin" onClick={() => setMenuOpen(false)} className="text-gray-300 hover:text-white">Admin</Link>}
                <Link href="/perfil" onClick={() => setMenuOpen(false)} className="text-gray-300 hover:text-white">Meu Cadastro</Link>
                <button onClick={handleLogout} className="text-left text-gray-400 hover:text-white">Sair ({user.name.split(' ')[0]})</button>
              </>
            ) : (
              <>
                <Link href="/auth/login" onClick={() => setMenuOpen(false)} className="text-gray-300 hover:text-white">Entrar</Link>
                <Link href="/auth/register" onClick={() => setMenuOpen(false)} className="text-brand-400 hover:text-brand-300 font-semibold">Cadastrar</Link>
              </>
            )}
          </div>
        )}
      </div>
    </nav>
  )
}
