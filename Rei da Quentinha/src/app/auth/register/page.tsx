'use client'
import { useState } from 'react'
import Link from 'next/link'
import { useRouter } from 'next/navigation'
import toast from 'react-hot-toast'
import { UtensilsCrossed, CheckCircle, XCircle, Eye, EyeOff } from 'lucide-react'
import { validateEmail, validateCpfCnpj, formatCpfCnpj, validatePhone, formatPhone, validatePassword, checkPasswordRules } from '@/lib/validators'
import AddressManager, { type AddressData } from '@/components/AddressManager'

export default function RegisterPage() {
  const router = useRouter()
  const [form, setForm] = useState({
    name: '', email: '', cpfCnpj: '', phone: '', birthDate: '',
    password: '', confirmPassword: '',
  })
  const [addresses, setAddresses] = useState<AddressData[]>([])
  const [errors, setErrors] = useState<Record<string, string>>({})
  const [loading, setLoading] = useState(false)
  const [showPassword, setShowPassword] = useState(false)

  const setField = (key: string, value: string) => {
    setForm(f => ({ ...f, [key]: value }))
    setErrors(p => ({ ...p, [key]: '' }))
  }

  const validate = () => {
    const newErrors: Record<string, string> = {}
    if (!form.name.trim()) newErrors.name = 'Nome obrigatório'
    if (!form.birthDate) {
      newErrors.birthDate = 'Data de nascimento obrigatória'
    } else {
      const birth = new Date(form.birthDate)
      const today = new Date()
      const age = today.getFullYear() - birth.getFullYear() - (today < new Date(today.getFullYear(), birth.getMonth(), birth.getDate()) ? 1 : 0)
      if (isNaN(birth.getTime())) newErrors.birthDate = 'Data inválida'
      else if (age < 18) newErrors.birthDate = 'É necessário ter 18 anos ou mais para se cadastrar'
      else if (age > 120) newErrors.birthDate = 'Data de nascimento inválida'
    }
    const emailErr = validateEmail(form.email)
    if (emailErr) newErrors.email = emailErr
    const cpfErr = validateCpfCnpj(form.cpfCnpj)
    if (cpfErr) newErrors.cpfCnpj = cpfErr
    const phoneErr = validatePhone(form.phone)
    if (phoneErr) newErrors.phone = phoneErr
    const pwErr = validatePassword(form.password)
    if (pwErr) newErrors.password = pwErr
    if (form.password !== form.confirmPassword) newErrors.confirmPassword = 'Senhas não conferem'
    if (addresses.length === 0) newErrors.addresses = 'Cadastre pelo menos um endereço de entrega'
    setErrors(newErrors)
    return Object.keys(newErrors).length === 0
  }

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    if (!validate()) return
    setLoading(true)
    try {
      const res = await fetch('/api/auth/register', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ ...form, birthDate: form.birthDate }),
      })
      const data = await res.json()
      if (!res.ok) { toast.error(data.error || 'Erro ao cadastrar'); return }

      // salva endereços após registro (sessão já existe)
      for (const addr of addresses) {
        await fetch('/api/addresses', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify(addr),
        })
      }

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
  const cleanDoc = form.cpfCnpj.replace(/[.\-\/]/g, '').replace(/[^A-Z0-9]/gi, '')
  const docLabel = cleanDoc.length > 11 || /[A-Z]/i.test(cleanDoc) ? 'CNPJ' : 'CPF'

  return (
    <div className="min-h-screen bg-gradient-to-br bg-cream flex items-center justify-center p-4 py-10">
      <div className="card w-full max-w-lg p-8">
        <div className="text-center mb-8">
          <Link href="/" className="inline-flex items-center gap-2 text-brand-600 font-extrabold text-2xl">
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

          {/* CPF / CNPJ */}
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">
              CPF / CNPJ *
              {form.cpfCnpj && <span className="ml-2 text-xs text-gray-400 font-normal">{docLabel}</span>}
            </label>
            <div className="relative">
              <input
                type="text"
                inputMode="text"
                autoCapitalize="characters"
                className={`input-field pr-9 uppercase ${cpfCnpjError ? 'border-red-400 focus:ring-red-300' : cpfCnpjOk ? 'border-green-400 focus:ring-green-300' : ''}`}
                placeholder="000.000.000-00 ou 00.000.000/0000-00"
                maxLength={18}
                value={form.cpfCnpj}
                onChange={e => {
                  const raw = e.target.value.toUpperCase().replace(/[^A-Z0-9.\-\/]/g, '').slice(0, 18)
                  setField('cpfCnpj', formatCpfCnpj(raw))
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

          {/* Data de Nascimento + Celular */}
          <div className="grid grid-cols-2 gap-3">
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Data de nascimento *</label>
              <input
                type="date"
                className={`input-field ${errors.birthDate ? 'border-red-400 focus:ring-red-300' : form.birthDate && !errors.birthDate ? 'border-green-400 focus:ring-green-300' : ''}`}
                value={form.birthDate}
                max={new Date().toISOString().split('T')[0]}
                onChange={e => setField('birthDate', e.target.value)}
              />
              {errors.birthDate && <p className="text-red-500 text-xs mt-1">{errors.birthDate}</p>}
            </div>
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

          {/* Endereços */}
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-2">
              Endereços de entrega <span className="text-red-500">*</span>
            </label>
            <AddressManager addresses={addresses} onChange={(list) => { setAddresses(list); setErrors(p => ({ ...p, addresses: '' })) }} persist={false} />
            {errors.addresses && <p className="text-red-500 text-xs mt-2">{errors.addresses}</p>}
          </div>

          {/* Senha */}
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">Senha *</label>
            <div className="relative">
              <input
                type={showPassword ? 'text' : 'password'}
                className={`input-field pr-10 ${errors.password ? 'border-red-400 focus:ring-red-300' : form.password && !validatePassword(form.password) ? 'border-green-400 focus:ring-green-300' : ''}`}
                value={form.password}
                onChange={e => { setForm(f => ({ ...f, password: e.target.value })); setErrors(p => ({ ...p, password: '' })) }}
                autoComplete="new-password"
              />
              <button
                type="button"
                className="absolute right-3 top-1/2 -translate-y-1/2 text-gray-400 hover:text-gray-600 transition-colors"
                onMouseDown={() => setShowPassword(true)}
                onMouseUp={() => setShowPassword(false)}
                onMouseLeave={() => setShowPassword(false)}
                onTouchStart={() => setShowPassword(true)}
                onTouchEnd={() => setShowPassword(false)}
                title="Segure para ver a senha"
              >
                {showPassword ? <EyeOff size={16} /> : <Eye size={16} />}
              </button>
            </div>
            {form.password && (() => {
              const rules = checkPasswordRules(form.password)
              const items = [
                { ok: rules.minLength, label: 'Mínimo 8 caracteres' },
                { ok: rules.hasUpper,  label: '1 letra maiúscula' },
                { ok: rules.hasNumber, label: '1 número' },
                { ok: rules.hasSpecial, label: '1 caractere especial (!@#$...)' },
              ]
              return (
                <div className="mt-2 grid grid-cols-2 gap-1">
                  {items.map(item => (
                    <div key={item.label} className={`flex items-center gap-1.5 text-xs font-medium transition-colors ${item.ok ? 'text-green-600' : 'text-gray-400'}`}>
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
          <Link href="/auth/login" className="text-brand-600 font-semibold hover:underline">Entrar</Link>
        </p>
      </div>
    </div>
  )
}
