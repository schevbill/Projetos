import { NextResponse } from 'next/server'
import { prisma } from '@/lib/prisma'
import bcrypt from 'bcryptjs'
import { signToken } from '@/lib/auth'
import { cookies } from 'next/headers'
import { validateEmail, validateCpfCnpj, validatePassword } from '@/lib/validators'
import { writeLog } from '@/lib/logger'

export async function POST(req: Request) {
  try {
    const { name, email, cpfCnpj, phone, birthDate, address, password } = await req.json()

    if (!name || !email || !password || !birthDate) {
      return NextResponse.json({ error: 'Campos obrigatórios ausentes' }, { status: 400 })
    }

    const emailErr = validateEmail(email)
    if (emailErr) return NextResponse.json({ error: emailErr }, { status: 400 })

    const passErr = validatePassword(password)
    if (passErr) return NextResponse.json({ error: passErr }, { status: 400 })

    if (cpfCnpj) {
      const docErr = validateCpfCnpj(cpfCnpj)
      if (docErr) return NextResponse.json({ error: docErr }, { status: 400 })
    }

    const exists = await prisma.user.findUnique({ where: { email } })
    if (exists) return NextResponse.json({ error: 'E-mail já cadastrado' }, { status: 400 })

    const hashed = await bcrypt.hash(password, 10)
    const user = await prisma.user.create({
      data: { name, email, cpfCnpj: cpfCnpj || null, phone, birthDate: birthDate ? new Date(birthDate) : null, address, password: hashed },
    })

    const token = await signToken({ id: user.id, email: user.email, role: user.role, name: user.name })
    const cookieStore = await cookies()
    cookieStore.set('auth-token', token, {
      httpOnly: true,
      secure: process.env.NODE_ENV === 'production',
      maxAge: 60 * 60 * 24 * 7,
      path: '/',
    })

    await writeLog({ action: 'CREATE', entity: 'USER', entityId: user.id, description: `Cadastro: ${user.name} (${user.email})`, userId: user.id, userName: user.name, userRole: user.role, req })

    return NextResponse.json({ user: { id: user.id, name: user.name, email: user.email, role: user.role } })
  } catch {
    return NextResponse.json({ error: 'Erro interno' }, { status: 500 })
  }
}
