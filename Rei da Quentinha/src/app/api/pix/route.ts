import { NextResponse } from 'next/server'
import { buildPixPayload } from '@/lib/pix'
import { prisma } from '@/lib/prisma'
import { decrypt } from '@/lib/crypto'
import QRCode from 'qrcode'

const MAX_PIX_AMOUNT = 10000

export async function POST(req: Request) {
  try {
    const { amount, txid } = await req.json()

    // Valida valor: obrigatório, positivo, dentro do limite
    const parsed = parseFloat(amount)
    if (!amount || isNaN(parsed) || parsed <= 0) {
      return NextResponse.json({ error: 'Valor inválido' }, { status: 400 })
    }
    if (parsed > MAX_PIX_AMOUNT) {
      return NextResponse.json({ error: `Valor máximo permitido é R$ ${MAX_PIX_AMOUNT.toLocaleString('pt-BR')}` }, { status: 400 })
    }

    const config = await prisma.configPix.findUnique({ where: { id: 'default' } })
    const key = config?.pixKey ? decrypt(config.pixKey) : (process.env.PIX_KEY || '')
    const name = config?.pixName || process.env.PIX_NAME || 'Rei da Quentinha'
    const city = config?.pixCity || process.env.PIX_CITY || 'Brasil'

    if (!key) {
      return NextResponse.json({ error: 'Chave PIX não configurada' }, { status: 400 })
    }

    const payload = buildPixPayload({ key, name, city, amount: parsed, txid })
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
