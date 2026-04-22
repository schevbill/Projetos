import { NextResponse } from 'next/server'
import { cookies } from 'next/headers'
import { prisma } from '@/lib/prisma'
import { getSession } from '@/lib/auth'

export async function POST() {
  try {
    const session = await getSession()
    if (session?.id) {
      await prisma.user.update({
        where: { id: session.id as string },
        data: { sessionToken: null, sessionExpiresAt: null },
      })
    }
  } catch { /* ignora erros ao limpar sessão */ }

  const cookieStore = await cookies()
  cookieStore.delete('auth-token')
  return NextResponse.json({ ok: true })
}
