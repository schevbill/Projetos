import { NextResponse } from 'next/server'
import { prisma } from '@/lib/prisma'
import { requireAdmin, getSession } from '@/lib/auth'
import { printToThermal } from '@/lib/print'
import { writeLogFromSession, writeErrorLog } from '@/lib/logger'
import { sendOrderStatusEmail } from '@/lib/email'

export async function GET(req: Request, { params }: { params: Promise<{ id: string }> }) {
  const { id } = await params
  const order = await prisma.order.findUnique({
    where: { id },
    include: { items: { include: { product: true } }, motoboy: true, coupon: true },
  })
  if (!order) return NextResponse.json({ error: 'Not found' }, { status: 404 })

  // IDOR: se há sessão e o usuário não é admin, só pode ver os próprios pedidos
  const session = await getSession()
  if (session && session.role !== 'ADMIN') {
    if (order.userId && order.userId !== session.id) {
      return NextResponse.json({ error: 'Não autorizado' }, { status: 403 })
    }
  }

  return NextResponse.json(order)
}

export async function PATCH(req: Request, { params }: { params: Promise<{ id: string }> }) {
  try {
    await requireAdmin()
    const { id } = await params
    const data = await req.json()

    const prev = await prisma.order.findUnique({
      where: { id },
      select: { status: true, paymentStatus: true, motoboyId: true, notes: true },
    })

    const order = await prisma.order.update({
      where: { id },
      data,
      include: {
        items: { include: { product: true } },
        motoboy: true,
        user: { select: { email: true } },
      },
    })

    const fields = Object.keys(data).join(', ')
    await writeLogFromSession({
      action: 'UPDATE', entity: 'ORDER', entityId: id,
      description: `Pedido #${id.slice(-6).toUpperCase()} atualizado — ${fields}`,
      before: prev ?? undefined,
      after: Object.fromEntries(Object.keys(data).map(k => [k, (order as Record<string, unknown>)[k]])),
      req,
    })

    // Envia email ao cliente quando status ou pagamento muda
    const customerEmail = order.user?.email
    if (customerEmail) {
      const emailData = {
        orderId: order.id,
        customerName: order.customerName,
        customerEmail,
        items: order.items.map(i => ({ name: i.product.name, quantity: i.quantity, price: i.price })),
        subtotal: order.subtotal,
        discount: order.discount,
        total: order.total,
        paymentMethod: order.paymentMethod,
        paymentStatus: order.paymentStatus,
        address: order.address,
        motoboyName: order.motoboy?.name ?? null,
        createdAt: order.createdAt,
      }

      if (data.status && data.status !== prev?.status) {
        sendOrderStatusEmail(data.status, emailData, false).catch(err =>
          console.error('[email] Erro ao enviar email de status:', err)
        )
      }

      if (data.paymentStatus && data.paymentStatus !== prev?.paymentStatus) {
        sendOrderStatusEmail(data.paymentStatus, emailData, true).catch(err =>
          console.error('[email] Erro ao enviar email de pagamento:', err)
        )
      }
    }

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
  } catch (err) {
    const { id } = await params
    await writeErrorLog({ description: `Erro ao atualizar pedido #${id.slice(-6).toUpperCase()}`, entity: 'ORDER', entityId: id, req, error: err })
    return NextResponse.json({ error: 'Erro' }, { status: 400 })
  }
}
