import { NextResponse } from 'next/server'
import { prisma } from '@/lib/prisma'
import { requireAdmin } from '@/lib/auth'
import bcrypt from 'bcryptjs'
import { writeLogFromSession } from '@/lib/logger'

export async function PUT(req: Request, { params }: { params: Promise<{ id: string }> }) {
  try {
    await requireAdmin()
    const { id } = await params
    const { name, email, phone, cpfCnpj, birthDate, password, role } = await req.json()

    if (email) {
      const conflict = await prisma.user.findFirst({ where: { email, NOT: { id } } })
      if (conflict) return NextResponse.json({ error: 'E-mail já está em uso' }, { status: 400 })
    }

    const updateData: Record<string, unknown> = {
      name,
      email,
      phone: phone || null,
      cpfCnpj: cpfCnpj || null,
      birthDate: birthDate ? new Date(birthDate) : null,
      role,
    }
    if (password) updateData.password = await bcrypt.hash(password, 10)

    const user = await prisma.user.update({
      where: { id },
      data: updateData,
      select: { id: true, name: true, email: true, cpfCnpj: true, phone: true, role: true, createdAt: true },
    })
    await writeLogFromSession({ action: 'UPDATE', entity: 'USER', entityId: id, description: `Admin editou usuário: ${user.name} (${user.email})`, req })
    return NextResponse.json(user)
  } catch {
    return NextResponse.json({ error: 'Erro ao atualizar usuário' }, { status: 400 })
  }
}

export async function DELETE(req: Request, { params }: { params: Promise<{ id: string }> }) {
  try {
    await requireAdmin()
    const { id } = await params
    const target = await prisma.user.findUnique({ where: { id }, select: { name: true, email: true } })
    await prisma.user.delete({ where: { id } })
    await writeLogFromSession({ action: 'DELETE', entity: 'USER', entityId: id, description: `Admin excluiu usuário: ${target?.name ?? id} (${target?.email ?? ''})`, req })
    return NextResponse.json({ ok: true })
  } catch {
    return NextResponse.json({ error: 'Erro' }, { status: 400 })
  }
}
