import { NextResponse } from 'next/server'
import { prisma } from '@/lib/prisma'
import { requireAdmin } from '@/lib/auth'

export async function GET() {
  try {
    await requireAdmin()
    const printers = await prisma.printer.findMany({ orderBy: { createdAt: 'desc' } })
    return NextResponse.json(printers)
  } catch {
    return NextResponse.json({ error: 'Não autorizado' }, { status: 401 })
  }
}

export async function POST(req: Request) {
  try {
    await requireAdmin()
    const data = await req.json()
    if (data.isDefault) {
      await prisma.printer.updateMany({ data: { isDefault: false } })
    }
    const printer = await prisma.printer.create({ data })
    return NextResponse.json(printer)
  } catch {
    return NextResponse.json({ error: 'Erro' }, { status: 400 })
  }
}
