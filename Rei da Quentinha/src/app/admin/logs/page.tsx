'use client'
import { useEffect, useState, useCallback } from 'react'
import { ClipboardList, ChevronLeft, ChevronRight, Filter } from 'lucide-react'

interface LogEntry {
  id: string
  action: string
  entity: string
  entityId: string | null
  description: string
  userId: string | null
  userName: string | null
  userRole: string | null
  ip: string | null
  createdAt: string
}

const ACTION_COLORS: Record<string, string> = {
  CREATE: 'bg-green-100 text-green-700',
  UPDATE: 'bg-blue-100 text-blue-700',
  DELETE: 'bg-red-100 text-red-700',
  LOGIN:  'bg-purple-100 text-purple-700',
}

const ENTITY_LABELS: Record<string, string> = {
  USER: 'Usuário', ORDER: 'Pedido', PRODUCT: 'Produto',
  COUPON: 'Cupom', ADDRESS: 'Endereço', MOTOBOY: 'Motoboy',
  PRINTER: 'Impressora', CONFIG: 'Config', CATEGORY: 'Categoria',
}

export default function LogsPage() {
  const [logs, setLogs]     = useState<LogEntry[]>([])
  const [total, setTotal]   = useState(0)
  const [page, setPage]     = useState(1)
  const [pages, setPages]   = useState(1)
  const [entity, setEntity] = useState('')
  const [action, setAction] = useState('')
  const [loading, setLoading] = useState(false)

  const load = useCallback(async () => {
    setLoading(true)
    const params = new URLSearchParams({ page: String(page) })
    if (entity) params.set('entity', entity)
    if (action) params.set('action', action)
    const res = await fetch(`/api/logs?${params}`)
    if (res.ok) {
      const data = await res.json()
      setLogs(data.logs)
      setTotal(data.total)
      setPages(data.pages)
    }
    setLoading(false)
  }, [page, entity, action])

  useEffect(() => { load() }, [load])

  const handleFilter = () => { setPage(1); load() }

  return (
    <div className="p-8">
      <div className="flex justify-between items-center mb-8">
        <div>
          <h1 className="text-3xl font-bold text-gray-800">Log de Atividades</h1>
          <p className="text-gray-500 text-sm mt-1">{total} registro(s) encontrado(s)</p>
        </div>
        <ClipboardList size={28} className="text-brand-400" />
      </div>

      {/* Filtros */}
      <div className="card p-4 mb-6 flex flex-wrap gap-3 items-end">
        <div>
          <label className="block text-xs font-medium text-gray-600 mb-1">Entidade</label>
          <select className="input-field text-sm py-1.5 pr-8" value={entity} onChange={e => setEntity(e.target.value)}>
            <option value="">Todas</option>
            {Object.entries(ENTITY_LABELS).map(([v, l]) => <option key={v} value={v}>{l}</option>)}
          </select>
        </div>
        <div>
          <label className="block text-xs font-medium text-gray-600 mb-1">Ação</label>
          <select className="input-field text-sm py-1.5 pr-8" value={action} onChange={e => setAction(e.target.value)}>
            <option value="">Todas</option>
            <option value="CREATE">Criação</option>
            <option value="UPDATE">Edição</option>
            <option value="DELETE">Exclusão</option>
            <option value="LOGIN">Login</option>
          </select>
        </div>
        <button onClick={handleFilter} className="btn-primary flex items-center gap-1.5 text-sm py-1.5 px-4">
          <Filter size={14} /> Filtrar
        </button>
      </div>

      {/* Tabela */}
      <div className="card overflow-x-auto">
        <table className="w-full text-sm min-w-[800px]">
          <thead className="bg-gray-50">
            <tr>
              {['Data / Hora', 'Ação', 'Entidade', 'Descrição', 'Usuário', 'IP'].map(h => (
                <th key={h} className="text-left px-5 py-3 text-gray-600 font-semibold">{h}</th>
              ))}
            </tr>
          </thead>
          <tbody>
            {loading && (
              <tr><td colSpan={6} className="text-center py-12 text-gray-400">Carregando...</td></tr>
            )}
            {!loading && logs.length === 0 && (
              <tr><td colSpan={6} className="text-center py-12 text-gray-400">Nenhum registro encontrado</td></tr>
            )}
            {!loading && logs.map(log => (
              <tr key={log.id} className="border-t hover:bg-gray-50">
                <td className="px-5 py-3 text-gray-500 text-xs whitespace-nowrap">
                  {new Date(log.createdAt).toLocaleString('pt-BR')}
                </td>
                <td className="px-5 py-3">
                  <span className={`px-2 py-0.5 rounded-full text-xs font-semibold ${ACTION_COLORS[log.action] ?? 'bg-gray-100 text-gray-600'}`}>
                    {log.action}
                  </span>
                </td>
                <td className="px-5 py-3 text-xs font-medium text-gray-600">
                  {ENTITY_LABELS[log.entity] ?? log.entity}
                </td>
                <td className="px-5 py-3 text-gray-800 max-w-xs truncate" title={log.description}>
                  {log.description}
                </td>
                <td className="px-5 py-3 text-gray-600 text-xs">
                  {log.userName
                    ? <span>{log.userName} <span className={`ml-1 px-1.5 py-0.5 rounded text-xs ${log.userRole === 'ADMIN' ? 'bg-purple-100 text-purple-600' : 'bg-blue-100 text-blue-600'}`}>{log.userRole === 'ADMIN' ? 'Admin' : 'Cliente'}</span></span>
                    : <span className="text-gray-400">Anônimo</span>
                  }
                </td>
                <td className="px-5 py-3 text-gray-400 text-xs font-mono">{log.ip ?? '—'}</td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>

      {/* Paginação */}
      {pages > 1 && (
        <div className="flex items-center justify-center gap-3 mt-6">
          <button onClick={() => setPage(p => Math.max(1, p - 1))} disabled={page === 1}
            className="p-2 rounded-lg border border-gray-200 hover:bg-gray-50 disabled:opacity-40">
            <ChevronLeft size={16} />
          </button>
          <span className="text-sm text-gray-600">Página {page} de {pages}</span>
          <button onClick={() => setPage(p => Math.min(pages, p + 1))} disabled={page === pages}
            className="p-2 rounded-lg border border-gray-200 hover:bg-gray-50 disabled:opacity-40">
            <ChevronRight size={16} />
          </button>
        </div>
      )}
    </div>
  )
}
