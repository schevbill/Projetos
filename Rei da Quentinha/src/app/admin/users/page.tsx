'use client'
import { useEffect, useState } from 'react'
import toast from 'react-hot-toast'
import { Plus, Pencil, Trash2, UserCircle, CheckCircle, XCircle, Eye, EyeOff, Mail, CreditCard, Calendar, Phone, User, Lock } from 'lucide-react'
import { validateEmail, validateCpfCnpj, formatCpfCnpj, validatePhone, formatPhone, validatePassword, checkPasswordRules } from '@/lib/validators'
import AddressManager, { type AddressData } from '@/components/AddressManager'

interface UserRow { id: string; name: string; email: string; cpfCnpj?: string | null; phone?: string | null; birthDate?: string | null; role: string; createdAt: string }

const emptyCreate = { name: '', email: '', cpfCnpj: '', phone: '', birthDate: '', password: '', confirmPassword: '', role: 'CUSTOMER' }
const emptyEdit   = { name: '', email: '', cpfCnpj: '', phone: '', birthDate: '', password: '', confirmPassword: '', role: 'CUSTOMER' }

export default function AdminUsers() {
  const [users, setUsers]           = useState<UserRow[]>([])
  const [showModal, setShowModal]   = useState(false)
  const [editing, setEditing]       = useState<UserRow | null>(null)
  const [createForm, setCreateForm] = useState(emptyCreate)
  const [editForm, setEditForm]     = useState(emptyEdit)
  const [addresses, setAddresses]   = useState<AddressData[]>([])
  const [errors, setErrors]         = useState<Record<string, string>>({})
  const [loading, setLoading]       = useState(false)
  const [showPassword, setShowPassword] = useState(false)

  const load = () => fetch('/api/users').then(r => r.ok ? r.json() : []).then(data => setUsers(Array.isArray(data) ? data : []))
  useEffect(() => { load() }, [])

  const openCreate = () => {
    setEditing(null)
    setCreateForm(emptyCreate)
    setAddresses([])
    setErrors({})
    setShowModal(true)
  }

  const openEdit = async (u: UserRow) => {
    setEditing(u)
    const bd = u.birthDate ? new Date(u.birthDate).toISOString().split('T')[0] : ''
    setEditForm({ name: u.name, email: u.email, cpfCnpj: u.cpfCnpj || '', phone: u.phone || '', birthDate: bd, password: '', confirmPassword: '', role: u.role })
    setErrors({})
    const addrs = await fetch(`/api/addresses?userId=${u.id}`).then(r => r.ok ? r.json() : [])
    setAddresses(addrs)
    setShowModal(true)
  }

  const setCreateField = (key: string, value: string) => {
    setCreateForm(f => ({ ...f, [key]: value }))
    setErrors(p => ({ ...p, [key]: '' }))
  }

  const validateCreate = () => {
    const e: Record<string, string> = {}
    if (!createForm.name.trim()) e.name = 'Nome obrigatório'
    if (!createForm.birthDate) {
      e.birthDate = 'Data de nascimento obrigatória'
    } else {
      const birth = new Date(createForm.birthDate)
      const today = new Date()
      const age = today.getFullYear() - birth.getFullYear() -
        (today < new Date(today.getFullYear(), birth.getMonth(), birth.getDate()) ? 1 : 0)
      if (isNaN(birth.getTime())) e.birthDate = 'Data inválida'
      else if (age < 18) e.birthDate = 'É necessário ter 18 anos ou mais'
      else if (age > 120) e.birthDate = 'Data de nascimento inválida'
    }
    const emailErr = validateEmail(createForm.email)
    if (emailErr) e.email = emailErr
    const cpfErr = validateCpfCnpj(createForm.cpfCnpj)
    if (cpfErr) e.cpfCnpj = cpfErr
    if (createForm.phone) {
      const phoneErr = validatePhone(createForm.phone)
      if (phoneErr) e.phone = phoneErr
    }
    const pwErr = validatePassword(createForm.password)
    if (pwErr) e.password = pwErr
    if (createForm.password !== createForm.confirmPassword) e.confirmPassword = 'Senhas não conferem'
    if (addresses.length === 0) e.addresses = 'Cadastre pelo menos um endereço'
    setErrors(e)
    return Object.keys(e).length === 0
  }

  const handleCreate = async (ev: React.FormEvent) => {
    ev.preventDefault()
    if (!validateCreate()) return
    setLoading(true)
    try {
      const res = await fetch('/api/users', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          name: createForm.name, email: createForm.email, cpfCnpj: createForm.cpfCnpj,
          phone: createForm.phone, birthDate: createForm.birthDate,
          password: createForm.password, role: createForm.role,
        }),
      })
      if (!res.ok) { const e = await res.json(); throw new Error(e.error) }
      const created = await res.json()
      for (const addr of addresses) {
        await fetch('/api/addresses', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({ ...addr, userId: created.id }),
        })
      }
      toast.success('Usuário criado!')
      setShowModal(false)
      load()
    } catch (e: unknown) {
      toast.error(e instanceof Error ? e.message : 'Erro ao criar usuário')
    } finally {
      setLoading(false)
    }
  }

  const setEditField = (key: string, value: string) => {
    setEditForm(f => ({ ...f, [key]: value }))
    setErrors(p => ({ ...p, [key]: '' }))
  }

  const handleEdit = async (ev: React.FormEvent) => {
    ev.preventDefault()
    if (!editing) return
    const e: Record<string, string> = {}
    if (!editForm.name.trim()) e.name = 'Nome obrigatório'
    const emailErr = validateEmail(editForm.email)
    if (emailErr) e.email = emailErr
    if (editForm.cpfCnpj) {
      const cpfErr = validateCpfCnpj(editForm.cpfCnpj)
      if (cpfErr) e.cpfCnpj = cpfErr
    }
    if (editForm.phone) {
      const phoneErr = validatePhone(editForm.phone)
      if (phoneErr) e.phone = phoneErr
    }
    if (editForm.password && editForm.password !== editForm.confirmPassword) e.confirmPassword = 'Senhas não conferem'
    if (editForm.password && editForm.password.length < 6) e.password = 'Senha deve ter pelo menos 6 caracteres'
    if (Object.keys(e).length) { setErrors(e); return }

    setLoading(true)
    try {
      const body: Record<string, string> = {
        name: editForm.name, email: editForm.email,
        cpfCnpj: editForm.cpfCnpj, phone: editForm.phone,
        birthDate: editForm.birthDate, role: editForm.role,
      }
      if (editForm.password) body.password = editForm.password
      const res = await fetch(`/api/users/${editing.id}`, {
        method: 'PUT', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify(body),
      })
      if (!res.ok) { const err = await res.json(); throw new Error(err.error) }
      toast.success('Usuário atualizado!')
      setShowModal(false)
      load()
    } catch (err: unknown) {
      toast.error(err instanceof Error ? err.message : 'Erro ao salvar')
    } finally {
      setLoading(false)
    }
  }

  const handleDelete = async (id: string) => {
    if (!confirm('Excluir este usuário?')) return
    const res = await fetch(`/api/users/${id}`, { method: 'DELETE' })
    if (res.ok) { toast.success('Usuário excluído'); load() }
  }

  const cleanDoc = createForm.cpfCnpj.replace(/[.\-\/]/g, '').replace(/[^A-Z0-9]/gi, '')
  const docLabel = cleanDoc.length > 11 || /[A-Z]/i.test(cleanDoc) ? 'CNPJ' : 'CPF'

  return (
    <div className="p-8">
      <div className="flex justify-between items-center mb-8">
        <h1 className="text-3xl font-bold text-gray-800">Usuários</h1>
        <button onClick={openCreate} className="btn-primary flex items-center gap-2"><Plus size={18} /> Novo Usuário</button>
      </div>

      <div className="card overflow-x-auto">
        <table className="w-full text-sm min-w-[700px]">
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
          <div className="card w-full max-w-lg max-h-[90vh] overflow-y-auto p-6">
            <h2 className="text-xl font-bold text-gray-800 mb-6">{editing ? 'Editar Usuário' : 'Novo Usuário'}</h2>

            {/* ── CRIAÇÃO ── */}
            {!editing && (
              <form onSubmit={handleCreate} className="space-y-4">

                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1 flex items-center gap-1.5"><User size={14} /> Nome completo *</label>
                  <input className={`input-field ${errors.name ? 'border-red-400' : ''}`}
                    value={createForm.name} onChange={e => setCreateField('name', e.target.value)} />
                  {errors.name && <p className="text-red-500 text-xs mt-1">{errors.name}</p>}
                </div>

                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1 flex items-center gap-1.5">
                    <CreditCard size={14} /> CPF / CNPJ *
                    {createForm.cpfCnpj && <span className="ml-1 text-xs text-gray-400 font-normal">{docLabel}</span>}
                  </label>
                  <div className="relative">
                    <input
                      type="text" inputMode="text" autoCapitalize="characters"
                      className={`input-field pr-9 uppercase ${errors.cpfCnpj ? 'border-red-400' : createForm.cpfCnpj && !validateCpfCnpj(createForm.cpfCnpj) ? 'border-green-400' : ''}`}
                      placeholder="000.000.000-00 OU 00.000.000/0000-00" maxLength={18} value={createForm.cpfCnpj}
                      onChange={e => {
                        const raw = e.target.value.toUpperCase().replace(/[^A-Z0-9.\-\/]/g, '').slice(0, 18)
                        setCreateField('cpfCnpj', formatCpfCnpj(raw))
                      }}
                    />
                    {createForm.cpfCnpj && (
                      <div className="absolute right-3 top-1/2 -translate-y-1/2">
                        {!validateCpfCnpj(createForm.cpfCnpj) ? <CheckCircle size={16} className="text-green-500" /> : <XCircle size={16} className="text-red-400" />}
                      </div>
                    )}
                  </div>
                  {errors.cpfCnpj && <p className="text-red-500 text-xs mt-1">{errors.cpfCnpj}</p>}
                  {createForm.cpfCnpj && !validateCpfCnpj(createForm.cpfCnpj) && <p className="text-green-600 text-xs mt-1">{docLabel} válido</p>}
                </div>

                <div className="grid grid-cols-2 gap-3">
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1 flex items-center gap-1.5"><Calendar size={14} /> Nascimento *</label>
                    <input type="date"
                      className={`input-field ${errors.birthDate ? 'border-red-400' : createForm.birthDate && !errors.birthDate ? 'border-green-400' : ''}`}
                      value={createForm.birthDate} max={new Date().toISOString().split('T')[0]}
                      onChange={e => setCreateField('birthDate', e.target.value)} />
                    {errors.birthDate && <p className="text-red-500 text-xs mt-1">{errors.birthDate}</p>}
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1 flex items-center gap-1.5"><Phone size={14} /> Celular</label>
                    <div className="relative">
                      <input type="tel" inputMode="numeric"
                        className={`input-field pr-9 ${errors.phone ? 'border-red-400' : createForm.phone && !validatePhone(createForm.phone) ? 'border-green-400' : ''}`}
                        placeholder="(11) 99999-9999" maxLength={15} value={createForm.phone}
                        onChange={e => { setCreateForm(f => ({ ...f, phone: formatPhone(e.target.value) })); setErrors(p => ({ ...p, phone: '' })) }}
                      />
                      {createForm.phone && (
                        <div className="absolute right-3 top-1/2 -translate-y-1/2">
                          {!validatePhone(createForm.phone) ? <CheckCircle size={16} className="text-green-500" /> : <XCircle size={16} className="text-red-400" />}
                        </div>
                      )}
                    </div>
                    {errors.phone && <p className="text-red-500 text-xs mt-1">{errors.phone}</p>}
                  </div>
                </div>

                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1 flex items-center gap-1.5"><Mail size={14} /> E-mail *</label>
                  <div className="relative">
                    <input type="email"
                      className={`input-field pr-9 ${errors.email ? 'border-red-400' : createForm.email && !validateEmail(createForm.email) ? 'border-green-400' : ''}`}
                      value={createForm.email} onChange={e => setCreateField('email', e.target.value)} />
                    {createForm.email && (
                      <div className="absolute right-3 top-1/2 -translate-y-1/2">
                        {!validateEmail(createForm.email) ? <CheckCircle size={16} className="text-green-500" /> : <XCircle size={16} className="text-red-400" />}
                      </div>
                    )}
                  </div>
                  {errors.email && <p className="text-red-500 text-xs mt-1">{errors.email}</p>}
                </div>

                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-2">Endereços de entrega <span className="text-red-500">*</span></label>
                  <AddressManager
                    addresses={addresses}
                    onChange={list => { setAddresses(list); setErrors(p => ({ ...p, addresses: '' })) }}
                    persist={false}
                  />
                  {errors.addresses && <p className="text-red-500 text-xs mt-2">{errors.addresses}</p>}
                </div>

                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1 flex items-center gap-1.5"><Lock size={14} /> Senha *</label>
                  <div className="relative">
                    <input type={showPassword ? 'text' : 'password'}
                      className={`input-field pr-10 ${errors.password ? 'border-red-400' : createForm.password && !validatePassword(createForm.password) ? 'border-green-400' : ''}`}
                      value={createForm.password}
                      onChange={e => { setCreateForm(f => ({ ...f, password: e.target.value })); setErrors(p => ({ ...p, password: '' })) }}
                      autoComplete="new-password" />
                    <button type="button" className="absolute right-3 top-1/2 -translate-y-1/2 text-gray-400 hover:text-gray-600"
                      onMouseDown={() => setShowPassword(true)} onMouseUp={() => setShowPassword(false)} onMouseLeave={() => setShowPassword(false)}>
                      {showPassword ? <EyeOff size={16} /> : <Eye size={16} />}
                    </button>
                  </div>
                  {createForm.password && (() => {
                    const rules = checkPasswordRules(createForm.password)
                    const items = [
                      { ok: rules.minLength, label: 'Mínimo 8 caracteres' },
                      { ok: rules.hasUpper,  label: '1 letra maiúscula' },
                      { ok: rules.hasNumber, label: '1 número' },
                      { ok: rules.hasSpecial, label: '1 caractere especial' },
                    ]
                    return (
                      <div className="mt-2 grid grid-cols-2 gap-1">
                        {items.map(item => (
                          <div key={item.label} className={`flex items-center gap-1.5 text-xs font-medium ${item.ok ? 'text-green-600' : 'text-gray-400'}`}>
                            <div className={`w-3.5 h-3.5 rounded-full flex items-center justify-center flex-shrink-0 ${item.ok ? 'bg-green-500' : 'bg-gray-200'}`}>
                              {item.ok && <svg width="8" height="8" viewBox="0 0 8 8" fill="none"><path d="M1.5 4L3 5.5L6.5 2" stroke="white" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round"/></svg>}
                            </div>
                            {item.label}
                          </div>
                        ))}
                      </div>
                    )
                  })()}
                  {errors.password && <p className="text-red-500 text-xs mt-1">{errors.password}</p>}
                </div>

                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">Confirmar senha *</label>
                  <div className="relative">
                    <input type="password"
                      className={`input-field pr-9 ${errors.confirmPassword ? 'border-red-400' : createForm.confirmPassword && createForm.password === createForm.confirmPassword ? 'border-green-400' : ''}`}
                      value={createForm.confirmPassword}
                      onChange={e => { setCreateForm(f => ({ ...f, confirmPassword: e.target.value })); setErrors(p => ({ ...p, confirmPassword: '' })) }}
                      autoComplete="new-password" />
                    {createForm.confirmPassword && (
                      <div className="absolute right-3 top-1/2 -translate-y-1/2">
                        {createForm.password === createForm.confirmPassword ? <CheckCircle size={16} className="text-green-500" /> : <XCircle size={16} className="text-red-400" />}
                      </div>
                    )}
                  </div>
                  {errors.confirmPassword && <p className="text-red-500 text-xs mt-1">{errors.confirmPassword}</p>}
                </div>

                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">Perfil</label>
                  <select className="input-field" value={createForm.role} onChange={e => setCreateField('role', e.target.value)}>
                    <option value="CUSTOMER">Cliente</option>
                    <option value="ADMIN">Administrador</option>
                  </select>
                </div>

                <div className="flex gap-3 pt-2">
                  <button type="submit" disabled={loading} className="btn-primary flex-1">{loading ? 'Criando...' : 'Criar Usuário'}</button>
                  <button type="button" onClick={() => setShowModal(false)} className="btn-secondary flex-1">Cancelar</button>
                </div>
              </form>
            )}

            {/* ── EDIÇÃO ── */}
            {editing && (
              <form onSubmit={handleEdit} className="space-y-4">

                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1 flex items-center gap-1.5"><User size={14} /> Nome completo *</label>
                  <input className={`input-field ${errors.name ? 'border-red-400' : ''}`} value={editForm.name}
                    onChange={e => setEditField('name', e.target.value)} />
                  {errors.name && <p className="text-red-500 text-xs mt-1">{errors.name}</p>}
                </div>

                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1 flex items-center gap-1.5">
                    <CreditCard size={14} /> CPF / CNPJ
                    {editForm.cpfCnpj && (() => { const c = editForm.cpfCnpj.replace(/[.\-\/]/g, '').replace(/[^A-Z0-9]/gi, ''); return <span className="ml-1 text-xs text-gray-400 font-normal">{c.length > 11 || /[A-Z]/i.test(c) ? 'CNPJ' : 'CPF'}</span> })()}
                  </label>
                  <div className="relative">
                    <input type="text" inputMode="text" autoCapitalize="characters"
                      className={`input-field pr-9 uppercase ${errors.cpfCnpj ? 'border-red-400' : editForm.cpfCnpj && !validateCpfCnpj(editForm.cpfCnpj) ? 'border-green-400' : ''}`}
                      placeholder="000.000.000-00 OU 00.000.000/0000-00" maxLength={18} value={editForm.cpfCnpj}
                      onChange={e => {
                        const raw = e.target.value.toUpperCase().replace(/[^A-Z0-9.\-\/]/g, '').slice(0, 18)
                        setEditField('cpfCnpj', formatCpfCnpj(raw))
                      }} />
                    {editForm.cpfCnpj && (
                      <div className="absolute right-3 top-1/2 -translate-y-1/2">
                        {!validateCpfCnpj(editForm.cpfCnpj) ? <CheckCircle size={16} className="text-green-500" /> : <XCircle size={16} className="text-red-400" />}
                      </div>
                    )}
                  </div>
                  {errors.cpfCnpj && <p className="text-red-500 text-xs mt-1">{errors.cpfCnpj}</p>}
                  {editForm.cpfCnpj && !validateCpfCnpj(editForm.cpfCnpj) && (() => { const c = editForm.cpfCnpj.replace(/[.\-\/]/g, '').replace(/[^A-Z0-9]/gi, ''); return <p className="text-green-600 text-xs mt-1">{c.length > 11 || /[A-Z]/i.test(c) ? 'CNPJ' : 'CPF'} válido</p> })()}
                </div>

                <div className="grid grid-cols-2 gap-3">
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1 flex items-center gap-1.5"><Calendar size={14} /> Nascimento</label>
                    <input type="date" className="input-field" value={editForm.birthDate}
                      max={new Date().toISOString().split('T')[0]}
                      onChange={e => setEditField('birthDate', e.target.value)} />
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1 flex items-center gap-1.5"><Phone size={14} /> Celular</label>
                    <div className="relative">
                      <input type="tel" inputMode="numeric"
                        className={`input-field pr-9 ${errors.phone ? 'border-red-400' : editForm.phone && !validatePhone(editForm.phone) ? 'border-green-400' : ''}`}
                        placeholder="(11) 99999-9999" maxLength={15} value={editForm.phone}
                        onChange={e => { setEditForm(f => ({ ...f, phone: formatPhone(e.target.value) })); setErrors(p => ({ ...p, phone: '' })) }} />
                      {editForm.phone && (
                        <div className="absolute right-3 top-1/2 -translate-y-1/2">
                          {!validatePhone(editForm.phone) ? <CheckCircle size={16} className="text-green-500" /> : <XCircle size={16} className="text-red-400" />}
                        </div>
                      )}
                    </div>
                    {errors.phone && <p className="text-red-500 text-xs mt-1">{errors.phone}</p>}
                  </div>
                </div>

                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1 flex items-center gap-1.5"><Mail size={14} /> E-mail *</label>
                  <div className="relative">
                    <input type="email"
                      className={`input-field pr-9 ${errors.email ? 'border-red-400' : editForm.email && !validateEmail(editForm.email) ? 'border-green-400' : ''}`}
                      value={editForm.email} onChange={e => setEditField('email', e.target.value)} />
                    {editForm.email && (
                      <div className="absolute right-3 top-1/2 -translate-y-1/2">
                        {!validateEmail(editForm.email) ? <CheckCircle size={16} className="text-green-500" /> : <XCircle size={16} className="text-red-400" />}
                      </div>
                    )}
                  </div>
                  {errors.email && <p className="text-red-500 text-xs mt-1">{errors.email}</p>}
                </div>

                {/* Endereços */}
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-2">Endereços de entrega</label>
                  <AddressManager addresses={addresses} onChange={setAddresses} persist={true} forUserId={editing.id} />
                </div>

                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">Perfil</label>
                  <select className="input-field" value={editForm.role} onChange={e => setEditField('role', e.target.value)}>
                    <option value="CUSTOMER">Cliente</option>
                    <option value="ADMIN">Administrador</option>
                  </select>
                </div>

                <div className="border-t border-gray-100 pt-4">
                  <h3 className="text-sm font-semibold text-gray-700 flex items-center gap-1.5 mb-1"><Lock size={14} /> Alterar Senha</h3>
                  <p className="text-gray-400 text-xs mb-3">Deixe em branco para manter a senha atual</p>
                  <div className="space-y-3">
                    <div>
                      <label className="block text-sm font-medium text-gray-700 mb-1">Nova senha</label>
                      <input type="password" className={`input-field ${errors.password ? 'border-red-400' : ''}`}
                        placeholder="••••••••" autoComplete="new-password" value={editForm.password}
                        onChange={e => { setEditForm(f => ({ ...f, password: e.target.value })); setErrors(p => ({ ...p, password: '' })) }} />
                      {errors.password && <p className="text-red-500 text-xs mt-1">{errors.password}</p>}
                    </div>
                    <div>
                      <label className="block text-sm font-medium text-gray-700 mb-1">Confirmar nova senha</label>
                      <div className="relative">
                        <input type="password"
                          className={`input-field pr-9 ${errors.confirmPassword ? 'border-red-400' : editForm.confirmPassword && editForm.password === editForm.confirmPassword ? 'border-green-400' : ''}`}
                          placeholder="••••••••" autoComplete="new-password" value={editForm.confirmPassword}
                          onChange={e => { setEditForm(f => ({ ...f, confirmPassword: e.target.value })); setErrors(p => ({ ...p, confirmPassword: '' })) }} />
                        {editForm.confirmPassword && (
                          <div className="absolute right-3 top-1/2 -translate-y-1/2">
                            {editForm.password === editForm.confirmPassword ? <CheckCircle size={16} className="text-green-500" /> : <XCircle size={16} className="text-red-400" />}
                          </div>
                        )}
                      </div>
                      {errors.confirmPassword && <p className="text-red-500 text-xs mt-1">{errors.confirmPassword}</p>}
                    </div>
                  </div>
                </div>

                <div className="flex gap-3 pt-2">
                  <button type="submit" disabled={loading} className="btn-primary flex-1">{loading ? 'Salvando...' : 'Salvar'}</button>
                  <button type="button" onClick={() => setShowModal(false)} className="btn-secondary flex-1">Cancelar</button>
                </div>
              </form>
            )}
          </div>
        </div>
      )}
    </div>
  )
}
