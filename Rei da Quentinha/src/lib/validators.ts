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

// Detecta se o valor é um CNPJ alfanumérico (contém letras nos 12 primeiros chars)
function isAlphanumericCNPJ(raw: string): boolean {
  const clean = raw.replace(/[.\-\/]/g, '').toUpperCase()
  return clean.length > 11 && /[A-Z]/.test(clean.slice(0, 12))
}

export function formatCpfCnpj(value: string): string {
  // CNPJ alfanumérico: mantém letras, remove apenas pontuação
  const upper = value.toUpperCase()
  if (isAlphanumericCNPJ(upper)) {
    const clean = upper.replace(/[.\-\/]/g, '').replace(/[^A-Z0-9]/g, '').slice(0, 14)
    if (clean.length <= 2) return clean
    if (clean.length <= 5) return `${clean.slice(0, 2)}.${clean.slice(2)}`
    if (clean.length <= 8) return `${clean.slice(0, 2)}.${clean.slice(2, 5)}.${clean.slice(5)}`
    if (clean.length <= 12) return `${clean.slice(0, 2)}.${clean.slice(2, 5)}.${clean.slice(5, 8)}/${clean.slice(8)}`
    return `${clean.slice(0, 2)}.${clean.slice(2, 5)}.${clean.slice(5, 8)}/${clean.slice(8, 12)}-${clean.slice(12)}`
  }
  // CPF ou CNPJ numérico clássico
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

// Converte caractere alfanumérico para valor numérico: 0-9 → 0-9, A-Z → 17-42 (spec Receita Federal)
function charValue(c: string): number {
  const code = c.charCodeAt(0)
  if (code >= 48 && code <= 57) return code - 48       // '0'-'9'
  if (code >= 65 && code <= 90) return code - 65 + 17  // 'A'-'Z' → 17-42
  return 0
}

export function validateCNPJ(cnpj: string): boolean {
  const clean = cnpj.replace(/[.\-\/]/g, '').toUpperCase().replace(/[^A-Z0-9]/g, '')
  if (clean.length !== 14) return false
  // Rejeita sequências repetidas apenas para CNPJ numérico puro
  if (/^(\d)\1{13}$/.test(clean)) return false
  const calc = (str: string, weights: number[]) => {
    const sum = weights.reduce((acc, w, i) => acc + charValue(str[i]) * w, 0)
    const r = sum % 11
    return r < 2 ? 0 : 11 - r
  }
  const w1 = [5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2]
  const w2 = [6, 5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2]
  return calc(clean, w1) === parseInt(clean[12]) && calc(clean, w2) === parseInt(clean[13])
}

export interface PasswordRules {
  minLength: boolean
  hasUpper: boolean
  hasNumber: boolean
  hasSpecial: boolean
}

export function checkPasswordRules(password: string): PasswordRules {
  return {
    minLength: password.length >= 8,
    hasUpper: /[A-Z]/.test(password),
    hasNumber: /[0-9]/.test(password),
    hasSpecial: /[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]/.test(password),
  }
}

export function validatePassword(password: string): string | null {
  if (!password) return 'Senha obrigatória'
  const rules = checkPasswordRules(password)
  if (!rules.minLength) return 'Senha deve ter pelo menos 8 caracteres'
  if (!rules.hasUpper) return 'Senha deve conter ao menos uma letra maiúscula'
  if (!rules.hasNumber) return 'Senha deve conter ao menos um número'
  if (!rules.hasSpecial) return 'Senha deve conter ao menos um caractere especial'
  return null
}

export function validateCpfCnpj(value: string): string | null {
  if (!value.trim()) return 'CPF ou CNPJ obrigatório'
  const clean = value.replace(/[.\-\/]/g, '').replace(/[^A-Z0-9]/gi, '').toUpperCase()
  const hasLetters = /[A-Z]/.test(clean)
  if (hasLetters) {
    // Sempre CNPJ alfanumérico
    if (clean.length !== 14) return 'CNPJ deve ter 14 caracteres'
    if (!validateCNPJ(clean)) return 'CNPJ inválido'
  } else {
    const digits = clean
    if (digits.length <= 11) {
      if (digits.length !== 11) return 'CPF deve ter 11 dígitos'
      if (!validateCPF(digits)) return 'CPF inválido'
    } else {
      if (digits.length !== 14) return 'CNPJ deve ter 14 dígitos'
      if (!validateCNPJ(digits)) return 'CNPJ inválido'
    }
  }
  return null
}
