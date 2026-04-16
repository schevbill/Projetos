import { NextResponse } from 'next/server'
import { buildPixPayload } from '@/lib/pix'
import QRCode from 'qrcode'

export async function POST(req: Request) {
  try {
    const { amount, txid } = await req.json()

    const key = process.env.PIX_KEY || ''
    const name = process.env.PIX_NAME || 'Rei da Quentinha'
    const city = process.env.PIX_CITY || 'Brasil'

    if (!key) {
      return NextResponse.json({ error: 'Chave PIX não configurada' }, { status: 400 })
    }

    const payload = buildPixPayload({ key, name, city, amount, txid })
    const qrCodeBase64 = await QRCode.toDataURL(payload, {
      errorCorrectionLevel: 'M',
      margin: 2,
      width: 300,
      color: { dark: '#1a1a1a', light: '#ffffff' },
    })

    return NextResponse.json({ payload, qrCode: qrCodeBase64 })
  } catch (err) {
    console.error(err)
    return NextResponse.json({ error: 'Erro ao gerar PIX' }, { status: 500 })
  }
}
