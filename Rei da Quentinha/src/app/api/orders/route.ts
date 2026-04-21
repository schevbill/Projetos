import { NextResponse } from 'next/server'
import { prisma } from '@/lib/prisma'
import { getSession, requireAdmin } from '@/lib/auth'
import { printToThermal } from '@/lib/print'
import { writeLog } from '@/lib/logger'

export async function GET(req: Request) {
  try {
    await requireAdmin()
    const { searchParams } = new URL(req.url)
    const status = searchParams.get('status')
    const orders = await prisma.order.findMany({
      where: status ? { status } : undefined,
      include: { items: { include: { product: true } }, motoboy: true, coupon: true },
      orderBy: { createdAt: 'desc' },
    })
    return NextResponse.json(orders)
  } catch {
    return NextResponse.json({ error: 'Não autorizado' }, { status: 401 })
  }
}

export async function POST(req: Request) {
  try {
    const session = await getSession()
    const body = await req.json()
    const { customerName, customerPhone, address, items, subtotal, discount, total, paymentMethod, couponId, notes, changeFor } = body

    const order = await prisma.order.create({
      data: {
        userId: session?.id as string || null,
        customerName,
        customerPhone,
        address,
        subtotal,
        discount: discount || 0,
        total,
        paymentMethod,
        couponId: couponId || null,
        notes,
        items: {
          create: items.map((item: { productId: string; quantity: number; price: number }) => ({
            productId: item.productId,
            quantity: item.quantity,
            price: item.price,
          })),
        },
      },
      include: { items: { include: { product: true } } },
    })

    if (couponId) {
      await prisma.coupon.update({ where: { id: couponId }, data: { uses: { increment: 1 } } })
    }

    await writeLog({
      action: 'CREATE', entity: 'ORDER', entityId: order.id,
      description: `Pedido #${order.id.slice(-6).toUpperCase()} — ${customerName} — R$ ${total.toFixed(2)}`,
      userId: session?.id as string | undefined,
      userName: session?.name as string | undefined,
      userRole: session?.role as string | undefined,
      req,
    })

    try {
      const printer = await prisma.printer.findFirst({ where: { isDefault: true } })
      if (printer?.ip) {
        await printToThermal(
          { ip: printer.ip, port: printer.port || 9100 },
          {
            orderId: order.id,
            customerName,
            customerPhone,
            address,
            items: order.items.map(i => ({ name: i.product.name, quantity: i.quantity, price: i.price })),
            total,
            paymentMethod,
            change: changeFor ? changeFor - total : undefined,
            createdAt: order.createdAt,
          },
          'receipt'
        )
        await prisma.order.update({ where: { id: order.id }, data: { printedLabel: true } })
      }
    } catch (printErr) {
      console.error('Erro na impressão:', printErr)
    }

    return NextResponse.json(order)
  } catch (err) {
    console.error(err)
    return NextResponse.json({ error: 'Erro ao criar pedido' }, { status: 500 })
  }
}
