import { NextResponse } from 'next/server'
import { prisma } from '@/lib/prisma'
import { requireAdmin } from '@/lib/auth'
import { writeLogFromSession } from '@/lib/logger'

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
    const body = await req.json()
    const { name, description, price, image, categoryId, available } = body

    if (!name?.trim()) return NextResponse.json({ error: 'Nome obrigatório' }, { status: 400 })
    if (typeof price !== 'number' || price < 0) return NextResponse.json({ error: 'Preço inválido' }, { status: 400 })

    const product = await prisma.product.create({
      data: {
        name: name.trim(),
        description: description?.trim() || null,
        price,
        image: image || null,
        categoryId: categoryId || null,
        available: available !== false,
      },
    })
    await writeLogFromSession({ action: 'CREATE', entity: 'PRODUCT', entityId: product.id, description: `Produto criado: ${product.name}`, req })
    return NextResponse.json(product)
  } catch {
    return NextResponse.json({ error: 'Não autorizado' }, { status: 401 })
  }
}
