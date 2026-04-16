'use client'
import { useEffect, useState } from 'react'
import toast from 'react-hot-toast'
import { Plus, Pencil, Trash2, UserCircle } from 'lucide-react'
import { validateEmail, validateCpfCnpj, formatCpfCnpj, validatePhone, formatPhone } from '@/lib/validators'

interface User { id: string; name: string; email: string; cpfCnpj?: string | null; phone?: string | null; role: string; createdAt: string }

const empty = { name: '', email: '', cpfCnpj: '', phone: '', address: '', password: '', role: 'CUSTOMER' }

export default function AdminUsers() {
  const [users, setUsers] = useState<User[]>([])
  const [showModal, setShowModal] = useState(false)
  const [editing, setEditing] = useState<User | null>(null)
  const [form, setForm] = useState(empty)
  const [loading, setLoading] = useState(false)

  const load = () => fetch('/api/users').then(r => r.json()).then(setUsers)
  useEffect(() => { load() }, [])

  const openCreate = () => { setEditing(null); setForm(empty); setShowModal(true) }
  const openEdit = (u: User) => {
    setEditing(u)
    setForm({ name: u.name, email: u.email, cpfCnpj: u.cpfCnpj || '', phone: u.phone || '', address: '', password: '', role: u.role })
    setShowModal(true)
  }

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    const emailErr = validateEmail(form.email)
    if (emailErr) { toast.error(emailErr); return }
    if (form.cpfCnpj) {
      const docErr = validateCpfCnpj(form.cpfCnpj)
      if (docErr) { toast.error(docErr); return }
    }
    if (form.phone) {
      const phoneErr = validatePhone(form.phone)
      if (phoneErr) { toast.error(phoneErr); return }
    }
    setLoading(true)
    try {
      const res = editing
        ? await fetch(`/api/users/${editing.id}`, { method: 'PUT', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify(form) })
        : await fetch('/api/users', { method: 'POST', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify(form) })
      if (!res.ok) { const e = await res.json(); throw new Error(e.error) }
      toast.success(editing ? 'Usuário atualizado!' : 'Usuário criado!')
      setShowModal(false)
      load()
    } catch (e: unknown) {
      toast.error(e instanceof Error ? e.message : 'Erro ao salvar')
    } finally {
      setLoading(false)
    }
  }

  const handleDelete = async (id: string) => {
    if (!confirm('Excluir este usuário?')) return
    const res = await fetch(`/api/users/${id}`, { method: 'DELETE' })
    if (res.ok) { toast.success('Usuário excluído'); load() }
  }

  return (
    <div className="p-8">
      <div className="flex justify-between items-center mb-8">
        <h1 className="text-3xl font-bold text-gray-800">Usuários</h1>
        <button onClick={openCreate} className="btn-primary flex items-center gap-2"><Plus size={18} /> Novo Usuário</button>
      </div>

      <div className="card overflow-hidden">
        <table className="w-full text-sm">
          <thead className="bg-gray-50">
            <tr>{['Usuário', 'E-mail', 'CPF/CNPJ', 'Celular', 'Perfil', 'Cadastro', 'Ações'].map(h => (
              <th key={h} className="text-left px-6 py-3 text-gray-600 font-semibold">{h}</th>
            ))}</tr>
          </thead>
          <tbody>
            {users.map(u => (
              <tr key={u.id} className="border-t hover:bg-gray-50">
                <td className="px-6 py-4">
                  <div className="flex items-center gap-2">
                    <UserCircle size={20} className="text-gray-400" />
                    <span className="font-medium text-gray-800">{u.name}</span>
                  </div>
                </td>
                <td className="px-6 py-4 text-gray-600">{u.email}</td>
                <td className="px-6 py-4 text-gray-600 font-mono text-xs">{u.cpfCnpj || '—'}</td>
                <td className="px-6 py-4 text-gray-600">{u.phone || '—'}</td>
                <td className="px-6 py-4">
                  <span className={`px-2 py-1 rounded-full text-xs font-medium ${u.role === 'ADMIN' ? 'bg-purple-100 text-purple-700' : 'bg-blue-100 text-blue-700'}`}>
                    {u.role === 'ADMIN' ? 'Admin' : 'Cliente'}
                  </span>
                </td>
                <td className="px-6 py-4 text-gray-500 text-xs">{new Date(u.createdAt).toLocaleDateString('pt-BR')}</td>
                <td className="px-6 py-4">
                  <div className="flex gap-2">
                    <button onClick={() => openEdit(u)} className="p-1.5 text-blue-500 hover:bg-blue-50 rounded"><Pencil size={16} /></button>
                    <button onClick={() => handleDelete(u.id)} className="p-1.5 text-red-500 hover:bg-red-50 rounded"><Trash2 size={16} /></button>
                  </div>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
        {users.length === 0 && <div className="text-center py-12 text-gray-400">Nenhum usuário cadastrado</div>}
      </div>

      {showModal && (
        <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4">
          <div className="card w-full max-w-md p-6">
            <h2 className="text-xl font-bold text-gray-800 mb-4">{editing ? 'Editar' : 'Novo'} Usuário</h2>
            <form onSubmit={handleSubmit} className="space-y-3">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Nome *</label>
                <input type="text" className="input-field" value={form.name} onChange={e => setForm(p => ({ ...p, name: e.target.value }))} required />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">E-mail *</label>
                <input type="email" className="input-field" value={form.email} onChange={e => setForm(p => ({ ...p, email: e.target.value }))} required />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">CPF / CNPJ</label>
                <input
                  type="text"
                  inputMode="numeric"
                  className="input-field font-mono"
                  placeholder="000.000.000-00"
                  maxLength={18}
                  value={form.cpfCnpj}
                  onChange={e => {
                    const digits = e.target.value.replace(/\D/g, '').slice(0, 14)
                    setForm(p => ({ ...p, cpfCnpj: formatCpfCnpj(digits) }))
                  }}
                />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Celular</label>
                <input
                  type="tel"
                  inputMode="numeric"
                  className="input-field"
                  placeholder="(11) 99999-9999"
                  maxLength={15}
                  value={form.phone}
                  onChange={e => setForm(p => ({ ...p, phone: formatPhone(e.target.value) }))}
                />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Endereço</label>
                <input type="text" className="input-field" value={form.address} onChange={e => setForm(p => ({ ...p, address: e.target.value }))} />
              </div>
              {!editing && (
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">Senha *</label>
                  <input type="password" className="input-field" value={form.password} onChange={e => setForm(f => ({ ...f, password: e.target.value }))} required />
                </div>
              )}
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Perfil</label>
                <select className="input-field" value={form.role} onChange={e => setForm(f => ({ ...f, role: e.target.value }))}>
                  <option value="CUSTOMER">Cliente</option>
                  <option value="ADMIN">Administrador</option>
                </select>
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
