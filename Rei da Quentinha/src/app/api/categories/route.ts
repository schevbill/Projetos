import { NextResponse } from 'next/server'
import { prisma } from '@/lib/prisma'
import { requireAdmin } from '@/lib/auth'

export async function GET() {
  const categories = await prisma.category.findMany({ orderBy: { name: 'asc' } })
  return NextResponse.json(categories)
}

export async function POST(req: Request) {
  try {
    await requireAdmin()
    const { name } = await req.json()
    if (!name?.trim()) return NextResponse.json({ error: 'Nome obrigatório' }, { status: 400 })
    const category = await prisma.category.create({ data: { name: name.trim() } })
    return NextResponse.json(category)
  } catch (err: any) {
    if (err?.code === 'P2002') return NextResponse.json({ error: 'Categoria já existe' }, { status: 400 })
    return NextResponse.json({ error: 'Erro ao criar categoria' }, { status: 500 })
  }
}
