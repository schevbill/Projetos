'use client'
import Link from 'next/link'
import { usePathname } from 'next/navigation'
import {
  LayoutDashboard, Package, Tag, Users, Truck, Printer,
  ClipboardList, UtensilsCrossed, LogOut, Settings, ScrollText
} from 'lucide-react'

const links = [
  { href: '/admin', label: 'Dashboard', icon: LayoutDashboard },
  { href: '/admin/orders', label: 'Pedidos', icon: ClipboardList },
  { href: '/admin/products', label: 'Produtos', icon: Package },
  { href: '/admin/coupons', label: 'Cupons', icon: Tag },
  { href: '/admin/users', label: 'Usuários', icon: Users },
  { href: '/admin/motoboys', label: 'Motoboys', icon: Truck },
  { href: '/admin/printers', label: 'Impressoras', icon: Printer },
  { href: '/admin/configuracoes', label: 'Config. PIX', icon: Settings },
  { href: '/admin/logs', label: 'Logs', icon: ScrollText },
]

export default function AdminSidebar() {
  const pathname = usePathname()

  const handleLogout = async () => {
    await fetch('/api/auth/logout', { method: 'POST' })
    window.location.href = '/'
  }

  return (
    <aside className="w-64 bg-gray-900 text-white flex flex-col min-h-screen">
      <div className="p-6 border-b border-gray-700">
        <Link href="/" className="flex items-center gap-2 font-bold text-xl text-brand-400">
          <UtensilsCrossed size={24} />
          Rei da Quentinha
        </Link>
        <p className="text-gray-400 text-xs mt-1">Painel Administrativo</p>
      </div>

      <nav className="flex-1 p-4 space-y-1">
        {links.map(({ href, label, icon: Icon }) => {
          const active = pathname === href || (href !== '/admin' && pathname.startsWith(href))
          return (
            <Link
              key={href}
              href={href}
              className={`flex items-center gap-3 px-3 py-2.5 rounded-lg transition-colors ${
                active ? 'bg-brand-600 text-white' : 'text-gray-300 hover:bg-gray-800 hover:text-white'
              }`}
            >
              <Icon size={18} />
              {label}
            </Link>
          )
        })}
      </nav>

      <div className="p-4 border-t border-gray-700">
        <button
          onClick={handleLogout}
          className="flex items-center gap-3 px-3 py-2.5 rounded-lg text-gray-300 hover:bg-gray-800 hover:text-white transition-colors w-full"
        >
          <LogOut size={18} />
          Sair
        </button>
      </div>
    </aside>
  )
}
