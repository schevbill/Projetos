import { NextResponse } from 'next/server'
import { prisma } from '@/lib/prisma'
import { getSession } from '@/lib/auth'

export async function GET(req: Request) {
  const session = await getSession()
  if (!session) return NextResponse.json({ error: 'Não autorizado' }, { status: 401 })
  const { searchParams } = new URL(req.url)
  const queryUserId = searchParams.get('userId')
  const isAdmin = (session as { role?: string }).role === 'ADMIN'
  const userId = (isAdmin && queryUserId) ? queryUserId : session.id as string
  const addresses = await prisma.address.findMany({
    where: { userId },
    orderBy: { createdAt: 'asc' },
  })
  return NextResponse.json(addresses)
}

export async function POST(req: Request) {
  const session = await getSession()
  if (!session) return NextResponse.json({ error: 'Não autorizado' }, { status: 401 })
  const { label, cep, logradouro, numero, complemento, bairro, cidade, estado, userId: targetUserId } = await req.json()
  if (!logradouro || !numero || !cidade) {
    return NextResponse.json({ error: 'Preencha rua, número e cidade' }, { status: 400 })
  }
  // Admins can create addresses for a specific user; otherwise use own session
  const isAdmin = (session as { role?: string }).role === 'ADMIN'
  const userId = (isAdmin && targetUserId) ? targetUserId : session.id as string
  const address = await prisma.address.create({
    data: {
      userId,
      label: label || 'Casa',
      cep: cep || null,
      logradouro,
      numero,
      complemento: complemento || null,
      bairro: bairro || null,
      cidade,
      estado: estado || null,
    },
  })
  return NextResponse.json(address)
}
