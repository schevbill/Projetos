import { NextResponse } from 'next/server'
import { prisma } from '@/lib/prisma'
import { requireAdmin } from '@/lib/auth'
import { writeLogFromSession, writeErrorLog } from '@/lib/logger'

export async function PUT(req: Request, { params }: { params: Promise<{ id: string }> }) {
  try {
    await requireAdmin()
    const { id } = await params
    const data = await req.json()

    const prev = await prisma.product.findUnique({
      where: { id },
      select: { name: true, description: true, price: true, categoryId: true, available: true },
    })

    const { name, description, price, image, categoryId, available } = data
    if (name !== undefined && !name?.trim()) return NextResponse.json({ error: 'Nome obrigatório' }, { status: 400 })
    if (price !== undefined && (typeof price !== 'number' || price < 0)) return NextResponse.json({ error: 'Preço inválido' }, { status: 400 })

    const product = await prisma.product.update({
      where: { id },
      data: {
        ...(name !== undefined && { name: name.trim() }),
        ...(description !== undefined && { description: description?.trim() || null }),
        ...(price !== undefined && { price }),
        ...(image !== undefined && { image }),
        ...(categoryId !== undefined && { categoryId: categoryId || null }),
        ...(available !== undefined && { available }),
      },
    })

    await writeLogFromSession({
      action: 'UPDATE', entity: 'PRODUCT', entityId: id,
      description: `Produto editado: ${product.name}`,
      before: prev ?? undefined,
      after: { name: data.name, description: data.description, price: data.price, categoryId: data.categoryId, available: data.available },
      req,
    })
    return NextResponse.json(product)
  } catch (err) {
    const { id } = await params
    await writeErrorLog({ description: `Erro ao editar produto ${id}`, entity: 'PRODUCT', entityId: id, req, error: err })
    return NextResponse.json({ error: 'Erro' }, { status: 400 })
  }
}

export async function DELETE(req: Request, { params }: { params: Promise<{ id: string }> }) {
  try {
    await requireAdmin()
    const { id } = await params
    const product = await prisma.product.findUnique({ where: { id }, select: { name: true } })
    await prisma.product.delete({ where: { id } })
    await writeLogFromSession({ action: 'DELETE', entity: 'PRODUCT', entityId: id, description: `Produto excluído: ${product?.name ?? id}`, req })
    return NextResponse.json({ ok: true })
  } catch (err) {
    const { id } = await params
    await writeErrorLog({ description: `Erro ao excluir produto ${id}`, entity: 'PRODUCT', entityId: id, req, error: err })
    return NextResponse.json({ error: 'Erro' }, { status: 400 })
  }
}
