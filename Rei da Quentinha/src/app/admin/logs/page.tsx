'use client'
import { useEffect, useState, useCallback } from 'react'
import { ClipboardList, ChevronLeft, ChevronRight, Filter, Eye, X } from 'lucide-react'

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
  before: Record<string, unknown> | null
  after: Record<string, unknown> | null
  createdAt: string
}

const ACTION_COLORS: Record<string, string> = {
  CREATE:        'bg-green-100 text-green-700',
  UPDATE:        'bg-blue-100 text-blue-700',
  DELETE:        'bg-red-100 text-red-700',
  LOGIN:         'bg-purple-100 text-purple-700',
  LOGIN_BLOCKED: 'bg-orange-100 text-orange-700',
  ERROR:         'bg-red-100 text-red-800',
}

const ACTION_LABELS: Record<string, string> = {
  CREATE:        'Criação',
  UPDATE:        'Edição',
  DELETE:        'Exclusão',
  LOGIN:         'Login',
  LOGIN_BLOCKED: 'Login Bloqueado',
  ERROR:         'Erro',
}

const ENTITY_LABELS: Record<string, string> = {
  USER: 'Usuário', ORDER: 'Pedido', PRODUCT: 'Produto',
  COUPON: 'Cupom', ADDRESS: 'Endereço', MOTOBOY: 'Motoboy',
  PRINTER: 'Impressora', CATEGORY: 'Categoria',
  VEHICLE_TYPE: 'Tipo de Veículo',
  CONFIG: 'Configuração',
  SYSTEM: 'Sistema',
}

const FIELD_LABELS: Record<string, string> = {
  name: 'Nome', email: 'E-mail', phone: 'Celular', cpfCnpj: 'CPF/CNPJ',
  birthDate: 'Nascimento', role: 'Perfil', active: 'Ativo',
  status: 'Status', paymentStatus: 'Pagamento', motoboyId: 'Motoboy',
  price: 'Preço', description: 'Descrição', available: 'Disponível', categoryId: 'Categoria',
  discount: 'Desconto', type: 'Tipo', maxUses: 'Máx. usos', expiresAt: 'Validade',
  cep: 'CEP', logradouro: 'Rua', numero: 'Número', complemento: 'Complemento',
  bairro: 'Bairro', cidade: 'Cidade', estado: 'Estado', notes: 'Observações',
  code: 'Código',
  pixKey: 'Chave PIX', pixName: 'Nome PIX', pixCity: 'Cidade PIX',
  host: 'Servidor SMTP', port: 'Porta', user: 'Usuário SMTP', from: 'Remetente',
  whatsappCustomer: 'WhatsApp Cliente', whatsappMotoboy: 'WhatsApp Motoboy',
  logRetentionDays: 'Retenção de Logs (dias)',
}

function formatValue(val: unknown): string {
  if (val === null || val === undefined) return '—'
  if (typeof val === 'boolean') return val ? 'Sim' : 'Não'
  if (typeof val === 'number') return String(val)
  return String(val)
}

function getDiff(before: Record<string, unknown>, after: Record<string, unknown>) {
  const allKeys = new Set([...Object.keys(before), ...Object.keys(after)])
  return Array.from(allKeys)
    .filter(key => JSON.stringify(before[key]) !== JSON.stringify(after[key]))
    .map(key => ({ key, label: FIELD_LABELS[key] ?? key, before: before[key], after: after[key] }))
}

export default function LogsPage() {
  const [logs, setLogs]     = useState<LogEntry[]>([])
  const [total, setTotal]   = useState(0)
  const [page, setPage]     = useState(1)
  const [pages, setPages]   = useState(1)
  const [entity, setEntity] = useState('')
  const [action, setAction] = useState('')
  const [loading, setLoading] = useState(false)
  const [diffLog, setDiffLog] = useState<LogEntry | null>(null)

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

  const diff = diffLog?.before && diffLog?.after
    ? getDiff(diffLog.before, diffLog.after)
    : []

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
            {Object.entries(ENTITY_LABELS).sort(([,a],[,b]) => a.localeCompare(b)).map(([v, l]) => <option key={v} value={v}>{l}</option>)}
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
              {['Data / Hora', 'Ação', 'Entidade', 'Descrição', 'Usuário', 'IP', ''].map(h => (
                <th key={h} className="text-left px-5 py-3 text-gray-600 font-semibold">{h}</th>
              ))}
            </tr>
          </thead>
          <tbody>
            {loading && (
              <tr><td colSpan={7} className="text-center py-12 text-gray-400">Carregando...</td></tr>
            )}
            {!loading && logs.length === 0 && (
              <tr><td colSpan={7} className="text-center py-12 text-gray-400">Nenhum registro encontrado</td></tr>
            )}
            {!loading && logs.map(log => (
              <tr key={log.id} className="border-t hover:bg-gray-50">
                <td className="px-5 py-3 text-gray-500 text-xs whitespace-nowrap">
                  {new Date(log.createdAt).toLocaleString('pt-BR')}
                </td>
                <td className="px-5 py-3">
                  <span className={`px-2 py-0.5 rounded-full text-xs font-semibold ${ACTION_COLORS[log.action] ?? 'bg-gray-100 text-gray-600'}`}>
                    {ACTION_LABELS[log.action] ?? log.action}
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
                <td className="px-3 py-3">
                  {log.action === 'UPDATE' && log.before && log.after && (
                    <button
                      onClick={() => setDiffLog(log)}
                      className="p-1.5 text-blue-500 hover:bg-blue-50 rounded-lg transition-colors"
                      title="Ver alterações"
                    >
                      <Eye size={15} />
                    </button>
                  )}
                </td>
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

      {/* Modal Diff */}
      {diffLog && (
        <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4">
          <div className="bg-white w-full max-w-2xl rounded-2xl shadow-xl max-h-[85vh] flex flex-col">

            {/* Header */}
            <div className="flex items-center justify-between px-6 py-4 border-b border-gray-200">
              <div>
                <h2 className="text-lg font-bold text-gray-800">Alterações do Registro</h2>
                <p className="text-xs text-gray-400 mt-0.5">
                  {ENTITY_LABELS[diffLog.entity] ?? diffLog.entity} — {new Date(diffLog.createdAt).toLocaleString('pt-BR')}
                  {diffLog.userName && <span className="ml-2">por <strong>{diffLog.userName}</strong></span>}
                </p>
              </div>
              <button onClick={() => setDiffLog(null)} className="p-2 text-gray-400 hover:text-gray-600 hover:bg-gray-100 rounded-lg">
                <X size={18} />
              </button>
            </div>

            {/* Descrição */}
            <div className="px-6 py-3 bg-blue-50 border-b border-blue-100">
              <p className="text-sm text-blue-700">{diffLog.description}</p>
            </div>

            {/* Diff */}
            <div className="overflow-y-auto flex-1 px-6 py-4">
              {diff.length === 0 ? (
                <p className="text-center text-gray-400 py-8">Nenhuma alteração detectada.</p>
              ) : (
                <div className="space-y-3">
                  {/* Cabeçalho colunas */}
                  <div className="grid grid-cols-3 gap-3 text-xs font-semibold text-gray-500 uppercase tracking-wide pb-1 border-b">
                    <span>Campo</span>
                    <span className="text-red-500">Antes</span>
                    <span className="text-green-600">Depois</span>
                  </div>

                  {diff.map(({ key, label, before: bval, after: aval }) => (
                    <div key={key} className="grid grid-cols-3 gap-3 items-start py-2 border-b border-gray-100 last:border-0">
                      <span className="text-sm font-medium text-gray-700">{label}</span>
                      <div className="bg-red-50 border border-red-200 rounded-lg px-3 py-1.5 text-sm text-red-700 break-all">
                        {formatValue(bval)}
                      </div>
                      <div className="bg-green-50 border border-green-200 rounded-lg px-3 py-1.5 text-sm text-green-700 break-all">
                        {formatValue(aval)}
                      </div>
                    </div>
                  ))}
                </div>
              )}
            </div>

            <div className="px-6 py-4 border-t border-gray-100">
              <button onClick={() => setDiffLog(null)} className="btn-secondary w-full">Fechar</button>
            </div>
          </div>
        </div>
      )}
    </div>
  )
}
