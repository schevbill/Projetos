import { NextResponse } from 'next/server'
import { prisma } from '@/lib/prisma'
import { requireAdmin } from '@/lib/auth'
import { writeLogFromSession } from '@/lib/logger'

// Rate limiting para consulta de cupons (evita brute-force de códigos)
const couponAttempts = new Map<string, { count: number; resetAt: number }>()
const COUPON_MAX = 20
const COUPON_WINDOW_MS = 60 * 1000

function getIp(req: Request) {
  return req.headers.get('x-forwarded-for')?.split(',')[0].trim() ?? 'unknown'
}

export async function GET(req: Request, { params }: { params: Promise<{ code: string }> }) {
  const ip = getIp(req)
  const now = Date.now()
  const entry = couponAttempts.get(ip)
  if (entry && now < entry.resetAt) {
    if (entry.count >= COUPON_MAX) {
      return NextResponse.json({ error: 'Muitas tentativas. Aguarde um momento.' }, { status: 429 })
    }
    entry.count++
  } else {
    couponAttempts.set(ip, { count: 1, resetAt: now + COUPON_WINDOW_MS })
  }

  const { code } = await params
  const coupon = await prisma.coupon.findUnique({ where: { code: code.toUpperCase() } })
  if (!coupon || !coupon.active) return NextResponse.json({ error: 'Cupom inválido' }, { status: 404 })
  if (coupon.expiresAt && new Date(coupon.expiresAt) < new Date()) {
    return NextResponse.json({ error: 'Cupom expirado' }, { status: 400 })
  }
  if (coupon.maxUses && coupon.uses >= coupon.maxUses) {
    return NextResponse.json({ error: 'Cupom esgotado' }, { status: 400 })
  }
  return NextResponse.json({ id: coupon.id, discount: coupon.discount, type: coupon.type })
}

export async function PUT(req: Request, { params }: { params: Promise<{ code: string }> }) {
  try {
    await requireAdmin()
    const { code } = await params
    const body = await req.json()
    const { discount, type, maxUses, expiresAt, active } = body

    const prev = await prisma.coupon.findUnique({
      where: { code },
      select: { code: true, discount: true, type: true, maxUses: true, expiresAt: true, active: true },
    })
    if (!prev) return NextResponse.json({ error: 'Cupom não encontrado' }, { status: 404 })

    if (discount !== undefined && (typeof discount !== 'number' || discount < 0)) {
      return NextResponse.json({ error: 'Desconto inválido' }, { status: 400 })
    }

    const coupon = await prisma.coupon.update({
      where: { code },
      data: {
        ...(discount !== undefined && { discount }),
        ...(type !== undefined && { type }),
        ...(maxUses !== undefined && { maxUses: maxUses || null }),
        ...(expiresAt !== undefined && { expiresAt: expiresAt ? new Date(expiresAt) : null }),
        ...(active !== undefined && { active }),
      },
    })

    await writeLogFromSession({
      action: 'UPDATE', entity: 'COUPON', entityId: coupon.id,
      description: `Cupom editado: ${code}`,
      before: prev ? { ...prev, expiresAt: prev.expiresAt?.toISOString() ?? null } : undefined,
      after: { discount, type, maxUses, expiresAt, active },
      req,
    })
    return NextResponse.json(coupon)
  } catch {
    return NextResponse.json({ error: 'Erro' }, { status: 400 })
  }
}

export async function DELETE(req: Request, { params }: { params: Promise<{ code: string }> }) {
  try {
    await requireAdmin()
    const { code } = await params
    await prisma.coupon.delete({ where: { code } })
    await writeLogFromSession({ action: 'DELETE', entity: 'COUPON', entityId: code, description: `Cupom excluído: ${code}`, req })
    return NextResponse.json({ ok: true })
  } catch {
    return NextResponse.json({ error: 'Erro' }, { status: 400 })
  }
}
