'use client'
import { useState, useEffect } from 'react'
import { useRouter } from 'next/navigation'
import Navbar from '@/components/Navbar'
import AddressManager, { type AddressData } from '@/components/AddressManager'
import toast from 'react-hot-toast'
import { User, Phone, Mail, CreditCard, Calendar, Lock, Save } from 'lucide-react'
import { formatPhone, validatePhone } from '@/lib/validators'

interface UserProfile {
  id: string
  name: string
  email: string
  phone: string | null
  cpfCnpj: string | null
  birthDate: string | null
  role: string
}

export default function PerfilPage() {
  const router = useRouter()
  const [profile, setProfile] = useState<UserProfile | null>(null)
  const [form, setForm] = useState({ name: '', phone: '', password: '', confirmPassword: '' })
  const [addresses, setAddresses] = useState<AddressData[]>([])
  const [loading, setLoading] = useState(false)

  useEffect(() => {
    fetch('/api/auth/me').then(r => r.ok ? r.json() : null).then(data => {
      if (!data?.user) { router.push('/auth/login?redirect=/perfil'); return }
      const u = data.user
      setProfile(u)
      setForm(f => ({ ...f, name: u.name || '', phone: u.phone || '' }))
    })
    fetch('/api/addresses').then(r => r.ok ? r.json() : []).then(setAddresses)
  }, [router])

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    if (addresses.length === 0) { toast.error('Cadastre pelo menos um endereço de entrega'); return }
    if (form.phone && validatePhone(form.phone)) { toast.error(validatePhone(form.phone)!); return }
    if (form.password && form.password !== form.confirmPassword) { toast.error('Senhas não conferem'); return }
    if (form.password && form.password.length < 6) { toast.error('Senha deve ter pelo menos 6 caracteres'); return }

    setLoading(true)
    try {
      const body: Record<string, string> = { name: form.name, phone: form.phone }
      if (form.password) body.password = form.password

      const res = await fetch('/api/auth/me', {
        method: 'PUT',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(body),
      })
      if (!res.ok) throw new Error()
      const data = await res.json()
      setProfile(data.user)
      setForm(f => ({ ...f, password: '', confirmPassword: '' }))
      toast.success('Cadastro atualizado!')
    } catch {
      toast.error('Erro ao salvar alterações')
    } finally {
      setLoading(false)
    }
  }

  if (!profile) {
    return (
      <div className="min-h-screen">
        <Navbar />
        <div className="flex items-center justify-center py-20">
          <div className="w-8 h-8 border-4 border-brand-400 border-t-transparent rounded-full animate-spin" />
        </div>
      </div>
    )
  }

  return (
    <div className="min-h-screen bg-cream">
      <Navbar />
      <main className="max-w-2xl mx-auto px-4 py-10">
        <h1 className="text-3xl font-bold text-gray-800 mb-2">Meu Cadastro</h1>
        <p className="text-gray-500 mb-8">Visualize e atualize suas informações</p>

        {/* Dados fixos */}
        <div className="card p-6 mb-6">
          <h2 className="text-lg font-bold text-gray-800 mb-4">Informações da Conta</h2>
          <div className="space-y-3">
            <div className="flex items-center gap-3 py-2 border-b border-gray-100">
              <Mail size={18} className="text-gray-400 flex-shrink-0" />
              <div>
                <p className="text-xs text-gray-400 font-medium uppercase tracking-wide">E-mail</p>
                <p className="text-gray-800 font-medium">{profile.email}</p>
              </div>
            </div>
            {profile.cpfCnpj && (
              <div className="flex items-center gap-3 py-2 border-b border-gray-100">
                <CreditCard size={18} className="text-gray-400 flex-shrink-0" />
                <div>
                  <p className="text-xs text-gray-400 font-medium uppercase tracking-wide">CPF / CNPJ</p>
                  <p className="text-gray-800 font-medium">{profile.cpfCnpj}</p>
                </div>
              </div>
            )}
            {profile.birthDate && (
              <div className="flex items-center gap-3 py-2">
                <Calendar size={18} className="text-gray-400 flex-shrink-0" />
                <div>
                  <p className="text-xs text-gray-400 font-medium uppercase tracking-wide">Data de Nascimento</p>
                  <p className="text-gray-800 font-medium">
                    {new Date(profile.birthDate).toLocaleDateString('pt-BR', { timeZone: 'UTC' })}
                  </p>
                </div>
              </div>
            )}
          </div>
        </div>

        <form onSubmit={handleSubmit} className="space-y-6">
          {/* Dados editáveis */}
          <div className="card p-6">
            <h2 className="text-lg font-bold text-gray-800 mb-4">Dados Pessoais</h2>
            <div className="space-y-4">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1 flex items-center gap-1.5">
                  <User size={15} /> Nome completo *
                </label>
                <input
                  className="input-field"
                  value={form.name}
                  onChange={e => setForm(f => ({ ...f, name: e.target.value }))}
                  required
                />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1 flex items-center gap-1.5">
                  <Phone size={15} /> Celular
                </label>
                <input
                  type="tel"
                  inputMode="numeric"
                  className="input-field"
                  placeholder="(11) 99999-9999"
                  maxLength={15}
                  value={form.phone}
                  onChange={e => setForm(f => ({ ...f, phone: formatPhone(e.target.value) }))}
                />
                {form.phone && validatePhone(form.phone) && (
                  <p className="text-red-500 text-xs mt-1">{validatePhone(form.phone)}</p>
                )}
              </div>
            </div>
          </div>

          {/* Endereços */}
          <div className="card p-6">
            <h2 className="text-lg font-bold text-gray-800 mb-4">
              Meus Endereços <span className="text-red-500">*</span>
            </h2>
            <AddressManager addresses={addresses} onChange={setAddresses} persist={true} />
            {addresses.length === 0 && (
              <p className="text-red-500 text-xs mt-3">Cadastre pelo menos um endereço de entrega para salvar.</p>
            )}
          </div>

          {/* Alterar senha */}
          <div className="card p-6">
            <h2 className="text-lg font-bold text-gray-800 mb-1 flex items-center gap-2">
              <Lock size={18} /> Alterar Senha
            </h2>
            <p className="text-gray-400 text-sm mb-4">Deixe em branco para manter a senha atual</p>
            <div className="space-y-4">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Nova senha</label>
                <input
                  type="password"
                  className="input-field"
                  placeholder="••••••••"
                  autoComplete="new-password"
                  value={form.password}
                  onChange={e => setForm(f => ({ ...f, password: e.target.value }))}
                />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Confirmar nova senha</label>
                <input
                  type="password"
                  className="input-field"
                  placeholder="••••••••"
                  autoComplete="new-password"
                  value={form.confirmPassword}
                  onChange={e => setForm(f => ({ ...f, confirmPassword: e.target.value }))}
                />
                {form.confirmPassword && form.password !== form.confirmPassword && (
                  <p className="text-red-500 text-xs mt-1">Senhas não conferem</p>
                )}
              </div>
            </div>
          </div>

          <button type="submit" disabled={loading || addresses.length === 0} className="btn-primary w-full flex items-center justify-center gap-2 py-3 text-base disabled:opacity-50 disabled:cursor-not-allowed">
            <Save size={18} />
            {loading ? 'Salvando...' : 'Salvar Alterações'}
          </button>
        </form>
      </main>
    </div>
  )
}
