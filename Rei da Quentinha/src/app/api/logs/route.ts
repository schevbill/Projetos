import { NextResponse } from 'next/server'
import { prisma } from '@/lib/prisma'
import { requireAdmin } from '@/lib/auth'

async function cleanOldLogs() {
  try {
    const config = await prisma.configSystem.findUnique({ where: { id: 'default' } })
    const days = config?.logRetentionDays ?? 30
    if (days <= 0) return
    const cutoff = new Date(Date.now() - days * 24 * 60 * 60 * 1000)
    await prisma.log.deleteMany({ where: { createdAt: { lt: cutoff } } })
  } catch { /* nunca quebra a listagem */ }
}

export async function GET(req: Request) {
  try {
    await requireAdmin()
    cleanOldLogs() // fire-and-forget: limpa logs antigos em background
    const { searchParams } = new URL(req.url)
    const entity = searchParams.get('entity') || undefined
    const action = searchParams.get('action') || undefined
    const page = Math.max(1, parseInt(searchParams.get('page') || '1'))
    const limit = 50

    const where = {
      ...(entity ? { entity } : {}),
      ...(action ? { action } : {}),
    }

    const [logs, total] = await Promise.all([
      prisma.log.findMany({
        where,
        orderBy: { createdAt: 'desc' },
        skip: (page - 1) * limit,
        take: limit,
      }),
      prisma.log.count({ where }),
    ])

    return NextResponse.json({ logs, total, page, pages: Math.ceil(total / limit) })
  } catch {
    return NextResponse.json({ error: 'Não autorizado' }, { status: 401 })
  }
}
