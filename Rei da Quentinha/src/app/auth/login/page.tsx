'use client'
import { useState, Suspense } from 'react'
import Link from 'next/link'
import { useRouter, useSearchParams } from 'next/navigation'
import toast from 'react-hot-toast'
import { UtensilsCrossed, CheckCircle, XCircle, X } from 'lucide-react'
import { validateEmail } from '@/lib/validators'

function ForgotPasswordModal({ onClose }: { onClose: () => void }) {
  const [identifier, setIdentifier] = useState('')
  const [loading, setLoading] = useState(false)
  const [sent, setSent] = useState(false)
  const [error, setError] = useState('')

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    if (!identifier.trim()) { setError('Informe o e-mail, CPF ou CNPJ'); return }
    setError('')
    setLoading(true)
    try {
      const res = await fetch('/api/auth/forgot-password', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ identifier: identifier.trim() }),
      })
      const data = await res.json()
      if (!res.ok) { setError(data.error || 'Erro ao processar solicitação'); return }
      setSent(true)
    } catch {
      setError('Erro de conexão. Tente novamente.')
    } finally {
      setLoading(false)
    }
  }

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center p-4 bg-black/50 backdrop-blur-sm">
      <div className="bg-white rounded-2xl shadow-2xl w-full max-w-md p-8 relative">
        <button
          onClick={onClose}
          className="absolute top-4 right-4 text-gray-400 hover:text-gray-600 transition-colors"
          aria-label="Fechar"
        >
          <X size={20} />
        </button>

        <h2 className="text-xl font-bold text-gray-800 mb-2">Recuperar Senha</h2>

        {sent ? (
          <div className="text-center py-4">
            <div className="w-16 h-16 bg-green-100 rounded-full flex items-center justify-center mx-auto mb-4">
              <CheckCircle size={32} className="text-green-500" />
            </div>
            <p className="text-gray-700 font-semibold mb-2">E-mail enviado!</p>
            <p className="text-gray-500 text-sm">
              Enviamos as instruções para redefinir sua senha. Verifique sua caixa de entrada (e a pasta de spam).
            </p>
            <button
              onClick={onClose}
              className="mt-6 btn-primary w-full py-2.5"
            >
              Fechar
            </button>
          </div>
        ) : (
          <>
            <p className="text-gray-500 text-sm mb-6">
              Informe o e-mail, CPF ou CNPJ cadastrado. Enviaremos um link para você criar uma nova senha.
            </p>
            <form onSubmit={handleSubmit} className="space-y-4">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">
                  E-mail, CPF ou CNPJ
                </label>
                <input
                  type="text"
                  className={`input-field ${error ? 'border-red-400 focus:ring-red-300' : ''}`}
                  placeholder="exemplo@email.com ou 000.000.000-00"
                  value={identifier}
                  onChange={e => { setIdentifier(e.target.value); setError('') }}
                  autoFocus
                />
                {error && <p className="text-red-500 text-xs mt-1">{error}</p>}
              </div>
              <button
                type="submit"
                disabled={loading}
                className="btn-primary w-full py-2.5"
              >
                {loading ? 'Enviando...' : 'Enviar Link de Recuperação'}
              </button>
              <button
                type="button"
                onClick={onClose}
                className="w-full py-2.5 text-sm text-gray-500 hover:text-gray-700 transition-colors"
              >
                Cancelar
              </button>
            </form>
          </>
        )}
      </div>
    </div>
  )
}

function LoginForm() {
  const router = useRouter()
  const searchParams = useSearchParams()
  const redirect = searchParams.get('redirect') || null
  const reason = searchParams.get('reason')
  const [form, setForm] = useState({ email: '', password: '' })
  const [emailTouched, setEmailTouched] = useState(false)
  const [loading, setLoading] = useState(false)
  const [showForgot, setShowForgot] = useState(false)

  const emailError = emailTouched ? validateEmail(form.email) : null
  const emailOk = form.email && !validateEmail(form.email)

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    setEmailTouched(true)
    if (validateEmail(form.email)) return
    setLoading(true)
    try {
      const res = await fetch('/api/auth/login', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(form),
      })
      const data = await res.json()
      if (!res.ok) { toast.error(data.error || 'Erro ao entrar'); return }
      toast.success('Bem-vindo!')
      router.push(data.user.role === 'ADMIN' ? '/admin' : (redirect ?? '/'))
    } catch {
      toast.error('Erro de conexão')
    } finally {
      setLoading(false)
    }
  }

  return (
    <>
      {showForgot && <ForgotPasswordModal onClose={() => setShowForgot(false)} />}

      {reason === 'inatividade' && (
        <div className="mb-4 p-3 bg-yellow-50 border border-yellow-200 rounded-lg text-sm text-yellow-800">
          Sua sessão expirou por inatividade. Faça login novamente.
        </div>
      )}

      <form onSubmit={handleSubmit} className="space-y-4">
        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1">E-mail</label>
          <div className="relative">
            <input
              type="email"
              className={`input-field pr-9 ${emailError ? 'border-red-400 focus:ring-red-300' : emailOk ? 'border-green-400 focus:ring-green-300' : ''}`}
              value={form.email}
              onChange={e => setForm(f => ({ ...f, email: e.target.value }))}
              onBlur={() => setEmailTouched(true)}
              autoComplete="email"
              required
            />
            {form.email && (
              <div className="absolute right-3 top-1/2 -translate-y-1/2">
                {emailOk
                  ? <CheckCircle size={16} className="text-green-500" />
                  : <XCircle size={16} className="text-red-400" />}
              </div>
            )}
          </div>
          {emailError && <p className="text-red-500 text-xs mt-1">{emailError}</p>}
        </div>

        <div>
          <div className="flex items-center justify-between mb-1">
            <label className="block text-sm font-medium text-gray-700">Senha</label>
            <button
              type="button"
              onClick={() => setShowForgot(true)}
              className="text-xs text-brand-600 hover:underline font-medium"
            >
              Esqueceu a senha?
            </button>
          </div>
          <input
            type="password"
            className="input-field"
            value={form.password}
            onChange={e => setForm(f => ({ ...f, password: e.target.value }))}
            required
            autoComplete="current-password"
          />
        </div>

        <button type="submit" disabled={loading} className="btn-primary w-full py-3 text-lg">
          {loading ? 'Entrando...' : 'Entrar'}
        </button>
      </form>
    </>
  )
}

export default function LoginPage() {
  return (
    <div className="min-h-screen bg-cream flex items-center justify-center p-4">
      <div className="card w-full max-w-md p-8">
        <div className="text-center mb-8">
          <Link href="/" className="inline-flex items-center gap-2 text-brand-600 font-extrabold text-2xl">
            <UtensilsCrossed size={32} />
            Rei da Quentinha
          </Link>
          <h1 className="text-2xl font-bold text-gray-800 mt-4">Entrar</h1>
        </div>

        <Suspense fallback={<div className="animate-pulse h-48 bg-gray-100 rounded-lg" />}>
          <LoginForm />
        </Suspense>

        <p className="text-center text-gray-600 mt-6 text-sm">
          Não tem conta?{' '}
          <Link href="/auth/register" className="text-brand-600 font-semibold hover:underline">
            Cadastre-se
          </Link>
        </p>
      </div>
    </div>
  )
}
