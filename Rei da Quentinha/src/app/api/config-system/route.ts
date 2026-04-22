import { NextResponse } from 'next/server'
import { prisma } from '@/lib/prisma'
import { requireAdmin } from '@/lib/auth'
import { writeLogFromSession } from '@/lib/logger'

export async function GET() {
  try {
    await requireAdmin()
    const config = await prisma.configSystem.upsert({
      where: { id: 'default' },
      update: {},
      create: { id: 'default' },
    })
    return NextResponse.json(config)
  } catch {
    return NextResponse.json({ error: 'Não autorizado' }, { status: 401 })
  }
}

export async function POST(req: Request) {
  try {
    await requireAdmin()
    const { whatsappCustomer, whatsappMotoboy, logRetentionDays } = await req.json()

    const days = Math.max(1, parseInt(logRetentionDays) || 30)
    const prev = await prisma.configSystem.findUnique({ where: { id: 'default' } })

    const config = await prisma.configSystem.upsert({
      where: { id: 'default' },
      update: { whatsappCustomer, whatsappMotoboy, logRetentionDays: days },
      create: { id: 'default', whatsappCustomer, whatsappMotoboy, logRetentionDays: days },
    })

    await writeLogFromSession({
      action: 'UPDATE',
      entity: 'CONFIG',
      entityId: 'system',
      description: 'Configurações do sistema atualizadas',
      before: prev ? { whatsappCustomer: prev.whatsappCustomer, whatsappMotoboy: prev.whatsappMotoboy, logRetentionDays: prev.logRetentionDays } : undefined,
      after: { whatsappCustomer, whatsappMotoboy, logRetentionDays: days },
      req,
    })

    return NextResponse.json(config)
  } catch {
    return NextResponse.json({ error: 'Erro ao salvar' }, { status: 500 })
  }
}
