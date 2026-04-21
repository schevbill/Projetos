import { NextResponse } from 'next/server'
import { prisma } from '@/lib/prisma'
import { requireAdmin } from '@/lib/auth'

export async function GET(req: Request) {
  try {
    await requireAdmin()
    const { searchParams } = new URL(req.url)

    const from = searchParams.get('from')
    const to = searchParams.get('to')

    // Usa UTC puro para evitar bug de fuso horário (Brasil UTC-3)
    const todayUTC = new Date().toISOString().split('T')[0]
    const startStr = from ?? new Date(Date.UTC(new Date().getUTCFullYear(), new Date().getUTCMonth(), 1)).toISOString().split('T')[0]
    const endStr = to ?? todayUTC

    const start = new Date(startStr + 'T00:00:00.000Z')
    const end   = new Date(endStr   + 'T23:59:59.999Z')

    const orders = await prisma.order.findMany({
      where: { createdAt: { gte: start, lte: end } },
      select: { createdAt: true, total: true, paymentStatus: true },
      orderBy: { createdAt: 'asc' },
    })

    // Gera todos os dias do intervalo em UTC
    const byDay = new Map<string, { date: string; pedidos: number; faturamento: number }>()
    const current = new Date(start)
    while (current <= end) {
      const key = current.toISOString().split('T')[0]
      byDay.set(key, { date: key, pedidos: 0, faturamento: 0 })
      current.setUTCDate(current.getUTCDate() + 1)
    }

    for (const order of orders) {
      const key = order.createdAt.toISOString().split('T')[0]
      const entry = byDay.get(key)
      if (entry) {
        entry.pedidos += 1
        if (order.paymentStatus === 'PAID') entry.faturamento += order.total
      }
    }

    const data = Array.from(byDay.values()).map(d => ({
      ...d,
      label: new Date(d.date + 'T12:00:00.000Z').toLocaleDateString('pt-BR', { day: '2-digit', month: '2-digit', timeZone: 'UTC' }),
    }))

    const paidOrders = orders.filter(o => o.paymentStatus === 'PAID')
    const totalPedidos = orders.length
    const totalFaturamento = paidOrders.reduce((s, o) => s + o.total, 0)
    const ticketMedio = paidOrders.length > 0 ? totalFaturamento / paidOrders.length : 0

    return NextResponse.json({ data, totalPedidos, totalFaturamento, ticketMedio })
  } catch (err) {
    console.error('[charts]', err)
    return NextResponse.json({ error: 'Erro' }, { status: 500 })
  }
}
