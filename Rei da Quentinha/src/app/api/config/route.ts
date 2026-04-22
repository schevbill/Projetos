import { NextResponse } from 'next/server'
import { requireAdmin } from '@/lib/auth'
import { prisma } from '@/lib/prisma'
import { writeLogFromSession } from '@/lib/logger'
import { encrypt, decrypt } from '@/lib/crypto'

async function getConfig() {
  return prisma.configPix.upsert({
    where: { id: 'default' },
    update: {},
    create: {
      id: 'default',
      pixKey: process.env.PIX_KEY ? encrypt(process.env.PIX_KEY) : '',
      pixName: process.env.PIX_NAME || '',
      pixCity: process.env.PIX_CITY || '',
    },
  })
}

export async function GET() {
  try {
    await requireAdmin()
    const config = await getConfig()
    return NextResponse.json({
      pixKey: decrypt(config.pixKey),
      pixName: config.pixName,
      pixCity: config.pixCity,
    })
  } catch {
    return NextResponse.json({ error: 'Não autorizado' }, { status: 401 })
  }
}

export async function POST(req: Request) {
  try {
    await requireAdmin()
    const { pixKey, pixName, pixCity } = await req.json()

    if (!pixKey?.trim()) return NextResponse.json({ error: 'Chave PIX obrigatória' }, { status: 400 })
    if (!pixName?.trim()) return NextResponse.json({ error: 'Nome do recebedor obrigatório' }, { status: 400 })
    if (!pixCity?.trim()) return NextResponse.json({ error: 'Cidade obrigatória' }, { status: 400 })

    const prev = await prisma.configPix.findUnique({
      where: { id: 'default' },
      select: { pixKey: true, pixName: true, pixCity: true },
    })

    await prisma.configPix.upsert({
      where: { id: 'default' },
      update: { pixKey: encrypt(pixKey), pixName, pixCity },
      create: { id: 'default', pixKey: encrypt(pixKey), pixName, pixCity },
    })

    await writeLogFromSession({
      action: 'UPDATE', entity: 'CONFIG', entityId: 'pix',
      description: 'Configurações PIX atualizadas',
      before: prev ? { pixKey: '***', pixName: prev.pixName, pixCity: prev.pixCity } : undefined,
      after: { pixKey: '***', pixName, pixCity },
      req,
    })

    return NextResponse.json({ ok: true })
  } catch (err) {
    console.error(err)
    return NextResponse.json({ error: 'Erro ao salvar' }, { status: 500 })
  }
}
