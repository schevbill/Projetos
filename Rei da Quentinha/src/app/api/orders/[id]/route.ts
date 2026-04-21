import { NextResponse } from 'next/server'
import { prisma } from '@/lib/prisma'
import { requireAdmin } from '@/lib/auth'
import { printToThermal } from '@/lib/print'
import { writeLogFromSession } from '@/lib/logger'

export async function GET(_req: Request, { params }: { params: Promise<{ id: string }> }) {
  const { id } = await params
  const order = await prisma.order.findUnique({
    where: { id },
    include: { items: { include: { product: true } }, motoboy: true, coupon: true },
  })
  if (!order) return NextResponse.json({ error: 'Not found' }, { status: 404 })
  return NextResponse.json(order)
}

export async function PATCH(req: Request, { params }: { params: Promise<{ id: string }> }) {
  try {
    await requireAdmin()
    const { id } = await params
    const data = await req.json()
    const order = await prisma.order.update({
      where: { id },
      data,
      include: { items: { include: { product: true } }, motoboy: true },
    })

    const fields = Object.keys(data).join(', ')
    await writeLogFromSession({ action: 'UPDATE', entity: 'ORDER', entityId: id, description: `Pedido #${id.slice(-6).toUpperCase()} atualizado — ${fields}`, req })

    if ((data.status === 'CONFIRMED' || data.status === 'PREPARING') && !order.printedLabel) {
      try {
        const printer = await prisma.printer.findFirst({ where: { isDefault: true } })
        if (printer?.ip) {
          await printToThermal(
            { ip: printer.ip, port: printer.port || 9100 },
            {
              orderId: order.id,
              customerName: order.customerName,
              customerPhone: order.customerPhone,
              address: order.address,
              items: order.items.map(i => ({ name: i.product.name, quantity: i.quantity, price: i.price })),
              total: order.total,
              paymentMethod: order.paymentMethod,
              createdAt: order.createdAt,
            },
            'receipt'
          )
          await prisma.order.update({ where: { id: order.id }, data: { printedLabel: true } })
        }
      } catch (printErr) {
        console.error('Erro na impressão:', printErr)
      }
    }

    return NextResponse.json(order)
  } catch {
    return NextResponse.json({ error: 'Erro' }, { status: 400 })
  }
}
