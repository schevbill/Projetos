import { NextResponse } from 'next/server'
import { prisma } from '@/lib/prisma'
import { requireAdmin } from '@/lib/auth'
import { writeLogFromSession } from '@/lib/logger'

export async function GET() {
  const types = await prisma.vehicleType.findMany({ orderBy: { name: 'asc' } })
  return NextResponse.json(types)
}

export async function POST(req: Request) {
  try {
    await requireAdmin()
    const { name } = await req.json()
    if (!name?.trim()) return NextResponse.json({ error: 'Nome obrigatório' }, { status: 400 })
    const type = await prisma.vehicleType.create({ data: { name: name.trim() } })
    await writeLogFromSession({
      action: 'CREATE', entity: 'VEHICLE_TYPE', entityId: type.id,
      description: `Tipo de veículo criado: ${type.name}`,
      after: { name: type.name },
      req,
    })
    return NextResponse.json(type)
  } catch {
    return NextResponse.json({ error: 'Erro ao criar tipo de veículo' }, { status: 400 })
  }
}
