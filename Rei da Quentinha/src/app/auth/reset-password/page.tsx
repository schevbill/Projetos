'use client'
import { useState, useEffect, Suspense } from 'react'
import Link from 'next/link'
import { useRouter, useSearchParams } from 'next/navigation'
import toast from 'react-hot-toast'
import { UtensilsCrossed, Eye, EyeOff, CheckCircle, AlertCircle } from 'lucide-react'
import { validatePassword, checkPasswordRules } from '@/lib/validators'

function ResetPasswordForm() {
  const router = useRouter()
  const searchParams = useSearchParams()
  const token = searchParams.get('token') || ''

  const [userName, setUserName] = useState('')
  const [tokenError, setTokenError] = useState('')
  const [tokenLoading, setTokenLoading] = useState(true)

  const [password, setPassword] = useState('')
  const [confirmPassword, setConfirmPassword] = useState('')
  const [showPassword, setShowPassword] = useState(false)
  const [showConfirm, setShowConfirm] = useState(false)
  const [loading, setLoading] = useState(false)
  const [errors, setErrors] = useState<{ password?: string; confirm?: string }>({})

  useEffect(() => {
    if (!token) {
      setTokenError('Link inválido. Solicite um novo link de recuperação.')
      setTokenLoading(false)
      return
    }
    fetch(`/api/auth/reset-password?token=${token}`)
      .then(res => res.json())
      .then(data => {
        if (data.error) setTokenError(data.error)
        else setUserName(data.name)
      })
      .catch(() => setTokenError('Erro ao validar o link. Tente novamente.'))
      .finally(() => setTokenLoading(false))
  }, [token])

  const rules = checkPasswordRules(password)
  const ruleItems = [
    { ok: rules.minLength,  label: 'Mínimo 8 caracteres' },
    { ok: rules.hasUpper,   label: '1 letra maiúscula' },
    { ok: rules.hasNumber,  label: '1 número' },
    { ok: rules.hasSpecial, label: '1 caractere especial (!@#$...)' },
  ]

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    const newErrors: typeof errors = {}
    const passErr = validatePassword(password)
    if (passErr) newErrors.password = passErr
    if (password !== confirmPassword) newErrors.confirm = 'As senhas não conferem'
    setErrors(newErrors)
    if (Object.keys(newErrors).length > 0) return

    setLoading(true)
    try {
      const res = await fetch('/api/auth/reset-password', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ token, password }),
      })
      const data = await res.json()
      if (!res.ok) { toast.error(data.error || 'Erro ao redefinir senha'); return }
      toast.success('Senha redefinida com sucesso!')
      router.push('/auth/login')
    } catch {
      toast.error('Erro de conexão. Tente novamente.')
    } finally {
      setLoading(false)
    }
  }

  if (tokenLoading) {
    return (
      <div className="flex flex-col items-center py-8 gap-3">
        <div className="w-8 h-8 border-4 border-brand-600 border-t-transparent rounded-full animate-spin" />
        <p className="text-gray-500 text-sm">Validando link...</p>
      </div>
    )
  }

  if (tokenError) {
    return (
      <div className="flex flex-col items-center py-6 text-center gap-4">
        <div className="w-16 h-16 bg-red-100 rounded-full flex items-center justify-center">
          <AlertCircle size={32} className="text-red-500" />
        </div>
        <div>
          <p className="text-gray-800 font-semibold mb-1">Link inválido ou expirado</p>
          <p className="text-gray-500 text-sm">{tokenError}</p>
        </div>
        <Link href="/auth/login" className="btn-primary px-8 py-2.5 inline-block">
          Voltar ao Login
        </Link>
      </div>
    )
  }

  return (
    <form onSubmit={handleSubmit} className="space-y-5">
      {/* Nome informativo */}
      <div>
        <label className="block text-sm font-medium text-gray-700 mb-1">Nome</label>
        <input
          type="text"
          className="input-field bg-gray-50 text-gray-500 cursor-not-allowed"
          value={userName}
          readOnly
          disabled
        />
      </div>

      {/* Nova senha */}
      <div>
        <label className="block text-sm font-medium text-gray-700 mb-1">Nova Senha</label>
        <div className="relative">
          <input
            type={showPassword ? 'text' : 'password'}
            className={`input-field pr-10 ${errors.password ? 'border-red-400 focus:ring-red-300' : password && !validatePassword(password) ? 'border-green-400 focus:ring-green-300' : ''}`}
            value={password}
            onChange={e => { setPassword(e.target.value); setErrors(p => ({ ...p, password: '' })) }}
            autoComplete="new-password"
            required
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

        {password && (
          <div className="mt-2 grid grid-cols-2 gap-1">
            {ruleItems.map(item => (
              <div
                key={item.label}
                className={`flex items-center gap-1.5 text-xs font-medium transition-colors ${item.ok ? 'text-green-600' : 'text-gray-400'}`}
              >
                <div className={`w-3.5 h-3.5 rounded-full flex items-center justify-center flex-shrink-0 ${item.ok ? 'bg-green-500' : 'bg-gray-200'}`}>
                  {item.ok && (
                    <svg width="8" height="8" viewBox="0 0 8 8" fill="none">
                      <path d="M1.5 4L3 5.5L6.5 2" stroke="white" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round" />
                    </svg>
                  )}
                </div>
                {item.label}
              </div>
            ))}
          </div>
        )}
        {errors.password && <p className="text-red-500 text-xs mt-1">{errors.password}</p>}
      </div>

      {/* Confirmar senha */}
      <div>
        <label className="block text-sm font-medium text-gray-700 mb-1">Confirmar Nova Senha</label>
        <div className="relative">
          <input
            type={showConfirm ? 'text' : 'password'}
            className={`input-field pr-10 ${errors.confirm ? 'border-red-400 focus:ring-red-300' : confirmPassword && password === confirmPassword ? 'border-green-400 focus:ring-green-300' : ''}`}
            value={confirmPassword}
            onChange={e => { setConfirmPassword(e.target.value); setErrors(p => ({ ...p, confirm: '' })) }}
            autoComplete="new-password"
            required
          />
          <button
            type="button"
            className="absolute right-3 top-1/2 -translate-y-1/2 text-gray-400 hover:text-gray-600 transition-colors"
            onMouseDown={() => setShowConfirm(true)}
            onMouseUp={() => setShowConfirm(false)}
            onMouseLeave={() => setShowConfirm(false)}
            onTouchStart={() => setShowConfirm(true)}
            onTouchEnd={() => setShowConfirm(false)}
            title="Segure para ver a senha"
          >
            {showConfirm ? <EyeOff size={16} /> : <Eye size={16} />}
          </button>
          {confirmPassword && (
            <div className="absolute right-10 top-1/2 -translate-y-1/2">
              {password === confirmPassword
                ? <CheckCircle size={16} className="text-green-500" />
                : null}
            </div>
          )}
        </div>
        {errors.confirm && <p className="text-red-500 text-xs mt-1">{errors.confirm}</p>}
      </div>

      {/* Botões */}
      <div className="flex gap-3 pt-2">
        <Link
          href="/auth/login"
          className="flex-1 py-3 text-center text-sm font-semibold text-gray-600 bg-gray-100 hover:bg-gray-200 rounded-lg transition-colors"
        >
          Cancelar
        </Link>
        <button
          type="submit"
          disabled={loading}
          className="flex-1 btn-primary py-3 text-base"
        >
          {loading ? 'Salvando...' : 'Salvar Nova Senha'}
        </button>
      </div>
    </form>
  )
}

export default function ResetPasswordPage() {
  return (
    <div className="min-h-screen bg-cream flex items-center justify-center p-4">
      <div className="card w-full max-w-md p-8">
        <div className="text-center mb-8">
          <Link href="/" className="inline-flex items-center gap-2 text-brand-600 font-extrabold text-2xl">
            <UtensilsCrossed size={32} />
            Rei da Quentinha
          </Link>
          <h1 className="text-2xl font-bold text-gray-800 mt-4">Redefinir Senha</h1>
        </div>

        <Suspense fallback={<div className="animate-pulse h-48 bg-gray-100 rounded-lg" />}>
          <ResetPasswordForm />
        </Suspense>
      </div>
    </div>
  )
}
