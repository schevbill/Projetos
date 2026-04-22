import { NextResponse } from 'next/server'
import { prisma } from '@/lib/prisma'
import { getSession } from '@/lib/auth'

export async function PUT(req: Request, { params }: { params: Promise<{ id: string }> }) {
  const session = await getSession()
  if (!session) return NextResponse.json({ error: 'Não autorizado' }, { status: 401 })
  const { id } = await params
  const { label, cep, logradouro, numero, complemento, bairro, cidade, estado } = await req.json()

  if (!logradouro?.trim()) return NextResponse.json({ error: 'Logradouro obrigatório' }, { status: 400 })
  if (!numero?.trim()) return NextResponse.json({ error: 'Número obrigatório' }, { status: 400 })
  if (!cidade?.trim()) return NextResponse.json({ error: 'Cidade obrigatória' }, { status: 400 })

  const existing = await prisma.address.findUnique({ where: { id } })
  const isAdmin = (session as { role?: string }).role === 'ADMIN'
  if (!existing || (existing.userId !== session.id && !isAdmin)) {
    return NextResponse.json({ error: 'Não encontrado' }, { status: 404 })
  }

  const address = await prisma.address.update({
    where: { id },
    data: {
      label: label?.trim() || 'Casa',
      cep: cep?.trim() || null,
      logradouro: logradouro.trim(),
      numero: numero.trim(),
      complemento: complemento?.trim() || null,
      bairro: bairro?.trim() || null,
      cidade: cidade.trim(),
      estado: estado?.trim() || null,
    },
  })
  return NextResponse.json(address)
}

export async function DELETE(_req: Request, { params }: { params: Promise<{ id: string }> }) {
  const session = await getSession()
  if (!session) return NextResponse.json({ error: 'Não autorizado' }, { status: 401 })
  const { id } = await params

  const existing = await prisma.address.findUnique({ where: { id } })
  const isAdmin = (session as { role?: string }).role === 'ADMIN'
  if (!existing || (existing.userId !== session.id && !isAdmin)) {
    return NextResponse.json({ error: 'Não encontrado' }, { status: 404 })
  }

  await prisma.address.delete({ where: { id } })
  return NextResponse.json({ ok: true })
}
