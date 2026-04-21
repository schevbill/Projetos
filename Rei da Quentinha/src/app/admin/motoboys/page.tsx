'use client'
import { useEffect, useState, useCallback } from 'react'
import toast from 'react-hot-toast'
import { Plus, Pencil, Trash2, Bike, Car, Tag, X, Search, Loader2 } from 'lucide-react'
import { validatePhone, formatPhone, formatCpfCnpj, validateCpfCnpj } from '@/lib/validators'

interface VehicleType { id: string; name: string }
interface MotoboyVehicle { id: string; vehicleTypeId?: string | null; vehicleType?: VehicleType | null; plate?: string | null }
interface Motoboy {
  id: string; name: string; phone: string
  cpfCnpj?: string | null
  cep?: string | null; logradouro?: string | null; numero?: string | null
  complemento?: string | null; bairro?: string | null; cidade?: string | null; estado?: string | null
  vehicles: MotoboyVehicle[]; active: boolean
}

type VehicleRow = { vehicleTypeId: string; plate: string }

const emptyForm = {
  name: '', phone: '', cpfCnpj: '',
  cep: '', logradouro: '', numero: '', complemento: '', bairro: '', cidade: '', estado: '',
  active: true,
}

function formatPlate(raw: string): string {
  const clean = raw.replace(/[^A-Z0-9]/gi, '').toUpperCase().slice(0, 7)
  if (clean.length <= 3) return clean
  return `${clean.slice(0, 3)}-${clean.slice(3)}`
}

function formatCep(raw: string): string {
  const d = raw.replace(/\D/g, '').slice(0, 8)
  return d.length > 5 ? `${d.slice(0, 5)}-${d.slice(5)}` : d
}

function docLabel(val: string): string {
  const c = val.replace(/[.\-\/]/g, '').replace(/[^A-Z0-9]/gi, '')
  return c.length > 11 || /[A-Z]/i.test(c) ? 'CNPJ' : 'CPF'
}

export default function AdminMotoboys() {
  const [tab, setTab] = useState<'motoboys' | 'types'>('motoboys')

  const [motoboys, setMotoboys] = useState<Motoboy[]>([])
  const [showModal, setShowModal] = useState(false)
  const [editing, setEditing] = useState<Motoboy | null>(null)
  const [form, setForm] = useState(emptyForm)
  const [vehicleRows, setVehicleRows] = useState<VehicleRow[]>([{ vehicleTypeId: '', plate: '' }])
  const [loading, setLoading] = useState(false)
  const [cepLoading, setCepLoading] = useState(false)

  const [vehicleTypes, setVehicleTypes] = useState<VehicleType[]>([])
  const [typeForm, setTypeForm] = useState({ name: '' })
  const [editingType, setEditingType] = useState<VehicleType | null>(null)
  const [showTypeModal, setShowTypeModal] = useState(false)
  const [typeLoading, setTypeLoading] = useState(false)

  const loadMotoboys = useCallback(() =>
    fetch('/api/motoboys').then(r => r.json()).then(d => setMotoboys(Array.isArray(d) ? d : [])), [])
  const loadTypes = useCallback(() =>
    fetch('/api/vehicle-types').then(r => r.json()).then(d => setVehicleTypes(Array.isArray(d) ? d : [])), [])

  useEffect(() => { loadMotoboys(); loadTypes() }, [loadMotoboys, loadTypes])

  const buscarCep = async (cep: string) => {
    const clean = cep.replace(/\D/g, '')
    if (clean.length !== 8) return
    setCepLoading(true)
    try {
      const res = await fetch(`https://viacep.com.br/ws/${clean}/json/`)
      const data = await res.json()
      if (data.erro) { toast.error('CEP não encontrado'); return }
      setForm(f => ({
        ...f,
        logradouro: data.logradouro || '',
        bairro: data.bairro || '',
        cidade: data.localidade || '',
        estado: data.uf || '',
        complemento: data.complemento || f.complemento,
      }))
      toast.success('Endereço encontrado!')
      setTimeout(() => document.getElementById('moto-numero')?.focus(), 100)
    } catch {
      toast.error('Erro ao buscar CEP')
    } finally {
      setCepLoading(false)
    }
  }

  const openCreate = () => {
    setEditing(null); setForm(emptyForm)
    setVehicleRows([{ vehicleTypeId: '', plate: '' }]); setShowModal(true)
  }

  const openEdit = (m: Motoboy) => {
    setEditing(m)
    setForm({
      name: m.name, phone: m.phone, cpfCnpj: m.cpfCnpj || '',
      cep: m.cep || '', logradouro: m.logradouro || '', numero: m.numero || '',
      complemento: m.complemento || '', bairro: m.bairro || '',
      cidade: m.cidade || '', estado: m.estado || '', active: m.active,
    })
    setVehicleRows(m.vehicles.length > 0
      ? m.vehicles.map(v => ({ vehicleTypeId: v.vehicleTypeId || '', plate: v.plate || '' }))
      : [{ vehicleTypeId: '', plate: '' }])
    setShowModal(true)
  }

  const addVehicleRow = () => setVehicleRows(r => [...r, { vehicleTypeId: '', plate: '' }])
  const removeVehicleRow = (i: number) => setVehicleRows(r => r.filter((_, idx) => idx !== i))
  const updateVehicleRow = (i: number, field: keyof VehicleRow, val: string) =>
    setVehicleRows(r => r.map((row, idx) => idx === i ? { ...row, [field]: val } : row))

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    const phoneErr = validatePhone(form.phone)
    if (phoneErr) { toast.error(phoneErr); return }
    if (form.cpfCnpj) {
      const docErr = validateCpfCnpj(form.cpfCnpj)
      if (docErr) { toast.error(docErr); return }
    }
    setLoading(true)
    try {
      const payload = { ...form, vehicles: vehicleRows.filter(v => v.vehicleTypeId || v.plate) }
      const res = editing
        ? await fetch(`/api/motoboys/${editing.id}`, { method: 'PUT', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify(payload) })
        : await fetch('/api/motoboys', { method: 'POST', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify(payload) })
      if (!res.ok) throw new Error()
      toast.success(editing ? 'Motoboy atualizado!' : 'Motoboy cadastrado!')
      setShowModal(false); loadMotoboys()
    } catch {
      toast.error('Erro ao salvar')
    } finally {
      setLoading(false)
    }
  }

  const handleDelete = async (id: string) => {
    if (!confirm('Excluir este motoboy?')) return
    const res = await fetch(`/api/motoboys/${id}`, { method: 'DELETE' })
    if (res.ok) { toast.success('Motoboy excluído'); loadMotoboys() }
    else toast.error('Erro ao excluir')
  }

  const openCreateType = () => { setEditingType(null); setTypeForm({ name: '' }); setShowTypeModal(true) }
  const openEditType = (t: VehicleType) => { setEditingType(t); setTypeForm({ name: t.name }); setShowTypeModal(true) }

  const handleTypeSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    if (!typeForm.name.trim()) { toast.error('Nome obrigatório'); return }
    setTypeLoading(true)
    try {
      const res = editingType
        ? await fetch(`/api/vehicle-types/${editingType.id}`, { method: 'PUT', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify(typeForm) })
        : await fetch('/api/vehicle-types', { method: 'POST', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify(typeForm) })
      if (!res.ok) { const d = await res.json(); throw new Error(d.error) }
      toast.success(editingType ? 'Tipo atualizado!' : 'Tipo criado!')
      setShowTypeModal(false); loadTypes()
    } catch (err: unknown) {
      toast.error(err instanceof Error ? err.message : 'Erro ao salvar')
    } finally {
      setTypeLoading(false)
    }
  }

  const handleDeleteType = async (id: string) => {
    if (!confirm('Excluir este tipo de veículo?')) return
    const res = await fetch(`/api/vehicle-types/${id}`, { method: 'DELETE' })
    if (res.ok) { toast.success('Tipo excluído'); loadTypes() }
    else { const d = await res.json(); toast.error(d.error || 'Erro ao excluir') }
  }

  const cpfCnpjErr = form.cpfCnpj ? validateCpfCnpj(form.cpfCnpj) : null
  const label = docLabel(form.cpfCnpj)

  return (
    <div className="p-8">
      <div className="flex justify-between items-center mb-6">
        <h1 className="text-3xl font-bold text-gray-800">Motoboys</h1>
        {tab === 'motoboys'
          ? <button onClick={openCreate} className="btn-primary flex items-center gap-2"><Plus size={18} /> Novo Motoboy</button>
          : <button onClick={openCreateType} className="btn-primary flex items-center gap-2"><Plus size={18} /> Novo Tipo</button>
        }
      </div>

      {/* Tabs */}
      <div className="flex gap-1 mb-6 border-b border-gray-200">
        {([
          { key: 'motoboys', label: 'Motoboys', icon: Bike },
          { key: 'types', label: 'Tipos de Veículo', icon: Car },
        ] as const).map(({ key, label: lbl, icon: Icon }) => (
          <button key={key} onClick={() => setTab(key)}
            className={`flex items-center gap-2 px-4 py-2.5 text-sm font-medium border-b-2 transition-colors -mb-px ${tab === key ? 'border-brand-500 text-brand-600' : 'border-transparent text-gray-500 hover:text-gray-700'}`}>
            <Icon size={16} /> {lbl}
          </button>
        ))}
      </div>

      {/* ── Tab Motoboys ── */}
      {tab === 'motoboys' && (
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-5">
          {motoboys.map(m => (
            <div key={m.id} className="card overflow-hidden flex flex-col">

              {/* Header */}
              <div className="flex items-center gap-3 px-5 py-4 border-b border-gray-100">
                <div className="w-10 h-10 bg-brand-100 rounded-full flex items-center justify-center flex-shrink-0">
                  <Bike size={20} className="text-brand-500" />
                </div>
                <h3 className="font-bold text-gray-800 leading-tight">{m.name}</h3>
                <span className={`px-2 py-0.5 rounded-full text-xs font-semibold flex-shrink-0 ${m.active ? 'bg-green-100 text-green-700' : 'bg-red-100 text-red-700'}`}>
                  {m.active ? 'Ativo' : 'Inativo'}
                </span>
              </div>

              <div className="flex flex-col divide-y divide-gray-100 flex-1">

                {/* Grupo: Dados Pessoais */}
                <div className="px-5 py-3">
                  <p className="text-[10px] font-semibold text-gray-400 uppercase tracking-wider mb-2">Dados Pessoais</p>
                  <div className="space-y-1 text-sm">
                    <div className="flex items-center gap-2 text-gray-600">
                      <span className="text-gray-400 text-xs w-14 flex-shrink-0">Celular</span>
                      <span>{m.phone}</span>
                    </div>
                    {m.cpfCnpj && (
                      <div className="flex items-center gap-2 text-gray-600">
                        <span className="text-gray-400 text-xs w-14 flex-shrink-0">
                          {m.cpfCnpj.replace(/\D/g, '').length > 11 ? 'CNPJ' : 'CPF'}
                        </span>
                        <span className="font-mono text-xs">{m.cpfCnpj}</span>
                      </div>
                    )}
                  </div>
                </div>

                {/* Grupo: Endereço */}
                {(m.logradouro || m.cidade || m.cep) && (
                  <div className="px-5 py-3">
                    <p className="text-[10px] font-semibold text-gray-400 uppercase tracking-wider mb-2">Endereço</p>
                    <div className="space-y-0.5 text-xs text-gray-600 leading-relaxed">
                      {(m.logradouro || m.numero) && (
                        <p>{[m.logradouro, m.numero && `nº ${m.numero}`, m.complemento].filter(Boolean).join(', ')}</p>
                      )}
                      {(m.bairro || m.cidade) && (
                        <p>{[m.bairro, m.cidade, m.estado].filter(Boolean).join(' — ')}</p>
                      )}
                      {m.cep && <p className="font-mono text-gray-400">CEP {m.cep}</p>}
                    </div>
                  </div>
                )}

                {/* Grupo: Veículos */}
                {m.vehicles.length > 0 && (
                  <div className="px-5 py-3">
                    <p className="text-[10px] font-semibold text-gray-400 uppercase tracking-wider mb-2">Veículos</p>
                    <div className="space-y-1.5">
                      {m.vehicles.map(v => (
                        <div key={v.id} className="flex items-center gap-2">
                          {v.vehicleType && (
                            <span className="flex items-center gap-1 bg-gray-100 px-2 py-0.5 rounded-full text-xs font-medium text-gray-600">
                              <Tag size={10} /> {v.vehicleType.name}
                            </span>
                          )}
                          {v.plate && (
                            <span className="font-mono bg-yellow-50 border border-yellow-200 text-yellow-800 px-2 py-0.5 rounded text-xs tracking-widest">
                              {v.plate}
                            </span>
                          )}
                        </div>
                      ))}
                    </div>
                  </div>
                )}

              </div>

              {/* Ações */}
              <div className="flex gap-2 px-5 py-3 bg-gray-50 border-t border-gray-100">
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
              <Bike size={48} className="mx-auto mb-2" />Nenhum motoboy cadastrado
            </div>
          )}
        </div>
      )}

      {/* ── Tab Tipos de Veículo ── */}
      {tab === 'types' && (
        <div className="max-w-lg">
          {vehicleTypes.length === 0 ? (
            <div className="text-center py-16 text-gray-400"><Car size={48} className="mx-auto mb-2" />Nenhum tipo cadastrado</div>
          ) : (
            <div className="card divide-y divide-gray-100">
              {vehicleTypes.map(t => (
                <div key={t.id} className="flex items-center justify-between px-5 py-3">
                  <div className="flex items-center gap-3">
                    <div className="w-8 h-8 bg-brand-100 rounded-full flex items-center justify-center"><Car size={16} className="text-brand-500" /></div>
                    <span className="font-medium text-gray-800">{t.name}</span>
                  </div>
                  <div className="flex gap-2">
                    <button onClick={() => openEditType(t)} className="p-1.5 text-gray-400 hover:text-brand-600 hover:bg-brand-50 rounded-lg transition-colors"><Pencil size={15} /></button>
                    <button onClick={() => handleDeleteType(t.id)} className="p-1.5 text-gray-400 hover:text-red-600 hover:bg-red-50 rounded-lg transition-colors"><Trash2 size={15} /></button>
                  </div>
                </div>
              ))}
            </div>
          )}
        </div>
      )}

      {/* ── Modal Motoboy ── */}
      {showModal && (
        <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4">
          <div className="bg-gray-50 w-full max-w-2xl rounded-2xl max-h-[90vh] overflow-y-auto shadow-xl">

            {/* Título */}
            <div className="px-6 pt-6 pb-4 border-b border-gray-200">
              <h2 className="text-xl font-bold text-gray-800">{editing ? 'Editar' : 'Novo'} Motoboy</h2>
            </div>

            <form onSubmit={handleSubmit} className="p-6 space-y-4">

              {/* Card: Dados Pessoais */}
              <div className="bg-white rounded-xl border border-gray-200 overflow-hidden">
                <div className="px-5 py-3 border-b border-gray-100">
                  <h3 className="font-bold text-gray-800">Dados Pessoais</h3>
                </div>
                <div className="px-5 py-4 grid grid-cols-1 sm:grid-cols-2 gap-4">
                  <div className="sm:col-span-2">
                    <label className="block text-sm font-medium text-gray-700 mb-1">Nome completo *</label>
                    <input className="input-field" value={form.name} onChange={e => setForm(f => ({ ...f, name: e.target.value }))} required />
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">Celular *</label>
                    <input type="tel" inputMode="numeric" className="input-field" placeholder="(11) 99999-9999"
                      maxLength={15} value={form.phone}
                      onChange={e => setForm(f => ({ ...f, phone: formatPhone(e.target.value) }))} required />
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">{label}</label>
                    <input className="input-field" placeholder="000.000.000-00 OU 00.000.000/0000-00"
                      value={form.cpfCnpj}
                      onChange={e => setForm(f => ({ ...f, cpfCnpj: formatCpfCnpj(e.target.value) }))} />
                    {form.cpfCnpj && !cpfCnpjErr && <p className="text-green-600 text-xs mt-1">{label} válido</p>}
                    {form.cpfCnpj && cpfCnpjErr && <p className="text-red-500 text-xs mt-1">{cpfCnpjErr}</p>}
                  </div>
                  <div className="sm:col-span-2 flex items-center gap-2 pt-1">
                    <input type="checkbox" id="motoActive" checked={form.active}
                      onChange={e => setForm(f => ({ ...f, active: e.target.checked }))} />
                    <label htmlFor="motoActive" className="text-sm text-gray-700">Motoboy ativo</label>
                  </div>
                </div>
              </div>

              {/* Card: Endereço */}
              <div className="bg-white rounded-xl border border-gray-200 overflow-hidden">
                <div className="px-5 py-3 border-b border-gray-100">
                  <h3 className="font-bold text-gray-800">Endereço</h3>
                </div>
                <div className="px-5 py-4 grid grid-cols-1 sm:grid-cols-2 gap-4">
                  <div className="sm:col-span-2">
                    <label className="block text-sm font-medium text-gray-700 mb-1">CEP</label>
                    <div className="relative">
                      <input className="input-field pr-10" placeholder="00000-000" maxLength={9}
                        value={form.cep}
                        onChange={e => {
                          const v = formatCep(e.target.value)
                          setForm(f => ({ ...f, cep: v }))
                          if (v.replace(/\D/g, '').length === 8) buscarCep(v)
                        }} />
                      <div className="absolute right-3 top-1/2 -translate-y-1/2 text-gray-400">
                        {cepLoading ? <Loader2 size={16} className="animate-spin" /> : <Search size={16} />}
                      </div>
                    </div>
                    <p className="text-xs text-gray-400 mt-1">Preenchimento automático ao digitar</p>
                  </div>
                  <div className="sm:col-span-2">
                    <label className="block text-sm font-medium text-gray-700 mb-1">Rua / Avenida</label>
                    <input className="input-field" placeholder="Rua das Flores"
                      value={form.logradouro} onChange={e => setForm(f => ({ ...f, logradouro: e.target.value }))} />
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">Número</label>
                    <input id="moto-numero" className="input-field" placeholder="123"
                      value={form.numero} onChange={e => setForm(f => ({ ...f, numero: e.target.value }))} />
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">Complemento</label>
                    <input className="input-field" placeholder="Apto, Bloco..."
                      value={form.complemento} onChange={e => setForm(f => ({ ...f, complemento: e.target.value }))} />
                  </div>
                  <div className="sm:col-span-2">
                    <label className="block text-sm font-medium text-gray-700 mb-1">Bairro</label>
                    <input className="input-field" placeholder="Centro"
                      value={form.bairro} onChange={e => setForm(f => ({ ...f, bairro: e.target.value }))} />
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">Cidade</label>
                    <input className="input-field" placeholder="São Paulo"
                      value={form.cidade} onChange={e => setForm(f => ({ ...f, cidade: e.target.value }))} />
                  </div>
                  <div>
                    <label className="block text-sm font-medium text-gray-700 mb-1">Estado</label>
                    <input className="input-field uppercase" placeholder="SP" maxLength={2}
                      value={form.estado} onChange={e => setForm(f => ({ ...f, estado: e.target.value.toUpperCase() }))} />
                  </div>
                </div>
              </div>

              {/* Card: Veículos */}
              <div className="bg-white rounded-xl border border-gray-200 overflow-hidden">
                <div className="px-5 py-3 border-b border-gray-100 flex items-center justify-between">
                  <h3 className="font-bold text-gray-800">Veículos</h3>
                  <button type="button" onClick={addVehicleRow}
                    className="flex items-center gap-1 text-xs text-brand-600 hover:text-brand-700 font-semibold">
                    <Plus size={13} /> Adicionar veículo
                  </button>
                </div>
                <div className="px-5 py-4 space-y-2">
                  {vehicleRows.map((row, i) => (
                    <div key={i} className="flex gap-2 items-center bg-gray-50 rounded-lg p-2.5">
                      <select className="input-field flex-1 text-sm py-1.5"
                        value={row.vehicleTypeId} onChange={e => updateVehicleRow(i, 'vehicleTypeId', e.target.value)}>
                        <option value="">— Tipo —</option>
                        {vehicleTypes.map(t => <option key={t.id} value={t.id}>{t.name}</option>)}
                      </select>
                      <input className="input-field w-32 text-sm py-1.5 uppercase font-mono tracking-wider"
                        placeholder="ABC-1234" maxLength={8}
                        value={row.plate} onChange={e => updateVehicleRow(i, 'plate', formatPlate(e.target.value))} />
                      {vehicleRows.length > 1 && (
                        <button type="button" onClick={() => removeVehicleRow(i)}
                          className="p-1 text-gray-400 hover:text-red-500 transition-colors flex-shrink-0">
                          <X size={16} />
                        </button>
                      )}
                    </div>
                  ))}
                  {vehicleTypes.length === 0 && (
                    <p className="text-xs text-amber-500">Cadastre tipos na aba "Tipos de Veículo"</p>
                  )}
                </div>
              </div>

              {/* Botões */}
              <div className="flex gap-3 pt-1">
                <button type="submit" disabled={loading} className="btn-primary flex-1 py-2.5">{loading ? 'Salvando...' : 'Salvar'}</button>
                <button type="button" onClick={() => setShowModal(false)} className="btn-secondary flex-1 py-2.5">Cancelar</button>
              </div>
            </form>
          </div>
        </div>
      )}

      {/* ── Modal Tipo de Veículo ── */}
      {showTypeModal && (
        <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4">
          <div className="card w-full max-w-sm p-6">
            <h2 className="text-xl font-bold text-gray-800 mb-4">{editingType ? 'Editar' : 'Novo'} Tipo de Veículo</h2>
            <form onSubmit={handleTypeSubmit} className="space-y-3">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Nome *</label>
                <input className="input-field" placeholder="Ex: Moto, Carro, Bicicleta..."
                  value={typeForm.name} onChange={e => setTypeForm({ name: e.target.value })} required autoFocus />
              </div>
              <div className="flex gap-3 pt-2">
                <button type="submit" disabled={typeLoading} className="btn-primary flex-1">{typeLoading ? 'Salvando...' : 'Salvar'}</button>
                <button type="button" onClick={() => setShowTypeModal(false)} className="btn-secondary flex-1">Cancelar</button>
              </div>
            </form>
          </div>
        </div>
      )}
    </div>
  )
}
