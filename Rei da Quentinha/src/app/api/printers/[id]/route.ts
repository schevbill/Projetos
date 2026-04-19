import { NextResponse } from 'next/server'
import { prisma } from '@/lib/prisma'
import { requireAdmin } from '@/lib/auth'

export async function PUT(req: Request, { params }: { params: Promise<{ id: string }> }) {
  try {
    await requireAdmin()
    const { id } = await params
    const data = await req.json()
    if (data.isDefault) {
      await prisma.printer.updateMany({ where: { id: { not: id } }, data: { isDefault: false } })
    }
    const printer = await prisma.printer.update({ where: { id }, data })
    return NextResponse.json(printer)
  } catch {
    return NextResponse.json({ error: 'Erro' }, { status: 400 })
  }
}

export async function DELETE(_req: Request, { params }: { params: Promise<{ id: string }> }) {
  try {
    await requireAdmin()
    const { id } = await params
    await prisma.printer.delete({ where: { id } })
    return NextResponse.json({ ok: true })
  } catch {
    return NextResponse.json({ error: 'Erro' }, { status: 400 })
  }
}
