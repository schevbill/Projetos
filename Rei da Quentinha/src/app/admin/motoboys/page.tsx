'use client'
import { useEffect, useState } from 'react'
import toast from 'react-hot-toast'
import { Plus, Pencil, Trash2, Bike } from 'lucide-react'
import { validatePhone, formatPhone } from '@/lib/validators'

interface Motoboy { id: string; name: string; phone: string; vehicle?: string | null; plate?: string | null; active: boolean }

const empty = { name: '', phone: '', vehicle: '', plate: '', active: true }

export default function AdminMotoboys() {
  const [motoboys, setMotoboys] = useState<Motoboy[]>([])
  const [showModal, setShowModal] = useState(false)
  const [editing, setEditing] = useState<Motoboy | null>(null)
  const [form, setForm] = useState(empty)
  const [loading, setLoading] = useState(false)

  const load = () => fetch('/api/motoboys').then(r => r.json()).then(setMotoboys)
  useEffect(() => { load() }, [])

  const openCreate = () => { setEditing(null); setForm(empty); setShowModal(true) }
  const openEdit = (m: Motoboy) => {
    setEditing(m)
    setForm({ name: m.name, phone: m.phone, vehicle: m.vehicle || '', plate: m.plate || '', active: m.active })
    setShowModal(true)
  }

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    setLoading(true)
    const phoneErr = validatePhone(form.phone)
    if (phoneErr) { toast.error(phoneErr); setLoading(false); return }
    try {
      const res = editing
        ? await fetch(`/api/motoboys/${editing.id}`, { method: 'PUT', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify(form) })
        : await fetch('/api/motoboys', { method: 'POST', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify(form) })
      if (!res.ok) throw new Error()
      toast.success(editing ? 'Motoboy atualizado!' : 'Motoboy cadastrado!')
      setShowModal(false)
      load()
    } catch {
      toast.error('Erro ao salvar')
    } finally {
      setLoading(false)
    }
  }

  const handleDelete = async (id: string) => {
    if (!confirm('Excluir este motoboy?')) return
    const res = await fetch(`/api/motoboys/${id}`, { method: 'DELETE' })
    if (res.ok) { toast.success('Motoboy excluído'); load() }
  }

  return (
    <div className="p-8">
      <div className="flex justify-between items-center mb-8">
        <h1 className="text-3xl font-bold text-gray-800">Motoboys</h1>
        <button onClick={openCreate} className="btn-primary flex items-center gap-2"><Plus size={18} /> Novo Motoboy</button>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
        {motoboys.map(m => (
          <div key={m.id} className="card p-5">
            <div className="flex items-start justify-between">
              <div className="flex items-center gap-3">
                <div className="w-12 h-12 bg-orange-100 rounded-full flex items-center justify-center">
                  <Bike size={24} className="text-orange-500" />
                </div>
                <div>
                  <h3 className="font-bold text-gray-800">{m.name}</h3>
                  <p className="text-gray-500 text-sm">{m.phone}</p>
                </div>
              </div>
              <span className={`px-2 py-0.5 rounded-full text-xs font-medium ${m.active ? 'bg-green-100 text-green-700' : 'bg-red-100 text-red-700'}`}>
                {m.active ? 'Ativo' : 'Inativo'}
              </span>
            </div>
            {(m.vehicle || m.plate) && (
              <div className="mt-3 text-sm text-gray-500">
                {m.vehicle && <span>{m.vehicle}</span>}
                {m.vehicle && m.plate && <span> — </span>}
                {m.plate && <span className="font-mono bg-gray-100 px-2 py-0.5 rounded">{m.plate}</span>}
              </div>
            )}
            <div className="flex gap-2 mt-4">
              <button onClick={() => openEdit(m)} className="btn-secondary flex-1 flex items-center justify-center gap-1 text-sm py-1.5">
                <Pencil size={14} /> Editar
              </button>
              <button onClick={() => handleDelete(m.id)} className="btn-danger flex items-center justify-center gap-1 text-sm py-1.5 px-3">
                <Trash2 size={14} />
              </button>
            </div>
          </div>
        ))}
        {motoboys.length === 0 && (
          <div className="col-span-3 text-center py-20 text-gray-400">
            <Bike size={48} className="mx-auto mb-2" />
            Nenhum motoboy cadastrado
          </div>
        )}
      </div>

      {showModal && (
        <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4">
          <div className="card w-full max-w-md p-6">
            <h2 className="text-xl font-bold text-gray-800 mb-4">{editing ? 'Editar' : 'Novo'} Motoboy</h2>
            <form onSubmit={handleSubmit} className="space-y-3">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Nome *</label>
                <input className="input-field" value={form.name} onChange={e => setForm(f => ({ ...f, name: e.target.value }))} required />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Celular *</label>
                <input
                  type="tel"
                  inputMode="numeric"
                  className="input-field"
                  placeholder="(11) 99999-9999"
                  maxLength={15}
                  value={form.phone}
                  onChange={e => setForm(f => ({ ...f, phone: formatPhone(e.target.value) }))}
                  required
                />
              </div>
              <div className="grid grid-cols-2 gap-3">
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">Veículo</label>
                  <input className="input-field" placeholder="Moto, Bicicleta..." value={form.vehicle} onChange={e => setForm(f => ({ ...f, vehicle: e.target.value }))} />
                </div>
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">Placa</label>
                  <input className="input-field uppercase" value={form.plate} onChange={e => setForm(f => ({ ...f, plate: e.target.value.toUpperCase() }))} />
                </div>
              </div>
              <div className="flex items-center gap-2">
                <input type="checkbox" id="motoActive" checked={form.active} onChange={e => setForm(f => ({ ...f, active: e.target.checked }))} />
                <label htmlFor="motoActive" className="text-sm text-gray-700">Ativo</label>
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
