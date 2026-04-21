import { NextResponse } from 'next/server'
import { prisma } from '@/lib/prisma'
import { requireAdmin } from '@/lib/auth'
import bcrypt from 'bcryptjs'
import { writeLogFromSession } from '@/lib/logger'

export async function GET() {
  try {
    await requireAdmin()
    const users = await prisma.user.findMany({
      select: { id: true, name: true, email: true, cpfCnpj: true, phone: true, birthDate: true, role: true, createdAt: true },
      orderBy: { createdAt: 'desc' },
    })
    return NextResponse.json(users)
  } catch {
    return NextResponse.json({ error: 'Não autorizado' }, { status: 401 })
  }
}

export async function POST(req: Request) {
  try {
    await requireAdmin()
    const { name, email, phone, cpfCnpj, birthDate, password, role } = await req.json()
    const exists = await prisma.user.findUnique({ where: { email } })
    if (exists) return NextResponse.json({ error: 'E-mail já cadastrado' }, { status: 400 })
    const hashed = await bcrypt.hash(password, 10)
    const user = await prisma.user.create({
      data: {
        name,
        email,
        phone: phone || null,
        cpfCnpj: cpfCnpj || null,
        birthDate: birthDate ? new Date(birthDate) : null,
        password: hashed,
        role: role || 'CUSTOMER',
      },
      select: { id: true, name: true, email: true, cpfCnpj: true, phone: true, role: true, createdAt: true },
    })
    await writeLogFromSession({ action: 'CREATE', entity: 'USER', entityId: user.id, description: `Admin criou usuário: ${user.name} (${user.email})`, req })
    return NextResponse.json(user)
  } catch {
    return NextResponse.json({ error: 'Erro ao criar usuário' }, { status: 400 })
  }
}
