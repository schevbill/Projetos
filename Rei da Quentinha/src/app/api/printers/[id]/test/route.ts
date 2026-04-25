import { NextResponse } from 'next/server'
import { prisma } from '@/lib/prisma'
import { requireAdmin } from '@/lib/auth'
import { printToThermal } from '@/lib/print'

export async function POST(_req: Request, { params }: { params: Promise<{ id: string }> }) {
  try {
    await requireAdmin()
    const { id } = await params

    const printer = await prisma.printer.findUnique({ where: { id } })
    if (!printer) return NextResponse.json({ error: 'Impressora não encontrada' }, { status: 404 })
    if (!printer.ip) return NextResponse.json({ error: 'IP da impressora não configurado' }, { status: 400 })

    await printToThermal(
      { ip: printer.ip, port: printer.port ?? 9100 },
      {
        orderId: 'TESTE00001',
        customerName: 'Teste de Impressão',
        customerPhone: '(11) 99999-9999',
        address: 'Rua de Teste, 123 — Bairro Centro',
        items: [
          { name: 'Marmita Teste', quantity: 1, price: 0 },
        ],
        total: 0,
        paymentMethod: 'TESTE',
        createdAt: new Date(),
      },
      'receipt'
    )

    return NextResponse.json({ ok: true })
  } catch (err) {
    const msg = err instanceof Error ? err.message : 'Erro ao conectar na impressora'
    return NextResponse.json({ error: msg }, { status: 500 })
  }
}
