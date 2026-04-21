import { NextResponse } from 'next/server'
import { getSession } from '@/lib/auth'
import { prisma } from '@/lib/prisma'
import bcrypt from 'bcryptjs'
import { writeLogFromSession } from '@/lib/logger'

export async function GET() {
  const session = await getSession()
  if (!session) return NextResponse.json({ user: null })
  const user = await prisma.user.findUnique({
    where: { id: session.id as string },
    select: { id: true, name: true, email: true, phone: true, cpfCnpj: true, birthDate: true, role: true },
  })
  return NextResponse.json({ user })
}

export async function PUT(req: Request) {
  const session = await getSession()
  if (!session) return NextResponse.json({ error: 'Não autorizado' }, { status: 401 })

  const { name, phone, password } = await req.json()

  const data: Record<string, unknown> = {}
  if (name) data.name = name
  if (phone !== undefined) data.phone = phone
  if (password) data.password = await bcrypt.hash(password, 10)

  const user = await prisma.user.update({
    where: { id: session.id as string },
    data,
    select: { id: true, name: true, email: true, phone: true, cpfCnpj: true, birthDate: true, role: true },
  })
  await writeLogFromSession({ action: 'UPDATE', entity: 'USER', entityId: user.id, description: `Perfil atualizado: ${user.name} (${user.email})`, req })
  return NextResponse.json({ user })
}
