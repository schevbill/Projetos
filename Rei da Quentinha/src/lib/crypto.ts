import crypto from 'crypto'

const KEY = Buffer.from(process.env.ENCRYPTION_KEY || '', 'hex')

export function encrypt(text: string): string {
  if (!text) return ''
  const iv = crypto.randomBytes(16)
  const cipher = crypto.createCipheriv('aes-256-cbc', KEY, iv)
  const encrypted = Buffer.concat([cipher.update(text, 'utf8'), cipher.final()])
  return iv.toString('hex') + ':' + encrypted.toString('hex')
}

export function decrypt(value: string): string {
  if (!value || !value.includes(':')) return value
  try {
    const [ivHex, encHex] = value.split(':')
    const iv = Buffer.from(ivHex, 'hex')
    const encrypted = Buffer.from(encHex, 'hex')
    const decipher = crypto.createDecipheriv('aes-256-cbc', KEY, iv)
    return Buffer.concat([decipher.update(encrypted), decipher.final()]).toString('utf8')
  } catch {
    return ''
  }
}
