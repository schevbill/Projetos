'use client'
import { useEffect, useState } from 'react'
import toast from 'react-hot-toast'
import { Plus, Pencil, Trash2, Tag } from 'lucide-react'

interface Coupon { id: string; code: string; discount: number; type: string; maxUses?: number | null; uses: number; active: boolean; expiresAt?: string | null }

const empty = { code: '', discount: '', type: 'PERCENTAGE', maxUses: '', active: true, expiresAt: '' }

export default function AdminCoupons() {
  const [coupons, setCoupons] = useState<Coupon[]>([])
  const [showModal, setShowModal] = useState(false)
  const [editing, setEditing] = useState<Coupon | null>(null)
  const [form, setForm] = useState(empty)
  const [loading, setLoading] = useState(false)

  const load = () => fetch('/api/coupons').then(r => r.json()).then(setCoupons)
  useEffect(() => { load() }, [])

  const openCreate = () => { setEditing(null); setForm(empty); setShowModal(true) }
  const openEdit = (c: Coupon) => {
    setEditing(c)
    setForm({ code: c.code, discount: c.discount.toString(), type: c.type, maxUses: c.maxUses?.toString() || '', active: c.active, expiresAt: c.expiresAt ? c.expiresAt.split('T')[0] : '' })
    setShowModal(true)
  }

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    setLoading(true)
    try {
      const body = {
        ...form,
        code: form.code.toUpperCase(),
        discount: parseFloat(form.discount),
        maxUses: form.maxUses ? parseInt(form.maxUses) : null,
        expiresAt: form.expiresAt ? new Date(form.expiresAt).toISOString() : null,
      }
      const res = editing
        ? await fetch(`/api/coupons/${editing.code}`, { method: 'PUT', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify(body) })
        : await fetch('/api/coupons', { method: 'POST', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify(body) })
      if (!res.ok) throw new Error()
      toast.success(editing ? 'Cupom atualizado!' : 'Cupom criado!')
      setShowModal(false)
      load()
    } catch {
      toast.error('Erro ao salvar cupom')
    } finally {
      setLoading(false)
    }
  }

  const handleDelete = async (code: string) => {
    if (!confirm('Excluir este cupom?')) return
    const res = await fetch(`/api/coupons/${code}`, { method: 'DELETE' })
    if (res.ok) { toast.success('Cupom excluído'); load() }
  }

  return (
    <div className="p-8">
      <div className="flex justify-between items-center mb-8">
        <h1 className="text-3xl font-bold text-gray-800">Cupons de Desconto</h1>
        <button onClick={openCreate} className="btn-primary flex items-center gap-2"><Plus size={18} /> Novo Cupom</button>
      </div>

      <div className="card overflow-hidden">
        <table className="w-full text-sm">
          <thead className="bg-gray-50">
            <tr>
              {['Código', 'Desconto', 'Tipo', 'Usos', 'Validade', 'Status', 'Ações'].map(h => (
                <th key={h} className="text-left px-6 py-3 text-gray-600 font-semibold">{h}</th>
              ))}
            </tr>
          </thead>
          <tbody>
            {coupons.map(c => (
              <tr key={c.id} className="border-t hover:bg-gray-50">
                <td className="px-6 py-4">
                  <div className="flex items-center gap-2">
                    <Tag size={16} className="text-brand-400" />
                    <span className="font-mono font-bold text-brand-600">{c.code}</span>
                  </div>
                </td>
                <td className="px-6 py-4 font-bold">
                  {c.type === 'PERCENTAGE' ? `${c.discount}%` : c.discount.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' })}
                </td>
                <td className="px-6 py-4 text-gray-600">{c.type === 'PERCENTAGE' ? 'Percentual' : 'Fixo'}</td>
                <td className="px-6 py-4 text-gray-600">{c.uses}{c.maxUses ? ` / ${c.maxUses}` : ''}</td>
                <td className="px-6 py-4 text-gray-600">
                  {c.expiresAt ? new Date(c.expiresAt).toLocaleDateString('pt-BR') : 'Sem validade'}
                </td>
                <td className="px-6 py-4">
                  <span className={`px-2 py-1 rounded-full text-xs font-medium ${c.active ? 'bg-green-100 text-green-700' : 'bg-red-100 text-red-700'}`}>
                    {c.active ? 'Ativo' : 'Inativo'}
                  </span>
                </td>
                <td className="px-6 py-4">
                  <div className="flex gap-2">
                    <button onClick={() => openEdit(c)} className="p-1.5 text-blue-500 hover:bg-blue-50 rounded"><Pencil size={16} /></button>
                    <button onClick={() => handleDelete(c.code)} className="p-1.5 text-red-500 hover:bg-red-50 rounded"><Trash2 size={16} /></button>
                  </div>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
        {coupons.length === 0 && <div className="text-center py-12 text-gray-400">Nenhum cupom cadastrado</div>}
      </div>

      {showModal && (
        <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4">
          <div className="card w-full max-w-md p-6">
            <h2 className="text-xl font-bold text-gray-800 mb-4">{editing ? 'Editar' : 'Novo'} Cupom</h2>
            <form onSubmit={handleSubmit} className="space-y-4">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Código *</label>
                <input className="input-field uppercase" value={form.code} onChange={e => setForm(f => ({ ...f, code: e.target.value.toUpperCase() }))} required />
              </div>
              <div className="grid grid-cols-2 gap-4">
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">Desconto *</label>
                  <input type="number" step="0.01" className="input-field" value={form.discount} onChange={e => setForm(f => ({ ...f, discount: e.target.value }))} required />
                </div>
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">Tipo</label>
                  <select className="input-field" value={form.type} onChange={e => setForm(f => ({ ...f, type: e.target.value }))}>
                    <option value="PERCENTAGE">Percentual (%)</option>
                    <option value="FIXED">Valor fixo (R$)</option>
                  </select>
                </div>
              </div>
              <div className="grid grid-cols-2 gap-4">
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">Máx. de usos</label>
                  <input type="number" className="input-field" placeholder="Ilimitado" value={form.maxUses} onChange={e => setForm(f => ({ ...f, maxUses: e.target.value }))} />
                </div>
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">Vencimento</label>
                  <input type="date" className="input-field" value={form.expiresAt} onChange={e => setForm(f => ({ ...f, expiresAt: e.target.value }))} />
                </div>
              </div>
              <div className="flex items-center gap-2">
                <input type="checkbox" id="active" checked={form.active} onChange={e => setForm(f => ({ ...f, active: e.target.checked }))} />
                <label htmlFor="active" className="text-sm text-gray-700">Ativo</label>
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
