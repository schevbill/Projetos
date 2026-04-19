import { NextResponse } from 'next/server'
import { prisma } from '@/lib/prisma'
import { requireAdmin } from '@/lib/auth'

export async function PUT(req: Request, { params }: { params: Promise<{ id: string }> }) {
  try {
    await requireAdmin()
    const { id } = await params
    const data = await req.json()
    const product = await prisma.product.update({ where: { id }, data })
    return NextResponse.json(product)
  } catch (err) {
    console.error('[products PUT]', err)
    return NextResponse.json({ error: 'Erro' }, { status: 400 })
  }
}

export async function DELETE(_req: Request, { params }: { params: Promise<{ id: string }> }) {
  try {
    await requireAdmin()
    const { id } = await params
    await prisma.product.delete({ where: { id } })
    return NextResponse.json({ ok: true })
  } catch (err) {
    console.error('[products DELETE]', err)
    return NextResponse.json({ error: 'Erro' }, { status: 400 })
  }
}
