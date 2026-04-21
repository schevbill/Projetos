import { NextResponse } from 'next/server'
import { prisma } from '@/lib/prisma'
import { requireAdmin } from '@/lib/auth'
import { writeLogFromSession } from '@/lib/logger'

export async function PUT(req: Request, { params }: { params: Promise<{ id: string }> }) {
  try {
    await requireAdmin()
    const { id } = await params
    const { name } = await req.json()
    if (!name?.trim()) return NextResponse.json({ error: 'Nome obrigatório' }, { status: 400 })
    const type = await prisma.vehicleType.update({ where: { id }, data: { name: name.trim() } })
    await writeLogFromSession({ action: 'UPDATE', entity: 'MOTOBOY', entityId: id, description: `Tipo de veículo editado: ${type.name}`, req })
    return NextResponse.json(type)
  } catch {
    return NextResponse.json({ error: 'Erro ao atualizar' }, { status: 400 })
  }
}

export async function DELETE(req: Request, { params }: { params: Promise<{ id: string }> }) {
  try {
    await requireAdmin()
    const { id } = await params
    const type = await prisma.vehicleType.findUnique({ where: { id }, select: { name: true } })
    await prisma.vehicleType.delete({ where: { id } })
    await writeLogFromSession({ action: 'DELETE', entity: 'MOTOBOY', entityId: id, description: `Tipo de veículo excluído: ${type?.name ?? id}`, req })
    return NextResponse.json({ ok: true })
  } catch {
    return NextResponse.json({ error: 'Erro ao excluir. Verifique se há motoboys vinculados.' }, { status: 400 })
  }
}
