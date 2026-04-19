import { NextResponse } from 'next/server'
import { requireAdmin } from '@/lib/auth'
import { prisma } from '@/lib/prisma'

async function getConfig() {
  return prisma.configPix.upsert({
    where: { id: 'default' },
    update: {},
    create: {
      id: 'default',
      pixKey: process.env.PIX_KEY || '',
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
      pixKey: config.pixKey,
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
    await prisma.configPix.upsert({
      where: { id: 'default' },
      update: { pixKey, pixName, pixCity },
      create: { id: 'default', pixKey, pixName, pixCity },
    })
    process.env.PIX_KEY = pixKey
    process.env.PIX_NAME = pixName
    process.env.PIX_CITY = pixCity
    return NextResponse.json({ ok: true })
  } catch (err) {
    console.error(err)
    return NextResponse.json({ error: 'Erro ao salvar' }, { status: 500 })
  }
}
