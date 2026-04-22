'use client'
import { useEffect, useRef } from 'react'
import { useRouter } from 'next/navigation'
import AdminSidebar from '@/components/AdminSidebar'

const INACTIVITY_MS = 40 * 60 * 1000 // 40 minutos

export default function AdminLayout({ children }: { children: React.ReactNode }) {
  const router = useRouter()
  const timer = useRef<ReturnType<typeof setTimeout> | null>(null)

  useEffect(() => {
    // Verifica se sessão ainda é válida ao montar o layout
    fetch('/api/auth/me')
      .then(r => r.json())
      .then(data => {
        if (!data.user || data.user.role !== 'ADMIN') router.push('/auth/login')
      })

    const logout = async () => {
      await fetch('/api/auth/logout', { method: 'POST' })
      router.push('/auth/login?reason=inatividade')
    }

    const reset = () => {
      if (timer.current) clearTimeout(timer.current)
      timer.current = setTimeout(logout, INACTIVITY_MS)
    }

    const events = ['mousemove', 'mousedown', 'keydown', 'touchstart', 'scroll', 'click']
    events.forEach(e => window.addEventListener(e, reset, { passive: true }))
    reset()

    return () => {
      if (timer.current) clearTimeout(timer.current)
      events.forEach(e => window.removeEventListener(e, reset))
    }
  }, [router])

  return (
    <div className="flex min-h-screen bg-gray-50">
      <AdminSidebar />
      <main className="flex-1 overflow-auto">{children}</main>
    </div>
  )
}
