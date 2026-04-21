import { NextResponse } from 'next/server'
import { requireAdmin } from '@/lib/auth'
import { prisma } from '@/lib/prisma'
import { encrypt, decrypt } from '@/lib/crypto'
import { writeLogFromSession } from '@/lib/logger'

async function getConfig() {
  return prisma.configEmail.upsert({
    where: { id: 'default' },
    update: {},
    create: { id: 'default' },
  })
}

export async function GET() {
  try {
    await requireAdmin()
    const config = await getConfig()
    return NextResponse.json({
      host: config.host,
      port: config.port,
      user: config.user,
      pass: decrypt(config.pass),
      from: config.from,
      active: config.active,
    })
  } catch {
    return NextResponse.json({ error: 'Não autorizado' }, { status: 401 })
  }
}

export async function POST(req: Request) {
  try {
    await requireAdmin()
    const { host, port, user, pass, from, active } = await req.json()

    const prev = await prisma.configEmail.findUnique({
      where: { id: 'default' },
      select: { host: true, port: true, user: true, from: true, active: true },
    })

    await prisma.configEmail.upsert({
      where: { id: 'default' },
      update: { host, port: Number(port), user, pass: encrypt(pass), from, active },
      create: { id: 'default', host, port: Number(port), user, pass: encrypt(pass), from, active },
    })

    await writeLogFromSession({
      action: 'UPDATE', entity: 'CONFIG', entityId: 'email',
      description: 'Configurações de e-mail atualizadas',
      before: prev ?? undefined,
      after: { host, port: Number(port), user, from, active },
      req,
    })

    return NextResponse.json({ ok: true })
  } catch (err) {
    console.error(err)
    return NextResponse.json({ error: 'Erro ao salvar' }, { status: 500 })
  }
}
