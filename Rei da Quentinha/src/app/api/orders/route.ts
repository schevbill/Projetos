import { NextResponse } from 'next/server'
import { prisma } from '@/lib/prisma'
import { getSession, requireAdmin } from '@/lib/auth'
import { printToThermal } from '@/lib/print'
import { writeLog, writeErrorLog } from '@/lib/logger'

export async function GET(req: Request) {
  try {
    await requireAdmin()
    const { searchParams } = new URL(req.url)
    const status = searchParams.get('status')
    const from   = searchParams.get('from')
    const to     = searchParams.get('to')

    const where: Record<string, unknown> = {}
    if (status) where.status = status
    if (from || to) {
      const dateFilter: Record<string, Date> = {}
      if (from) dateFilter.gte = new Date(from + 'T03:00:00.000Z')
      if (to)   dateFilter.lt  = new Date(new Date(to + 'T03:00:00.000Z').getTime() + 86400000)
      where.createdAt = dateFilter
    }

    const orders = await prisma.order.findMany({
      where,
      include: { items: { include: { product: true } }, motoboy: true, coupon: true },
      orderBy: { createdAt: 'desc' },
    })
    return NextResponse.json(orders)
  } catch {
    return NextResponse.json({ error: 'Não autorizado' }, { status: 401 })
  }
}

const VALID_PAYMENT_METHODS = ['PIX', 'CREDIT_CARD', 'DEBIT_CARD', 'CASH']

export async function POST(req: Request) {
  try {
    const session = await getSession()
    const body = await req.json()
    const { customerName, customerPhone, address, items, subtotal, discount, total, paymentMethod, couponId, notes, changeFor } = body

    // Validações de entrada
    if (!customerName?.trim()) return NextResponse.json({ error: 'Nome do cliente obrigatório' }, { status: 400 })
    if (!customerPhone?.trim()) return NextResponse.json({ error: 'Telefone obrigatório' }, { status: 400 })
    if (!address?.trim()) return NextResponse.json({ error: 'Endereço obrigatório' }, { status: 400 })
    if (!Array.isArray(items) || items.length === 0) return NextResponse.json({ error: 'Pedido sem itens' }, { status: 400 })
    if (!VALID_PAYMENT_METHODS.includes(paymentMethod)) return NextResponse.json({ error: 'Forma de pagamento inválida' }, { status: 400 })
    if (typeof total !== 'number' || total <= 0) return NextResponse.json({ error: 'Total inválido' }, { status: 400 })
    if (typeof subtotal !== 'number' || subtotal <= 0) return NextResponse.json({ error: 'Subtotal inválido' }, { status: 400 })
    for (const item of items) {
      if (!item.productId || typeof item.quantity !== 'number' || item.quantity < 1) {
        return NextResponse.json({ error: 'Item inválido no pedido' }, { status: 400 })
      }
      if (typeof item.price !== 'number' || item.price < 0) {
        return NextResponse.json({ error: 'Preço inválido no pedido' }, { status: 400 })
      }
    }

    const order = await prisma.order.create({
      data: {
        userId: session?.id as string || null,
        customerName: customerName.trim(),
        customerPhone: customerPhone.trim(),
        address: address.trim(),
        subtotal,
        discount: typeof discount === 'number' && discount >= 0 ? discount : 0,
        total,
        paymentMethod,
        couponId: couponId || null,
        notes: notes?.trim() || null,
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
    await writeErrorLog({ description: 'Erro ao criar pedido', entity: 'ORDER', req, error: err })
    return NextResponse.json({ error: 'Erro ao criar pedido' }, { status: 500 })
  }
}
