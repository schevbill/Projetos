function tlv(id: string, value: string): string {
  const len = value.length.toString().padStart(2, '0')
  return `${id}${len}${value}`
}

function crc16(str: string): string {
  let crc = 0xffff
  for (let i = 0; i < str.length; i++) {
    crc ^= str.charCodeAt(i) << 8
    for (let j = 0; j < 8; j++) {
      crc = crc & 0x8000 ? (crc << 1) ^ 0x1021 : crc << 1
    }
  }
  return (crc & 0xffff).toString(16).toUpperCase().padStart(4, '0')
}

function sanitize(str: string) {
  return str.normalize('NFD').replace(/[\u0300-\u036f]/g, '').replace(/[^a-zA-Z0-9 ]/g, '').trim()
}

export function buildPixPayload(params: {
  key: string
  name: string
  city: string
  amount: number
  txid?: string
}): string {
  const { key, name, city, amount, txid = '***' } = params

  const merchantAccountInfo =
    tlv('00', 'BR.GOV.BCB.PIX') +
    tlv('01', key)

  const additionalData = tlv('05', txid.slice(0, 25).replace(/[^a-zA-Z0-9]/g, 'X') || 'MARMITASHOP')

  let payload = ''
  payload += tlv('00', '01')
  payload += tlv('26', merchantAccountInfo)
  payload += tlv('52', '0000')
  payload += tlv('53', '986')
  payload += tlv('54', amount.toFixed(2))
  payload += tlv('58', 'BR')
  payload += tlv('59', sanitize(name).slice(0, 25))
  payload += tlv('60', sanitize(city).slice(0, 15))
  payload += tlv('62', additionalData)
  payload += '6304'

  return payload + crc16(payload)
}
