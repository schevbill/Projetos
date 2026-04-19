import { NextResponse } from 'next/server'
import { prisma } from '@/lib/prisma'
import { requireAdmin } from '@/lib/auth'

export async function GET(_req: Request, { params }: { params: Promise<{ code: string }> }) {
  const { code } = await params
  const coupon = await prisma.coupon.findUnique({ where: { code: code.toUpperCase() } })
  if (!coupon || !coupon.active) return NextResponse.json({ error: 'Cupom inválido' }, { status: 404 })
  if (coupon.expiresAt && new Date(coupon.expiresAt) < new Date()) {
    return NextResponse.json({ error: 'Cupom expirado' }, { status: 400 })
  }
  if (coupon.maxUses && coupon.uses >= coupon.maxUses) {
    return NextResponse.json({ error: 'Cupom esgotado' }, { status: 400 })
  }
  return NextResponse.json({ id: coupon.id, discount: coupon.discount, type: coupon.type })
}

export async function PUT(req: Request, { params }: { params: Promise<{ code: string }> }) {
  try {
    await requireAdmin()
    const { code } = await params
    const data = await req.json()
    const coupon = await prisma.coupon.update({ where: { code }, data })
    return NextResponse.json(coupon)
  } catch {
    return NextResponse.json({ error: 'Erro' }, { status: 400 })
  }
}

export async function DELETE(_req: Request, { params }: { params: Promise<{ code: string }> }) {
  try {
    await requireAdmin()
    const { code } = await params
    await prisma.coupon.delete({ where: { code } })
    return NextResponse.json({ ok: true })
  } catch {
    return NextResponse.json({ error: 'Erro' }, { status: 400 })
  }
}
