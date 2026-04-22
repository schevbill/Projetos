'use client'
import { useState, Suspense } from 'react'
import Link from 'next/link'
import { useRouter, useSearchParams } from 'next/navigation'
import toast from 'react-hot-toast'
import { UtensilsCrossed, CheckCircle, XCircle } from 'lucide-react'
import { validateEmail } from '@/lib/validators'

function LoginForm() {
  const router = useRouter()
  const searchParams = useSearchParams()
  const redirect = searchParams.get('redirect') || null
  const reason = searchParams.get('reason')
  const [form, setForm] = useState({ email: '', password: '' })
  const [emailTouched, setEmailTouched] = useState(false)
  const [loading, setLoading] = useState(false)

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
        <label className="block text-sm font-medium text-gray-700 mb-1">Senha</label>
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
