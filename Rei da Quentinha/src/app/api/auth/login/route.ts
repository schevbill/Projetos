import { NextResponse } from 'next/server'
import { prisma } from '@/lib/prisma'
import bcrypt from 'bcryptjs'
import { signToken } from '@/lib/auth'
import { cookies } from 'next/headers'

const attempts = new Map<string, { count: number; resetAt: number }>()
const MAX_ATTEMPTS = 5
const WINDOW_MS = 15 * 60 * 1000 // 15 minutos

function getIp(req: Request): string {
  return req.headers.get('x-forwarded-for')?.split(',')[0].trim() ?? 'unknown'
}

export async function POST(req: Request) {
  const ip = getIp(req)
  const now = Date.now()

  const entry = attempts.get(ip)
  if (entry) {
    if (now < entry.resetAt && entry.count >= MAX_ATTEMPTS) {
      const wait = Math.ceil((entry.resetAt - now) / 60000)
      return NextResponse.json(
        { error: `Muitas tentativas. Aguarde ${wait} minuto(s) para tentar novamente.` },
        { status: 429 }
      )
    }
    if (now >= entry.resetAt) attempts.delete(ip)
  }

  try {
    const { email, password } = await req.json()
    const user = await prisma.user.findUnique({ where: { email } })
    if (!user) {
      registerFailure(ip, now)
      return NextResponse.json({ error: 'E-mail ou senha incorretos' }, { status: 401 })
    }
    const valid = await bcrypt.compare(password, user.password)
    if (!valid) {
      registerFailure(ip, now)
      return NextResponse.json({ error: 'E-mail ou senha incorretos' }, { status: 401 })
    }

    attempts.delete(ip)

    const token = await signToken({ id: user.id, email: user.email, role: user.role, name: user.name })
    const cookieStore = await cookies()
    cookieStore.set('auth-token', token, {
      httpOnly: true,
      secure: process.env.NODE_ENV === 'production',
      sameSite: 'lax',
      maxAge: 60 * 60 * 24 * 7,
      path: '/',
    })
    return NextResponse.json({ user: { id: user.id, name: user.name, email: user.email, role: user.role } })
  } catch {
    return NextResponse.json({ error: 'Erro interno' }, { status: 500 })
  }
}

function registerFailure(ip: string, now: number) {
  const entry = attempts.get(ip)
  if (!entry || now >= entry.resetAt) {
    attempts.set(ip, { count: 1, resetAt: now + WINDOW_MS })
  } else {
    entry.count++
  }
}
