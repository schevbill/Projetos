import { NextResponse } from 'next/server'
import { prisma } from '@/lib/prisma'
import { sendPasswordResetEmail } from '@/lib/email'
import { formatCpfCnpj } from '@/lib/validators'
import crypto from 'crypto'

const resetAttempts = new Map<string, { count: number; resetAt: number }>()

export async function POST(req: Request) {
  const ip = req.headers.get('x-forwarded-for')?.split(',')[0].trim() || 'unknown'
  const now = Date.now()
  const entry = resetAttempts.get(ip)
  if (entry) {
    if (now < entry.resetAt) {
      if (entry.count >= 5) {
        return NextResponse.json({ error: 'Muitas tentativas. Aguarde alguns minutos.' }, { status: 429 })
      }
      entry.count++
    } else {
      resetAttempts.set(ip, { count: 1, resetAt: now + 60_000 })
    }
  } else {
    resetAttempts.set(ip, { count: 1, resetAt: now + 60_000 })
  }

  try {
    const { identifier } = await req.json()
    if (!identifier?.trim()) {
      return NextResponse.json({ error: 'Informe o e-mail, CPF ou CNPJ' }, { status: 400 })
    }

    const clean = identifier.trim()
    const formatted = formatCpfCnpj(clean)

    const user = await prisma.user.findFirst({
      where: {
        OR: [
          { email: clean.toLowerCase() },
          { cpfCnpj: clean },
          { cpfCnpj: formatted },
        ],
      },
      select: { id: true, name: true, email: true },
    })

    if (!user) {
      return NextResponse.json(
        { error: 'Não existe cadastro com este e-mail, CPF ou CNPJ.' },
        { status: 404 }
      )
    }

    // Invalida tokens anteriores não usados
    await prisma.passwordResetToken.updateMany({
      where: { userId: user.id, used: false },
      data: { used: true },
    })

    const token = crypto.randomBytes(32).toString('hex')
    const expiresAt = new Date(Date.now() + 60 * 60 * 1000) // 1 hora

    await prisma.passwordResetToken.create({
      data: { token, userId: user.id, expiresAt },
    })

    const appUrl = process.env.NEXT_PUBLIC_APP_URL || 'http://localhost:4000'
    const resetLink = `${appUrl}/auth/reset-password?token=${token}`

    await sendPasswordResetEmail(user.email, user.name, resetLink)

    return NextResponse.json({ ok: true })
  } catch (err) {
    console.error(err)
    return NextResponse.json({ error: 'Erro ao processar solicitação' }, { status: 500 })
  }
}
