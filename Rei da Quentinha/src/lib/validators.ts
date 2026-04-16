export function formatPhone(value: string): string {
  const digits = value.replace(/\D/g, '').slice(0, 11)
  if (digits.length <= 2) return digits
  if (digits.length <= 7) return `(${digits.slice(0, 2)}) ${digits.slice(2)}`
  return `(${digits.slice(0, 2)}) ${digits.slice(2, 7)}-${digits.slice(7)}`
}

export function validatePhone(phone: string): string | null {
  if (!phone.trim()) return 'Celular obrigatório'
  const digits = phone.replace(/\D/g, '')
  if (digits.length !== 11) return 'Celular deve ter 11 dígitos com DDD'
  if (!['6','7','8','9'].includes(digits[2])) return 'Número de celular inválido (deve começar com 6, 7, 8 ou 9)'
  return null
}

export function validateEmail(email: string): string | null {
  if (!email.trim()) return 'E-mail obrigatório'
  const regex = /^[^\s@]+@[^\s@]+\.[^\s@]{2,}$/
  if (!regex.test(email)) return 'E-mail inválido'
  return null
}

export function formatCpfCnpj(value: string): string {
  const digits = value.replace(/\D/g, '')
  if (digits.length <= 11) {
    return digits
      .replace(/(\d{3})(\d)/, '$1.$2')
      .replace(/(\d{3})(\d)/, '$1.$2')
      .replace(/(\d{3})(\d{1,2})$/, '$1-$2')
  }
  return digits
    .replace(/(\d{2})(\d)/, '$1.$2')
    .replace(/(\d{3})(\d)/, '$1.$2')
    .replace(/(\d{3})(\d)/, '$1/$2')
    .replace(/(\d{4})(\d{1,2})$/, '$1-$2')
}

export function validateCPF(cpf: string): boolean {
  const digits = cpf.replace(/\D/g, '')
  if (digits.length !== 11) return false
  if (/^(\d)\1{10}$/.test(digits)) return false
  let sum = 0
  for (let i = 0; i < 9; i++) sum += parseInt(digits[i]) * (10 - i)
  let remainder = (sum * 10) % 11
  if (remainder === 10 || remainder === 11) remainder = 0
  if (remainder !== parseInt(digits[9])) return false
  sum = 0
  for (let i = 0; i < 10; i++) sum += parseInt(digits[i]) * (11 - i)
  remainder = (sum * 10) % 11
  if (remainder === 10 || remainder === 11) remainder = 0
  return remainder === parseInt(digits[10])
}

export function validateCNPJ(cnpj: string): boolean {
  const digits = cnpj.replace(/\D/g, '')
  if (digits.length !== 14) return false
  if (/^(\d)\1{13}$/.test(digits)) return false
  const calc = (d: string, weights: number[]) => {
    const sum = weights.reduce((acc, w, i) => acc + parseInt(d[i]) * w, 0)
    const r = sum % 11
    return r < 2 ? 0 : 11 - r
  }
  const w1 = [5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2]
  const w2 = [6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2]
  return calc(digits, w1) === parseInt(digits[12]) && calc(digits, w2) === parseInt(digits[13])
}

export function validateCpfCnpj(value: string): string | null {
  const digits = value.replace(/\D/g, '')
  if (!digits) return 'CPF ou CNPJ obrigatório'
  if (digits.length <= 11) {
    if (digits.length !== 11) return 'CPF deve ter 11 dígitos'
    if (!validateCPF(digits)) return 'CPF inválido'
  } else {
    if (digits.length !== 14) return 'CNPJ deve ter 14 dígitos'
    if (!validateCNPJ(digits)) return 'CNPJ inválido'
  }
  return null
}
