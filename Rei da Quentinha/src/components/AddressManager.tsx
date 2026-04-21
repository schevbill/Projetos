'use client'
import { useState } from 'react'
import { Plus, Pencil, Trash2, Check, X, MapPin, Map, Loader2, Search } from 'lucide-react'
import toast from 'react-hot-toast'

export interface AddressData {
  id?: string
  label: string
  cep: string
  logradouro: string
  numero: string
  complemento: string
  bairro: string
  cidade: string
  estado: string
}

const emptyAddress = (): AddressData => ({
  label: 'Casa', cep: '', logradouro: '', numero: '',
  complemento: '', bairro: '', cidade: '', estado: '',
})

interface Props {
  addresses: AddressData[]
  onChange: (addresses: AddressData[]) => void
  /** Se true, salva direto na API (modo perfil). Se false, apenas atualiza o estado (modo cadastro). */
  persist?: boolean
  /** Se informado (admin editando outro usuário), as operações de API usam este userId. */
  forUserId?: string
}

function AddressForm({
  value, onChange, onSave, onCancel, cepLoading, onCepChange, saving,
}: {
  value: AddressData
  onChange: (a: AddressData) => void
  onSave: () => void
  onCancel: () => void
  cepLoading: boolean
  onCepChange: (cep: string) => void
  saving: boolean
}) {
  const set = (field: keyof AddressData, val: string) => onChange({ ...value, [field]: val })

  return (
    <div className="border border-brand-200 rounded-xl p-4 bg-brand-50/40 space-y-3">
      {/* Label */}
      <div>
        <label className="block text-xs font-medium text-gray-600 mb-1">Nome do endereço</label>
        <div className="flex gap-2">
          {['Casa', 'Trabalho', 'Outro'].map(opt => (
            <button
              key={opt}
              type="button"
              onClick={() => set('label', opt)}
              className={`px-3 py-1 rounded-full text-xs font-semibold border transition-colors ${value.label === opt ? 'bg-brand-600 text-white border-brand-600' : 'bg-white text-gray-600 border-gray-300 hover:border-brand-400'}`}
            >
              {opt}
            </button>
          ))}
          {!['Casa', 'Trabalho', 'Outro'].includes(value.label) && (
            <input
              className="input-field text-xs py-1 flex-1"
              placeholder="Nome personalizado"
              value={value.label}
              onChange={e => set('label', e.target.value)}
            />
          )}
          <button
            type="button"
            onClick={() => set('label', '')}
            className="px-3 py-1 rounded-full text-xs font-semibold border border-gray-300 bg-white text-gray-500 hover:border-brand-400"
          >
            Personalizar
          </button>
        </div>
        {!['Casa', 'Trabalho', 'Outro'].includes(value.label) && value.label === '' && (
          <input
            className="input-field text-sm mt-2"
            placeholder="Digite o nome do endereço"
            value={value.label}
            onChange={e => set('label', e.target.value)}
          />
        )}
      </div>

      {/* CEP */}
      <div className="grid grid-cols-2 gap-3">
        <div>
          <label className="block text-xs font-medium text-gray-600 mb-1">CEP</label>
          <div className="relative">
            <input
              className="input-field pr-8 text-sm"
              placeholder="00000-000"
              maxLength={9}
              value={value.cep}
              onChange={e => {
                let v = e.target.value.replace(/\D/g, '')
                if (v.length > 8) v = v.slice(0, 8)
                const fmt = v.length > 5 ? `${v.slice(0, 5)}-${v.slice(5)}` : v
                set('cep', fmt)
                if (v.length === 8) onCepChange(v)
              }}
            />
            <div className="absolute right-2 top-1/2 -translate-y-1/2 text-gray-400">
              {cepLoading ? <Loader2 size={14} className="animate-spin" /> : <Search size={14} />}
            </div>
          </div>
        </div>
        <div>
          <label className="block text-xs font-medium text-gray-600 mb-1">Número *</label>
          <input className="input-field text-sm" placeholder="123" value={value.numero} onChange={e => set('numero', e.target.value)} required />
        </div>
      </div>

      {/* Logradouro */}
      <div>
        <label className="block text-xs font-medium text-gray-600 mb-1">Rua / Avenida *</label>
        <input className="input-field text-sm" placeholder="Rua das Flores" value={value.logradouro} onChange={e => set('logradouro', e.target.value)} required />
      </div>

      <div className="grid grid-cols-2 gap-3">
        <div>
          <label className="block text-xs font-medium text-gray-600 mb-1">Complemento</label>
          <input className="input-field text-sm" placeholder="Apto 12" value={value.complemento} onChange={e => set('complemento', e.target.value)} />
        </div>
        <div>
          <label className="block text-xs font-medium text-gray-600 mb-1">Bairro</label>
          <input className="input-field text-sm" placeholder="Centro" value={value.bairro} onChange={e => set('bairro', e.target.value)} />
        </div>
      </div>

      <div className="grid grid-cols-2 gap-3">
        <div>
          <label className="block text-xs font-medium text-gray-600 mb-1">Cidade *</label>
          <input className="input-field text-sm" placeholder="São Paulo" value={value.cidade} onChange={e => set('cidade', e.target.value)} required />
        </div>
        <div>
          <label className="block text-xs font-medium text-gray-600 mb-1">Estado</label>
          <input className="input-field text-sm uppercase" placeholder="SP" maxLength={2} value={value.estado} onChange={e => set('estado', e.target.value.toUpperCase())} />
        </div>
      </div>

      <div className="flex gap-2 pt-1">
        <button type="button" onClick={onSave} disabled={saving || !value.logradouro || !value.numero || !value.cidade}
          className="btn-primary flex items-center gap-1.5 text-sm py-1.5 px-4 disabled:opacity-50">
          {saving ? <Loader2 size={14} className="animate-spin" /> : <Check size={14} />}
          Salvar
        </button>
        <button type="button" onClick={onCancel} className="btn-secondary flex items-center gap-1.5 text-sm py-1.5 px-4">
          <X size={14} /> Cancelar
        </button>
      </div>
    </div>
  )
}

export default function AddressManager({ addresses, onChange, persist = false, forUserId }: Props) {
  const [editing, setEditing] = useState<number | null>(null)
  const [editData, setEditData] = useState<AddressData>(emptyAddress())
  const [showNew, setShowNew] = useState(false)
  const [newData, setNewData] = useState<AddressData>(emptyAddress())
  const [cepLoading, setCepLoading] = useState(false)
  const [saving, setSaving] = useState(false)
  const [mapAddress, setMapAddress] = useState<string | null>(null)

  const buscarCep = async (cep: string, setter: React.Dispatch<React.SetStateAction<AddressData>>) => {
    setCepLoading(true)
    try {
      const res = await fetch(`https://viacep.com.br/ws/${cep}/json/`)
      const data = await res.json()
      if (!data.erro) {
        setter(prev => ({
          ...prev,
          logradouro: data.logradouro || prev.logradouro,
          bairro: data.bairro || prev.bairro,
          cidade: data.localidade || prev.cidade,
          estado: data.uf || prev.estado,
          complemento: data.complemento || prev.complemento,
        }))
        toast.success('Endereço encontrado!')
      } else {
        toast.error('CEP não encontrado')
      }
    } catch { toast.error('Erro ao buscar CEP') }
    finally { setCepLoading(false) }
  }

  const handleAddNew = async () => {
    if (!newData.logradouro || !newData.numero || !newData.cidade) return
    setSaving(true)
    try {
      if (persist) {
        const body = forUserId ? { ...newData, userId: forUserId } : newData
        const res = await fetch('/api/addresses', { method: 'POST', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify(body) })
        if (!res.ok) throw new Error()
        const saved = await res.json()
        onChange([...addresses, saved])
        toast.success('Endereço adicionado!')
      } else {
        onChange([...addresses, { ...newData, id: `new-${Date.now()}` }])
      }
      setNewData(emptyAddress())
      setShowNew(false)
    } catch { toast.error('Erro ao salvar endereço') }
    finally { setSaving(false) }
  }

  const handleEdit = async (idx: number) => {
    setSaving(true)
    try {
      if (persist && editData.id && !editData.id.startsWith('new-')) {
        const res = await fetch(`/api/addresses/${editData.id}`, { method: 'PUT', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify(editData) })
        if (!res.ok) throw new Error()
        const saved = await res.json()
        onChange(addresses.map((a, i) => i === idx ? saved : a))
        toast.success('Endereço atualizado!')
      } else {
        onChange(addresses.map((a, i) => i === idx ? editData : a))
      }
      setEditing(null)
    } catch { toast.error('Erro ao atualizar endereço') }
    finally { setSaving(false) }
  }

  const handleDelete = async (idx: number) => {
    if (!confirm('Excluir este endereço?')) return
    const addr = addresses[idx]
    try {
      if (persist && addr.id && !addr.id.startsWith('new-')) {
        const res = await fetch(`/api/addresses/${addr.id}`, { method: 'DELETE' })
        if (!res.ok) throw new Error()
        toast.success('Endereço excluído')
      }
      onChange(addresses.filter((_, i) => i !== idx))
    } catch { toast.error('Erro ao excluir endereço') }
  }

  return (
    <div className="space-y-3">
      {addresses.map((addr, idx) => (
        <div key={addr.id ?? idx}>
          {editing === idx ? (
            <AddressForm
              value={editData}
              onChange={setEditData}
              onSave={() => handleEdit(idx)}
              onCancel={() => setEditing(null)}
              cepLoading={cepLoading}
              onCepChange={cep => buscarCep(cep, setEditData)}
              saving={saving}
            />
          ) : (
            <div className="flex items-start justify-between gap-3 border border-gray-200 rounded-xl px-4 py-3 bg-white hover:border-brand-300 transition-colors">
              <div className="flex items-start gap-3 min-w-0">
                <MapPin size={18} className="text-brand-400 flex-shrink-0 mt-0.5" />
                <div className="min-w-0">
                  <span className="inline-block bg-brand-100 text-brand-700 text-xs font-bold px-2 py-0.5 rounded-full mb-1">{addr.label}</span>
                  <p className="text-sm text-gray-800 leading-snug">
                    {addr.logradouro}, {addr.numero}{addr.complemento ? `, ${addr.complemento}` : ''}
                    {addr.bairro ? ` — ${addr.bairro}` : ''}, {addr.cidade}{addr.estado ? `/${addr.estado}` : ''}
                    {addr.cep ? ` — ${addr.cep}` : ''}
                  </p>
                </div>
              </div>
              <div className="flex gap-1 flex-shrink-0">
                <button
                  type="button"
                  title="Ver no mapa"
                  onClick={() => {
                    const query = [addr.logradouro, addr.numero, addr.bairro, addr.cidade, addr.estado, addr.cep].filter(Boolean).join(', ')
                    setMapAddress(query)
                  }}
                  className="p-1.5 text-green-600 hover:bg-green-50 rounded transition-colors"
                >
                  <Map size={15} />
                </button>
                <button type="button" onClick={() => { setEditing(idx); setEditData({ ...addr }) }}
                  className="p-1.5 text-blue-500 hover:bg-blue-50 rounded transition-colors"><Pencil size={15} /></button>
                <button type="button" onClick={() => handleDelete(idx)}
                  className="p-1.5 text-red-500 hover:bg-red-50 rounded transition-colors"><Trash2 size={15} /></button>
              </div>
            </div>
          )}
        </div>
      ))}

      {showNew ? (
        <AddressForm
          value={newData}
          onChange={setNewData}
          onSave={handleAddNew}
          onCancel={() => { setShowNew(false); setNewData(emptyAddress()) }}
          cepLoading={cepLoading}
          onCepChange={cep => buscarCep(cep, setNewData)}
          saving={saving}
        />
      ) : (
        <button
          type="button"
          onClick={() => setShowNew(true)}
          className="w-full border-2 border-dashed border-gray-300 hover:border-brand-400 rounded-xl py-3 flex items-center justify-center gap-2 text-sm text-gray-500 hover:text-brand-600 transition-colors"
        >
          <Plus size={16} /> Adicionar endereço
        </button>
      )}

      {/* Modal do mapa */}
      {mapAddress && (
        <div className="fixed inset-0 bg-black/60 flex items-center justify-center z-50 p-4" onClick={() => setMapAddress(null)}>
          <div className="bg-white rounded-2xl shadow-2xl w-full max-w-2xl overflow-hidden" onClick={e => e.stopPropagation()}>
            <div className="flex items-center justify-between px-5 py-3 border-b border-gray-100">
              <div className="flex items-center gap-2 text-gray-800 font-semibold text-sm">
                <Map size={16} className="text-green-600" />
                {mapAddress}
              </div>
              <button type="button" onClick={() => setMapAddress(null)} className="p-1.5 text-gray-400 hover:text-gray-700 hover:bg-gray-100 rounded-lg transition-colors">
                <X size={18} />
              </button>
            </div>
            <div className="w-full" style={{ height: 420 }}>
              <iframe
                title="mapa"
                width="100%"
                height="100%"
                loading="lazy"
                style={{ border: 0 }}
                src={`https://maps.google.com/maps?q=${encodeURIComponent(mapAddress)}&output=embed&hl=pt-BR&z=16`}
              />
            </div>
            <div className="px-5 py-3 border-t border-gray-100 flex justify-end">
              <a
                href={`https://www.google.com/maps/search/?api=1&query=${encodeURIComponent(mapAddress)}`}
                target="_blank"
                rel="noopener noreferrer"
                className="text-xs text-brand-600 hover:underline flex items-center gap-1"
              >
                <Map size={13} /> Abrir no Google Maps
              </a>
            </div>
          </div>
        </div>
      )}
    </div>
  )
}
