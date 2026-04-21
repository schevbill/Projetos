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

    const prev = await prisma.category.findUnique({ where: { id }, select: { name: true } })

    const category = await prisma.category.update({ where: { id }, data: { name: name.trim() } })

    await writeLogFromSession({
      action: 'UPDATE', entity: 'CATEGORY', entityId: id,
      description: `Categoria editada: ${prev?.name} → ${category.name}`,
      before: prev ?? undefined,
      after: { name: category.name },
      req,
    })
    return NextResponse.json(category)
  } catch (err: any) {
    if (err?.code === 'P2002') return NextResponse.json({ error: 'Categoria já existe' }, { status: 400 })
    return NextResponse.json({ error: 'Erro ao atualizar' }, { status: 500 })
  }
}

export async function DELETE(req: Request, { params }: { params: Promise<{ id: string }> }) {
  try {
    await requireAdmin()
    const { id } = await params
    const category = await prisma.category.findUnique({ where: { id }, select: { name: true } })
    await prisma.category.delete({ where: { id } })
    await writeLogFromSession({
      action: 'DELETE', entity: 'CATEGORY', entityId: id,
      description: `Categoria excluída: ${category?.name ?? id}`,
      req,
    })
    return NextResponse.json({ ok: true })
  } catch {
    return NextResponse.json({ error: 'Erro ao excluir. Verifique se não há produtos vinculados.' }, { status: 400 })
  }
}
