import { NextResponse } from 'next/server'
import { prisma } from '@/lib/prisma'
import { validatePassword } from '@/lib/validators'
import { writeLog } from '@/lib/logger'
import bcrypt from 'bcryptjs'

export async function GET(req: Request) {
  const { searchParams } = new URL(req.url)
  const token = searchParams.get('token')

  if (!token) {
    return NextResponse.json({ error: 'Token inválido' }, { status: 400 })
  }

  const record = await prisma.passwordResetToken.findUnique({
    where: { token },
    include: { user: { select: { name: true } } },
  })

  if (!record || record.used || record.expiresAt < new Date()) {
    return NextResponse.json(
      { error: 'Link inválido ou expirado. Solicite um novo link de recuperação.' },
      { status: 400 }
    )
  }

  return NextResponse.json({ name: record.user.name })
}

export async function POST(req: Request) {
  try {
    const { token, password } = await req.json()

    if (!token) {
      return NextResponse.json({ error: 'Token inválido' }, { status: 400 })
    }

    const passError = validatePassword(password)
    if (passError) {
      return NextResponse.json({ error: passError }, { status: 400 })
    }

    const record = await prisma.passwordResetToken.findUnique({
      where: { token },
      include: { user: { select: { id: true, name: true, email: true, role: true } } },
    })

    if (!record || record.used || record.expiresAt < new Date()) {
      return NextResponse.json(
        { error: 'Link inválido ou expirado. Solicite um novo link de recuperação.' },
        { status: 400 }
      )
    }

    const hashed = await bcrypt.hash(password, 10)

    await prisma.$transaction([
      prisma.user.update({
        where: { id: record.userId },
        data: { password: hashed, sessionToken: null, sessionExpiresAt: null },
      }),
      prisma.passwordResetToken.update({
        where: { id: record.id },
        data: { used: true },
      }),
    ])

    await writeLog({
      action: 'UPDATE',
      entity: 'USER',
      entityId: record.userId,
      description: `Senha redefinida via link de recuperação: ${record.user.name} (${record.user.email})`,
      userId: record.userId,
      userName: record.user.name,
      userRole: record.user.role,
      req,
      after: { senha: '*** alterada via recuperação de senha ***' },
    })

    return NextResponse.json({ ok: true })
  } catch (err) {
    console.error(err)
    return NextResponse.json({ error: 'Erro ao redefinir senha' }, { status: 500 })
  }
}
