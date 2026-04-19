import { NextResponse } from 'next/server'
import { prisma } from '@/lib/prisma'
import { requireAdmin } from '@/lib/auth'

export async function GET(req: Request) {
  const { searchParams } = new URL(req.url)
  const withCategory = searchParams.get('withCategory') === '1'
  const products = await prisma.product.findMany({
    orderBy: { createdAt: 'asc' },
    include: withCategory ? { categoryRel: true } : undefined,
  })
  return NextResponse.json(products)
}

export async function POST(req: Request) {
  try {
    await requireAdmin()
    const data = await req.json()
    const product = await prisma.product.create({ data })
    return NextResponse.json(product)
  } catch {
    return NextResponse.json({ error: 'Não autorizado' }, { status: 401 })
  }
}
