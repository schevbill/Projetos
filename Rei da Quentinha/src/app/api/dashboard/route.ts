import { NextResponse } from 'next/server'
import { prisma } from '@/lib/prisma'
import { requireAdmin } from '@/lib/auth'

export async function GET() {
  try {
    await requireAdmin()
    const today = new Date()
    today.setHours(0, 0, 0, 0)

    const [totalOrders, todayOrders, pendingOrders, totalRevenue, todayRevenue, topProducts, recentOrders] =
      await Promise.all([
        prisma.order.count({ where: { paymentStatus: 'PAID' } }),
        prisma.order.count({ where: { createdAt: { gte: today } } }),
        prisma.order.count({ where: { status: { in: ['PENDING', 'CONFIRMED', 'PREPARING'] } } }),
        prisma.order.aggregate({ where: { paymentStatus: 'PAID' }, _sum: { total: true } }),
        prisma.order.aggregate({ where: { createdAt: { gte: today }, paymentStatus: 'PAID' }, _sum: { total: true } }),
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
      totalRevenue: totalRevenue._sum.total || 0,
      todayRevenue: todayRevenue._sum.total || 0,
      topProducts: topProductsWithNames,
      recentOrders,
    })
  } catch {
    return NextResponse.json({ error: 'Não autorizado' }, { status: 401 })
  }
}
