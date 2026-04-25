import { NextResponse } from 'next/server'
import { prisma } from '@/lib/prisma'
import { requireAdmin } from '@/lib/auth'

export async function GET() {
  try {
    await requireAdmin()
    // Início e fim do dia de hoje no horário de Brasília (UTC-3)
    const nowBrazil = new Date(Date.now() - 3 * 60 * 60 * 1000)
    const todayStr = nowBrazil.toISOString().split('T')[0]
    const todayStart = new Date(todayStr + 'T03:00:00.000Z')   // 00:00 BRT = 03:00 UTC
    const todayEnd   = new Date(todayStart.getTime() + 24 * 60 * 60 * 1000)

    const [totalOrders, todayOrders, pendingOrders, deliveredOrders, totalRevenue, todayRevenue, topProducts, recentOrders] =
      await Promise.all([
        prisma.order.count({ where: { paymentStatus: 'PAID' } }),
        prisma.order.count({ where: { createdAt: { gte: todayStart, lt: todayEnd } } }),
        prisma.order.count({ where: { createdAt: { gte: todayStart, lt: todayEnd }, status: { in: ['PENDING', 'CONFIRMED', 'PREPARING'] } } }),
        prisma.order.count({ where: { createdAt: { gte: todayStart, lt: todayEnd }, status: 'DELIVERED' } }),
        prisma.order.aggregate({ where: { paymentStatus: 'PAID' }, _sum: { total: true } }),
        prisma.order.aggregate({ where: { createdAt: { gte: todayStart, lt: todayEnd }, paymentStatus: 'PAID' }, _sum: { total: true } }),
        prisma.orderItem.groupBy({
          by: ['productId'],
          _sum: { quantity: true },
          orderBy: { _sum: { quantity: 'desc' } },
          take: 5,
        }),
        prisma.order.findMany({
          take: 10,
          orderBy: { createdAt: 'desc' },
          include: { items: { include: { product: true } } },
        }),
      ])

    const productIds = topProducts.map(p => p.productId)
    const products = await prisma.product.findMany({ where: { id: { in: productIds } } })
    const topProductsWithNames = topProducts.map(p => ({
      ...p,
      product: products.find(prod => prod.id === p.productId),
    }))

    return NextResponse.json({
      totalOrders,
      todayOrders,
      pendingOrders,
      deliveredOrders,
      totalRevenue: totalRevenue._sum.total || 0,
      todayRevenue: todayRevenue._sum.total || 0,
      topProducts: topProductsWithNames,
      recentOrders,
    })
  } catch (err) {
    console.error('[dashboard]', err)
    return NextResponse.json({ error: 'Não autorizado' }, { status: 401 })
  }
}
