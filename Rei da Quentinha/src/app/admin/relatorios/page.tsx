'use client'
import Link from 'next/link'
import { BarChart2, ShoppingBag, ChevronRight } from 'lucide-react'

const reports = [
  {
    href: '/admin/relatorios/vendas',
    icon: ShoppingBag,
    color: 'bg-brand-500',
    title: 'Relatório de Vendas',
    description: 'Pedidos, faturamento, ticket médio e detalhamento por período.',
  },
]

export default function RelatoriosPage() {
  return (
    <div className="p-8">
      <div className="flex items-center gap-3 mb-2">
        <BarChart2 size={28} className="text-brand-500" />
        <h1 className="text-3xl font-bold text-gray-800">Relatórios</h1>
      </div>
      <p className="text-gray-500 mb-8">Selecione o relatório que deseja visualizar.</p>

      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
        {reports.map(r => (
          <Link
            key={r.href}
            href={r.href}
            className="card p-6 flex items-center gap-4 hover:shadow-md hover:-translate-y-0.5 transition-all group"
          >
            <div className={`${r.color} text-white p-3 rounded-xl flex-shrink-0`}>
              <r.icon size={24} />
            </div>
            <div className="flex-1">
              <h2 className="font-bold text-gray-800 group-hover:text-brand-600 transition-colors">{r.title}</h2>
              <p className="text-sm text-gray-500 mt-0.5">{r.description}</p>
            </div>
            <ChevronRight size={18} className="text-gray-300 group-hover:text-brand-400 transition-colors flex-shrink-0" />
          </Link>
        ))}
      </div>
    </div>
  )
}
