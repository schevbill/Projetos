import { NextResponse } from 'next/server'
import { requireAdmin } from '@/lib/auth'
import fs from 'fs'
import path from 'path'

const envPath = path.resolve(process.cwd(), '.env')

function readEnv(): Record<string, string> {
  const content = fs.readFileSync(envPath, 'utf-8')
  const result: Record<string, string> = {}
  for (const line of content.split('\n')) {
    const match = line.match(/^([^#=]+)=(.*)$/)
    if (match) result[match[1].trim()] = match[2].replace(/^"|"$/g, '').trim()
  }
  return result
}

function writeEnvKey(key: string, value: string) {
  let content = fs.readFileSync(envPath, 'utf-8')
  const regex = new RegExp(`^${key}=.*$`, 'm')
  const newLine = `${key}="${value}"`
  if (regex.test(content)) {
    content = content.replace(regex, newLine)
  } else {
    content += `\n${newLine}`
  }
  fs.writeFileSync(envPath, content)
}

export async function GET() {
  try {
    await requireAdmin()
    const env = readEnv()
    return NextResponse.json({
      pixKey: env.PIX_KEY || '',
      pixName: env.PIX_NAME || '',
      pixCity: env.PIX_CITY || '',
    })
  } catch {
    return NextResponse.json({ error: 'Não autorizado' }, { status: 401 })
  }
}

export async function POST(req: Request) {
  try {
    await requireAdmin()
    const { pixKey, pixName, pixCity } = await req.json()
    writeEnvKey('PIX_KEY', pixKey)
    writeEnvKey('PIX_NAME', pixName)
    writeEnvKey('PIX_CITY', pixCity)
    process.env.PIX_KEY = pixKey
    process.env.PIX_NAME = pixName
    process.env.PIX_CITY = pixCity
    return NextResponse.json({ ok: true })
  } catch (err) {
    console.error(err)
    return NextResponse.json({ error: 'Erro ao salvar' }, { status: 500 })
  }
}
