import { NextResponse } from 'next/server'
import { requireAdmin, getSession } from '@/lib/auth'
import { sendTestEmail } from '@/lib/email'

export async function POST() {
  try {
    await requireAdmin()
    const session = await getSession()
    const email = session?.email as string
    if (!email) return NextResponse.json({ error: 'Sessão inválida' }, { status: 400 })
    await sendTestEmail(email)
    return NextResponse.json({ ok: true, sentTo: email })
  } catch (err: any) {
    console.error('[test email]', err)
    const message = err?.message || 'Erro ao enviar'
    const detail = err?.response || err?.code || ''
    return NextResponse.json({ error: message, detail }, { status: 500 })
  }
}
