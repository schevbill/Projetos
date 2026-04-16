import { NextResponse } from 'next/server'
import { prisma } from '@/lib/prisma'
import { requireAdmin } from '@/lib/auth'

export async function GET() {
  try {
    await requireAdmin()
    const motoboys = await prisma.motoboy.findMany({ orderBy: { name: 'asc' } })
    return NextResponse.json(motoboys)
  } catch {
    return NextResponse.json({ error: 'Não autorizado' }, { status: 401 })
  }
}

export async function POST(req: Request) {
  try {
    await requireAdmin()
    const data = await req.json()
    const motoboy = await prisma.motoboy.create({ data })
    return NextResponse.json(motoboy)
  } catch {
    return NextResponse.json({ error: 'Erro' }, { status: 400 })
  }
}
