import net from 'net'

export interface PrinterConfig {
  ip: string
  port: number
}

export interface LabelData {
  orderId: string
  customerName: string
  customerPhone: string
  address: string
  items: { name: string; quantity: number; price: number }[]
  total: number
  paymentMethod: string
  change?: number
  createdAt: Date
}

function formatCurrency(value: number) {
  return value.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' })
}

function buildEscPosReceipt(data: LabelData): Buffer {
  const ESC = 0x1b
  const GS = 0x1d
  const commands: number[] = []

  const write = (text: string) => {
    for (const char of text) commands.push(char.charCodeAt(0))
  }
  const writeln = (text: string) => { write(text); commands.push(0x0a) }
  const separator = () => writeln('--------------------------------')

  commands.push(ESC, 0x40)
  commands.push(ESC, 0x61, 0x01)
  commands.push(ESC, 0x45, 0x01)
  writeln('REI DA QUENTINHA')
  commands.push(ESC, 0x45, 0x00)
  writeln(`Pedido #${data.orderId.slice(-6).toUpperCase()}`)
  writeln(new Date(data.createdAt).toLocaleString('pt-BR'))
  separator()

  commands.push(ESC, 0x61, 0x00)
  writeln(`Cliente: ${data.customerName}`)
  writeln(`Fone: ${data.customerPhone}`)
  writeln(`Endereco:`)
  writeln(data.address)
  separator()

  writeln('ITENS DO PEDIDO:')
  for (const item of data.items) {
    const line = `${item.quantity}x ${item.name}`
    const price = formatCurrency(item.price * item.quantity)
    const spaces = 32 - line.length - price.length
    writeln(line + ' '.repeat(Math.max(1, spaces)) + price)
  }
  separator()

  commands.push(ESC, 0x45, 0x01)
  const totalLine = 'TOTAL:'
  const totalValue = formatCurrency(data.total)
  writeln(totalLine + ' '.repeat(32 - totalLine.length - totalValue.length) + totalValue)
  commands.push(ESC, 0x45, 0x00)

  writeln(`Pagamento: ${data.paymentMethod}`)
  if (data.change && data.change > 0) {
    writeln(`Troco para: ${formatCurrency(data.change + data.total)}`)
    writeln(`Troco: ${formatCurrency(data.change)}`)
  }
  separator()

  commands.push(ESC, 0x61, 0x01)
  writeln('Obrigado pela preferencia!')
  writeln('')
  writeln('')
  writeln('')

  commands.push(GS, 0x56, 0x41, 0x10)

  return Buffer.from(commands)
}

function buildEscPosLabel(data: LabelData): Buffer {
  const ESC = 0x1b
  const commands: number[] = []

  const write = (text: string) => {
    for (const char of text) commands.push(char.charCodeAt(0))
  }
  const writeln = (text: string) => { write(text); commands.push(0x0a) }

  commands.push(ESC, 0x40)
  commands.push(ESC, 0x61, 0x01)
  commands.push(ESC, 0x4d, 0x01)
  writeln(`#${data.orderId.slice(-6).toUpperCase()}`)
  commands.push(ESC, 0x4d, 0x00)
  writeln(data.customerName)
  writeln(data.customerPhone)
  writeln(data.address)
  writeln('---')
  for (const item of data.items) {
    writeln(`${item.quantity}x ${item.name}`)
  }
  writeln('---')
  writeln(`TOTAL: ${formatCurrency(data.total)}`)
  writeln(data.paymentMethod)
  writeln('')

  return Buffer.from(commands)
}

export async function printToThermal(config: PrinterConfig, data: LabelData, type: 'label' | 'receipt' = 'receipt'): Promise<void> {
  return new Promise((resolve, reject) => {
    const client = new net.Socket()
    const buffer = type === 'label' ? buildEscPosLabel(data) : buildEscPosReceipt(data)

    client.connect(config.port, config.ip, () => {
      client.write(buffer, (err) => {
        if (err) {
          client.destroy()
          reject(err)
        } else {
          setTimeout(() => {
            client.destroy()
            resolve()
          }, 500)
        }
      })
    })

    client.on('error', (err) => {
      reject(err)
    })

    client.setTimeout(5000, () => {
      client.destroy()
      reject(new Error('Timeout ao conectar na impressora'))
    })
  })
}
