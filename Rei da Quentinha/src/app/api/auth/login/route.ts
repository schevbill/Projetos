import { NextResponse } from 'next/server'
import { prisma } from '@/lib/prisma'
import bcrypt from 'bcryptjs'
import { signToken } from '@/lib/auth'
import { cookies } from 'next/headers'
import { writeLog, writeErrorLog } from '@/lib/logger'
import { randomUUID } from 'crypto'

const attempts = new Map<string, { count: number; resetAt: number }>()
const MAX_ATTEMPTS = 5
const WINDOW_MS = 15 * 60 * 1000
const SESSION_MINUTES = 40

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

    // Bloqueia segundo login se já há sessão ativa
    if (user.sessionToken && user.sessionExpiresAt && user.sessionExpiresAt > new Date()) {
      await writeLog({
        action: 'LOGIN_BLOCKED',
        entity: 'USER',
        entityId: user.id,
        description: `Tentativa de login bloqueada — sessão já ativa: ${user.name} (${user.email})`,
        userId: user.id,
        userName: user.name,
        userRole: user.role,
        req,
      })
      return NextResponse.json(
        { error: 'Já existe uma sessão ativa para este usuário. Faça logout antes de entrar novamente.' },
        { status: 409 }
      )
    }

    attempts.delete(ip)

    // Cria nova sessão
    const sessionToken = randomUUID()
    const sessionExpiresAt = new Date(Date.now() + SESSION_MINUTES * 60 * 1000)

    await prisma.user.update({
      where: { id: user.id },
      data: { sessionToken, sessionExpiresAt },
    })

    const token = await signToken({ id: user.id, email: user.email, role: user.role, name: user.name, sessionToken })
    const cookieStore = await cookies()
    cookieStore.set('auth-token', token, {
      httpOnly: true,
      secure: process.env.NODE_ENV === 'production',
      sameSite: 'lax',
      maxAge: 60 * 60 * 24 * 7,
      path: '/',
    })

    await writeLog({ action: 'LOGIN', entity: 'USER', entityId: user.id, description: `Login: ${user.name} (${user.email})`, userId: user.id, userName: user.name, userRole: user.role, req })

    return NextResponse.json({ user: { id: user.id, name: user.name, email: user.email, role: user.role } })
  } catch (err) {
    await writeErrorLog({ description: 'Erro interno no login', entity: 'USER', req, error: err })
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
