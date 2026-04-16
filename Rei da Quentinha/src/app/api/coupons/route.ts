import { NextResponse } from 'next/server'
import { prisma } from '@/lib/prisma'
import { requireAdmin } from '@/lib/auth'

export async function GET() {
  try {
    await requireAdmin()
    const coupons = await prisma.coupon.findMany({ orderBy: { createdAt: 'desc' } })
    return NextResponse.json(coupons)
  } catch {
    return NextResponse.json({ error: 'Não autorizado' }, { status: 401 })
  }
}

export async function POST(req: Request) {
  try {
    await requireAdmin()
    const data = await req.json()
    const coupon = await prisma.coupon.create({ data: { ...data, code: data.code.toUpperCase() } })
    return NextResponse.json(coupon)
  } catch {
    return NextResponse.json({ error: 'Erro ao criar cupom' }, { status: 400 })
  }
}
