import { NextResponse } from 'next/server'
import { prisma } from '@/lib/prisma'
import { requireAdmin } from '@/lib/auth'
import { writeLogFromSession } from '@/lib/logger'

const includeVehicles = {
  vehicles: { include: { vehicleType: true }, orderBy: { createdAt: 'asc' as const } },
}

export async function GET() {
  try {
    await requireAdmin()
    const motoboys = await prisma.motoboy.findMany({
      orderBy: { name: 'asc' },
      include: includeVehicles,
    })
    return NextResponse.json(motoboys)
  } catch {
    return NextResponse.json({ error: 'Não autorizado' }, { status: 401 })
  }
}

export async function POST(req: Request) {
  try {
    await requireAdmin()
    const { name, phone, cpfCnpj, cep, logradouro, numero, complemento, bairro, cidade, estado, active, vehicles } = await req.json()
    const motoboy = await prisma.motoboy.create({
      data: {
        name,
        phone,
        cpfCnpj: cpfCnpj || null,
        cep: cep || null,
        logradouro: logradouro || null,
        numero: numero || null,
        complemento: complemento || null,
        bairro: bairro || null,
        cidade: cidade || null,
        estado: estado || null,
        active,
        vehicles: {
          create: (vehicles ?? []).map((v: { vehicleTypeId?: string; plate?: string }) => ({
            vehicleTypeId: v.vehicleTypeId || null,
            plate: v.plate || null,
          })),
        },
      },
      include: includeVehicles,
    })
    await writeLogFromSession({ action: 'CREATE', entity: 'MOTOBOY', entityId: motoboy.id, description: `Motoboy criado: ${motoboy.name}`, req })
    return NextResponse.json(motoboy)
  } catch {
    return NextResponse.json({ error: 'Erro ao criar motoboy' }, { status: 400 })
  }
}
