'use client'
import { useEffect, useState } from 'react'
import toast from 'react-hot-toast'
import { Plus, Pencil, Trash2, Printer, Star, Wifi } from 'lucide-react'

interface PrinterItem { id: string; name: string; ip?: string | null; port?: number | null; type: string; isDefault: boolean }

const empty = { name: '', ip: '', port: '9100', type: 'THERMAL', isDefault: false }

export default function AdminPrinters() {
  const [printers, setPrinters] = useState<PrinterItem[]>([])
  const [showModal, setShowModal] = useState(false)
  const [editing, setEditing] = useState<PrinterItem | null>(null)
  const [form, setForm] = useState(empty)
  const [loading, setLoading] = useState(false)
  const [testing, setTesting] = useState(false)

  const load = () => fetch('/api/printers').then(r => r.json()).then(setPrinters)
  useEffect(() => { load() }, [])

  const openCreate = () => { setEditing(null); setForm(empty); setShowModal(true) }
  const openEdit = (p: PrinterItem) => {
    setEditing(p)
    setForm({ name: p.name, ip: p.ip || '', port: p.port?.toString() || '9100', type: p.type, isDefault: p.isDefault })
    setShowModal(true)
  }

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    setLoading(true)
    try {
      const body = { ...form, port: parseInt(form.port) }
      const res = editing
        ? await fetch(`/api/printers/${editing.id}`, { method: 'PUT', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify(body) })
        : await fetch('/api/printers', { method: 'POST', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify(body) })
      if (!res.ok) throw new Error()
      toast.success(editing ? 'Impressora atualizada!' : 'Impressora cadastrada!')
      setShowModal(false)
      load()
    } catch {
      toast.error('Erro ao salvar impressora')
    } finally {
      setLoading(false)
    }
  }

  const handleDelete = async (id: string) => {
    if (!confirm('Excluir esta impressora?')) return
    const res = await fetch(`/api/printers/${id}`, { method: 'DELETE' })
    if (res.ok) { toast.success('Impressora excluída'); load() }
  }

  const setDefault = async (id: string) => {
    await fetch(`/api/printers/${id}`, {
      method: 'PUT',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ isDefault: true }),
    })
    toast.success('Impressora padrão definida!')
    load()
  }

  return (
    <div className="p-8">
      <div className="flex justify-between items-center mb-8">
        <h1 className="text-3xl font-bold text-gray-800">Impressoras de Etiqueta</h1>
        <button onClick={openCreate} className="btn-primary flex items-center gap-2"><Plus size={18} /> Nova Impressora</button>
      </div>

      <div className="bg-blue-50 border border-blue-200 rounded-xl p-4 mb-6 text-sm text-blue-700">
        <strong>Como funciona:</strong> Configure impressoras térmicas via rede TCP/IP (ESC/POS).
        Ao confirmar um pedido pago via PIX ou Cartão, o comprovante/etiqueta é enviado automaticamente
        para a impressora padrão ({`★`}). Porta padrão: <code>9100</code>.
      </div>

      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
        {printers.map(p => (
          <div key={p.id} className={`card p-5 ${p.isDefault ? 'ring-2 ring-orange-400' : ''}`}>
            <div className="flex items-start justify-between mb-3">
              <div className="flex items-center gap-3">
                <div className="w-12 h-12 bg-gray-100 rounded-xl flex items-center justify-center">
                  <Printer size={24} className="text-gray-500" />
                </div>
                <div>
                  <h3 className="font-bold text-gray-800 flex items-center gap-1">
                    {p.name}
                    {p.isDefault && <Star size={14} className="text-orange-400 fill-orange-400" />}
                  </h3>
                  <p className="text-xs text-gray-500">{p.type}</p>
                </div>
              </div>
            </div>
            {p.ip && (
              <div className="flex items-center gap-2 text-sm text-gray-600 mb-3">
                <Wifi size={14} />
                <span>{p.ip}:{p.port}</span>
              </div>
            )}
            <div className="flex gap-2 flex-wrap">
              {!p.isDefault && (
                <button onClick={() => setDefault(p.id)} className="text-xs border border-orange-300 text-orange-600 px-2 py-1 rounded-lg hover:bg-orange-50 flex items-center gap-1">
                  <Star size={12} /> Definir padrão
                </button>
              )}
              <button onClick={() => openEdit(p)} className="btn-secondary flex items-center gap-1 text-sm py-1 px-2">
                <Pencil size={14} /> Editar
              </button>
              <button onClick={() => handleDelete(p.id)} className="btn-danger flex items-center gap-1 text-sm py-1 px-2">
                <Trash2 size={14} />
              </button>
            </div>
          </div>
        ))}
        {printers.length === 0 && (
          <div className="col-span-3 text-center py-20 text-gray-400">
            <Printer size={48} className="mx-auto mb-2" />
            Nenhuma impressora configurada
          </div>
        )}
      </div>

      {showModal && (
        <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4">
          <div className="card w-full max-w-md p-6">
            <h2 className="text-xl font-bold text-gray-800 mb-4">{editing ? 'Editar' : 'Nova'} Impressora</h2>
            <form onSubmit={handleSubmit} className="space-y-3">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Nome *</label>
                <input className="input-field" placeholder="Ex: Impressora Cozinha" value={form.name} onChange={e => setForm(f => ({ ...f, name: e.target.value }))} required />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Tipo</label>
                <select className="input-field" value={form.type} onChange={e => setForm(f => ({ ...f, type: e.target.value }))}>
                  <option value="THERMAL">Térmica (ESC/POS)</option>
                  <option value="INKJET">Jato de tinta</option>
                  <option value="LASER">Laser</option>
                </select>
              </div>
              <div className="grid grid-cols-3 gap-3">
                <div className="col-span-2">
                  <label className="block text-sm font-medium text-gray-700 mb-1">IP da Impressora</label>
                  <input className="input-field" placeholder="192.168.1.100" value={form.ip} onChange={e => setForm(f => ({ ...f, ip: e.target.value }))} />
                </div>
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">Porta</label>
                  <input type="number" className="input-field" value={form.port} onChange={e => setForm(f => ({ ...f, port: e.target.value }))} />
                </div>
              </div>
              <div className="flex items-center gap-2">
                <input type="checkbox" id="isDefault" checked={form.isDefault} onChange={e => setForm(f => ({ ...f, isDefault: e.target.checked }))} />
                <label htmlFor="isDefault" className="text-sm text-gray-700">Definir como impressora padrão</label>
              </div>
              <div className="flex gap-3 pt-2">
                <button type="submit" disabled={loading} className="btn-primary flex-1">{loading ? 'Salvando...' : 'Salvar'}</button>
                <button type="button" onClick={() => setShowModal(false)} className="btn-secondary flex-1">Cancelar</button>
              </div>
            </form>
          </div>
        </div>
      )}
    </div>
  )
}
