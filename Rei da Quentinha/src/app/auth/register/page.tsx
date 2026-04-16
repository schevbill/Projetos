'use client'
import { useState } from 'react'
import Link from 'next/link'
import { useRouter } from 'next/navigation'
import toast from 'react-hot-toast'
import { UtensilsCrossed, CheckCircle, XCircle, Search, Loader2 } from 'lucide-react'
import { validateEmail, validateCpfCnpj, formatCpfCnpj, validatePhone, formatPhone } from '@/lib/validators'

export default function RegisterPage() {
  const router = useRouter()
  const [form, setForm] = useState({
    name: '', email: '', cpfCnpj: '', phone: '',
    cep: '', logradouro: '', numero: '', complemento: '', bairro: '', cidade: '', estado: '',
    password: '', confirmPassword: '',
  })
  const [errors, setErrors] = useState<Record<string, string>>({})
  const [loading, setLoading] = useState(false)
  const [cepLoading, setCepLoading] = useState(false)

  const setField = (key: string, value: string) => {
    setForm(f => ({ ...f, [key]: value }))
    setErrors(p => ({ ...p, [key]: '' }))
  }

  const validate = () => {
    const newErrors: Record<string, string> = {}
    if (!form.name.trim()) newErrors.name = 'Nome obrigatório'
    const emailErr = validateEmail(form.email)
    if (emailErr) newErrors.email = emailErr
    const cpfErr = validateCpfCnpj(form.cpfCnpj)
    if (cpfErr) newErrors.cpfCnpj = cpfErr
    const phoneErr = validatePhone(form.phone)
    if (phoneErr) newErrors.phone = phoneErr
    if (!form.cep || form.cep.replace(/\D/g, '').length !== 8) newErrors.cep = 'CEP obrigatório (8 dígitos)'
    if (!form.logradouro.trim()) newErrors.logradouro = 'Rua obrigatória'
    if (!form.numero.trim()) newErrors.numero = 'Número obrigatório'
    if (!form.bairro.trim()) newErrors.bairro = 'Bairro obrigatório'
    if (!form.cidade.trim()) newErrors.cidade = 'Cidade obrigatória'
    if (!form.estado.trim()) newErrors.estado = 'Estado obrigatório'
    if (!form.password) newErrors.password = 'Senha obrigatória'
    else if (form.password.length < 6) newErrors.password = 'Mínimo 6 caracteres'
    if (form.password !== form.confirmPassword) newErrors.confirmPassword = 'Senhas não conferem'
    setErrors(newErrors)
    return Object.keys(newErrors).length === 0
  }

  const buscarCep = async (cep: string) => {
    const digits = cep.replace(/\D/g, '')
    if (digits.length !== 8) return
    setCepLoading(true)
    try {
      const res = await fetch(`https://viacep.com.br/ws/${digits}/json/`)
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
      setTimeout(() => document.getElementById('reg-numero')?.focus(), 100)
    } catch {
      toast.error('Erro ao buscar CEP')
    } finally {
      setCepLoading(false)
    }
  }

  const handleCep = (e: React.ChangeEvent<HTMLInputElement>) => {
    let digits = e.target.value.replace(/\D/g, '').slice(0, 8)
    const formatted = digits.length > 5 ? `${digits.slice(0, 5)}-${digits.slice(5)}` : digits
    setForm(f => ({ ...f, cep: formatted }))
    if (digits.length === 8) buscarCep(digits)
  }

  const addressFull = [
    form.logradouro,
    form.numero && `nº ${form.numero}`,
    form.complemento,
    form.bairro,
    form.cidade,
    form.estado,
    form.cep,
  ].filter(Boolean).join(', ')

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    if (!validate()) return
    setLoading(true)
    try {
      const res = await fetch('/api/auth/register', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ ...form, address: addressFull }),
      })
      const data = await res.json()
      if (!res.ok) { toast.error(data.error || 'Erro ao cadastrar'); return }
      toast.success('Cadastro realizado!')
      router.push('/')
    } catch {
      toast.error('Erro de conexão')
    } finally {
      setLoading(false)
    }
  }

  const emailError = errors.email
  const emailOk = form.email && !validateEmail(form.email)
  const cpfCnpjError = errors.cpfCnpj
  const cpfCnpjOk = form.cpfCnpj && !validateCpfCnpj(form.cpfCnpj)
  const docLabel = form.cpfCnpj.replace(/\D/g, '').length > 11 ? 'CNPJ' : 'CPF'

  return (
    <div className="min-h-screen bg-gradient-to-br from-orange-50 to-orange-100 flex items-center justify-center p-4 py-10">
      <div className="card w-full max-w-lg p-8">
        <div className="text-center mb-8">
          <Link href="/" className="inline-flex items-center gap-2 text-orange-500 font-bold text-2xl">
            <UtensilsCrossed size={32} />
            Rei da Quentinha
          </Link>
          <h1 className="text-2xl font-bold text-gray-800 mt-4">Criar Conta</h1>
        </div>

        <form onSubmit={handleSubmit} className="space-y-4">

          {/* Nome */}
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Nome completo *</label>
            <input
              type="text"
              className={`input-field ${errors.name ? 'border-red-400 focus:ring-red-300' : ''}`}
              value={form.name}
              onChange={e => setField('name', e.target.value)}
            />
            {errors.name && <p className="text-red-500 text-xs mt-1">{errors.name}</p>}
          </div>

          {/* E-mail */}
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">E-mail *</label>
            <div className="relative">
              <input
                type="email"
                className={`input-field pr-9 ${emailError ? 'border-red-400 focus:ring-red-300' : emailOk ? 'border-green-400 focus:ring-green-300' : ''}`}
                value={form.email}
                onChange={e => setField('email', e.target.value)}
                autoComplete="email"
              />
              {form.email && (
                <div className="absolute right-3 top-1/2 -translate-y-1/2">
                  {emailOk ? <CheckCircle size={16} className="text-green-500" /> : <XCircle size={16} className="text-red-400" />}
                </div>
              )}
            </div>
            {emailError && <p className="text-red-500 text-xs mt-1">{emailError}</p>}
          </div>

          {/* CPF / CNPJ */}
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">
              CPF / CNPJ *
              {form.cpfCnpj && <span className="ml-2 text-xs text-gray-400 font-normal">{docLabel}</span>}
            </label>
            <div className="relative">
              <input
                type="text"
                inputMode="numeric"
                className={`input-field pr-9 ${cpfCnpjError ? 'border-red-400 focus:ring-red-300' : cpfCnpjOk ? 'border-green-400 focus:ring-green-300' : ''}`}
                placeholder="000.000.000-00 ou 00.000.000/0000-00"
                maxLength={18}
                value={form.cpfCnpj}
                onChange={e => {
                  const digits = e.target.value.replace(/\D/g, '').slice(0, 14)
                  setField('cpfCnpj', formatCpfCnpj(digits))
                }}
              />
              {form.cpfCnpj && (
                <div className="absolute right-3 top-1/2 -translate-y-1/2">
                  {cpfCnpjOk ? <CheckCircle size={16} className="text-green-500" /> : <XCircle size={16} className="text-red-400" />}
                </div>
              )}
            </div>
            {cpfCnpjError && <p className="text-red-500 text-xs mt-1">{cpfCnpjError}</p>}
            {cpfCnpjOk && <p className="text-green-600 text-xs mt-1">{docLabel} válido</p>}
          </div>

          {/* Celular */}
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Celular *</label>
            <div className="relative">
              <input
                type="tel"
                inputMode="numeric"
                className={`input-field pr-9 ${errors.phone ? 'border-red-400 focus:ring-red-300' : form.phone && !validatePhone(form.phone) ? 'border-green-400 focus:ring-green-300' : ''}`}
                placeholder="(11) 99999-9999"
                maxLength={15}
                value={form.phone}
                onChange={e => {
                  setForm(f => ({ ...f, phone: formatPhone(e.target.value) }))
                  setErrors(p => ({ ...p, phone: '' }))
                }}
              />
              {form.phone && (
                <div className="absolute right-3 top-1/2 -translate-y-1/2">
                  {!validatePhone(form.phone) ? <CheckCircle size={16} className="text-green-500" /> : <XCircle size={16} className="text-red-400" />}
                </div>
              )}
            </div>
            {errors.phone && <p className="text-red-500 text-xs mt-1">{errors.phone}</p>}
          </div>

          {/* Endereço com busca CEP */}
          <div className="border border-gray-200 rounded-xl p-4 space-y-3 bg-gray-50">
            <p className="text-sm font-semibold text-gray-700">Endereço padrão</p>

            {/* CEP */}
            <div>
              <label className="block text-xs font-medium text-gray-600 mb-1">CEP *</label>
              <div className="relative">
                <input
                  type="text"
                  inputMode="numeric"
                  className={`input-field pr-9 text-sm ${errors.cep ? 'border-red-400 focus:ring-red-300' : ''}`}
                  placeholder="00000-000"
                  maxLength={9}
                  value={form.cep}
                  onChange={handleCep}
                />
                <div className="absolute right-3 top-1/2 -translate-y-1/2 text-gray-400">
                  {cepLoading ? <Loader2 size={14} className="animate-spin" /> : <Search size={14} />}
                </div>
              </div>
              {errors.cep
                ? <p className="text-red-500 text-xs mt-0.5">{errors.cep}</p>
                : <p className="text-xs text-gray-400 mt-0.5">Preenchimento automático</p>
              }
            </div>

            {/* Logradouro */}
            <div>
              <label className="block text-xs font-medium text-gray-600 mb-1">Rua / Avenida *</label>
              <input
                type="text"
                className={`input-field text-sm ${errors.logradouro ? 'border-red-400 focus:ring-red-300' : ''}`}
                placeholder="Rua das Flores"
                value={form.logradouro}
                onChange={e => setForm(f => ({ ...f, logradouro: e.target.value }))}
              />
              {errors.logradouro && <p className="text-red-500 text-xs mt-0.5">{errors.logradouro}</p>}
            </div>

            {/* Número + Complemento */}
            <div className="grid grid-cols-2 gap-3">
              <div>
                <label className="block text-xs font-medium text-gray-600 mb-1">Número *</label>
                <input
                  id="reg-numero"
                  type="text"
                  className={`input-field text-sm ${errors.numero ? 'border-red-400 focus:ring-red-300' : ''}`}
                  placeholder="123"
                  value={form.numero}
                  onChange={e => setForm(f => ({ ...f, numero: e.target.value }))}
                />
                {errors.numero && <p className="text-red-500 text-xs mt-0.5">{errors.numero}</p>}
              </div>
              <div>
                <label className="block text-xs font-medium text-gray-600 mb-1">Complemento</label>
                <input
                  type="text"
                  className="input-field text-sm"
                  placeholder="Apto 12"
                  value={form.complemento}
                  onChange={e => setForm(f => ({ ...f, complemento: e.target.value }))}
                />
              </div>
            </div>

            {/* Bairro */}
            <div>
              <label className="block text-xs font-medium text-gray-600 mb-1">Bairro *</label>
              <input
                type="text"
                className={`input-field text-sm ${errors.bairro ? 'border-red-400 focus:ring-red-300' : ''}`}
                placeholder="Centro"
                value={form.bairro}
                onChange={e => setForm(f => ({ ...f, bairro: e.target.value }))}
              />
              {errors.bairro && <p className="text-red-500 text-xs mt-0.5">{errors.bairro}</p>}
            </div>

            {/* Cidade + Estado */}
            <div className="grid grid-cols-2 gap-3">
              <div>
                <label className="block text-xs font-medium text-gray-600 mb-1">Cidade *</label>
                <input
                  type="text"
                  className={`input-field text-sm ${errors.cidade ? 'border-red-400 focus:ring-red-300' : ''}`}
                  placeholder="São Paulo"
                  value={form.cidade}
                  onChange={e => setForm(f => ({ ...f, cidade: e.target.value }))}
                />
                {errors.cidade && <p className="text-red-500 text-xs mt-0.5">{errors.cidade}</p>}
              </div>
              <div>
                <label className="block text-xs font-medium text-gray-600 mb-1">Estado *</label>
                <input
                  type="text"
                  className={`input-field text-sm uppercase ${errors.estado ? 'border-red-400 focus:ring-red-300' : ''}`}
                  placeholder="SP"
                  maxLength={2}
                  value={form.estado}
                  onChange={e => setForm(f => ({ ...f, estado: e.target.value.toUpperCase() }))}
                />
                {errors.estado && <p className="text-red-500 text-xs mt-0.5">{errors.estado}</p>}
              </div>
            </div>

            {/* Preview */}
            {addressFull && (
              <div className="bg-orange-50 border border-orange-200 rounded-lg px-3 py-2 text-xs text-orange-700">
                <span className="font-medium">Endereço: </span>{addressFull}
              </div>
            )}
          </div>

          {/* Senha */}
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Senha *</label>
            <input
              type="password"
              className={`input-field ${errors.password ? 'border-red-400 focus:ring-red-300' : ''}`}
              value={form.password}
              onChange={e => { setForm(f => ({ ...f, password: e.target.value })); setErrors(p => ({ ...p, password: '' })) }}
              autoComplete="new-password"
            />
            {errors.password && <p className="text-red-500 text-xs mt-1">{errors.password}</p>}
          </div>

          {/* Confirmar senha */}
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Confirmar senha *</label>
            <div className="relative">
              <input
                type="password"
                className={`input-field pr-9 ${errors.confirmPassword ? 'border-red-400 focus:ring-red-300' : form.confirmPassword && form.password === form.confirmPassword ? 'border-green-400 focus:ring-green-300' : ''}`}
                value={form.confirmPassword}
                onChange={e => { setForm(f => ({ ...f, confirmPassword: e.target.value })); setErrors(p => ({ ...p, confirmPassword: '' })) }}
                autoComplete="new-password"
              />
              {form.confirmPassword && (
                <div className="absolute right-3 top-1/2 -translate-y-1/2">
                  {form.password === form.confirmPassword
                    ? <CheckCircle size={16} className="text-green-500" />
                    : <XCircle size={16} className="text-red-400" />}
                </div>
              )}
            </div>
            {errors.confirmPassword && <p className="text-red-500 text-xs mt-1">{errors.confirmPassword}</p>}
          </div>

          <button type="submit" disabled={loading} className="btn-primary w-full py-3 text-lg mt-2">
            {loading ? 'Cadastrando...' : 'Criar Conta'}
          </button>
        </form>

        <p className="text-center text-gray-600 mt-6 text-sm">
          Já tem conta?{' '}
          <Link href="/auth/login" className="text-orange-500 font-semibold hover:underline">Entrar</Link>
        </p>
      </div>
    </div>
  )
}
