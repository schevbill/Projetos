import { NextResponse } from 'next/server'
import { prisma } from '@/lib/prisma'
import { requireAdmin } from '@/lib/auth'
import { writeLogFromSession } from '@/lib/logger'

export async function PUT(req: Request, { params }: { params: Promise<{ id: string }> }) {
  try {
    await requireAdmin()
    const { id } = await params
    const data = await req.json()
    const product = await prisma.product.update({ where: { id }, data })
    await writeLogFromSession({ action: 'UPDATE', entity: 'PRODUCT', entityId: id, description: `Produto editado: ${product.name}`, req })
    return NextResponse.json(product)
  } catch (err) {
    console.error('[products PUT]', err)
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
    console.error('[products DELETE]', err)
    return NextResponse.json({ error: 'Erro' }, { status: 400 })
  }
}
