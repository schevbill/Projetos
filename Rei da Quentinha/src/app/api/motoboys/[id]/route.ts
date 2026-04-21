import { NextResponse } from 'next/server'
import { prisma } from '@/lib/prisma'
import { requireAdmin } from '@/lib/auth'
import { writeLogFromSession } from '@/lib/logger'

const includeVehicles = {
  vehicles: { include: { vehicleType: true }, orderBy: { createdAt: 'asc' as const } },
}

export async function PUT(req: Request, { params }: { params: Promise<{ id: string }> }) {
  try {
    await requireAdmin()
    const { id } = await params
    const { name, phone, cpfCnpj, cep, logradouro, numero, complemento, bairro, cidade, estado, active, vehicles } = await req.json()

    const prev = await prisma.motoboy.findUnique({
      where: { id },
      select: { name: true, phone: true, cpfCnpj: true, cep: true, logradouro: true, numero: true, complemento: true, bairro: true, cidade: true, estado: true, active: true },
    })

    await prisma.motoboyVehicle.deleteMany({ where: { motoboyId: id } })

    const motoboy = await prisma.motoboy.update({
      where: { id },
      data: {
        name, phone,
        cpfCnpj: cpfCnpj || null,
        cep: cep || null, logradouro: logradouro || null, numero: numero || null,
        complemento: complemento || null, bairro: bairro || null, cidade: cidade || null, estado: estado || null,
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

    await writeLogFromSession({
      action: 'UPDATE', entity: 'MOTOBOY', entityId: id,
      description: `Motoboy editado: ${motoboy.name}`,
      before: prev ?? undefined,
      after: { name, phone, cpfCnpj: cpfCnpj || null, cep: cep || null, logradouro: logradouro || null, numero: numero || null, complemento: complemento || null, bairro: bairro || null, cidade: cidade || null, estado: estado || null, active },
      req,
    })
    return NextResponse.json(motoboy)
  } catch {
    return NextResponse.json({ error: 'Erro ao atualizar motoboy' }, { status: 400 })
  }
}

export async function DELETE(req: Request, { params }: { params: Promise<{ id: string }> }) {
  try {
    await requireAdmin()
    const { id } = await params
    const motoboy = await prisma.motoboy.findUnique({ where: { id }, select: { name: true } })
    await prisma.motoboy.delete({ where: { id } })
    await writeLogFromSession({ action: 'DELETE', entity: 'MOTOBOY', entityId: id, description: `Motoboy excluído: ${motoboy?.name ?? id}`, req })
    return NextResponse.json({ ok: true })
  } catch {
    return NextResponse.json({ error: 'Erro ao excluir' }, { status: 400 })
  }
}
