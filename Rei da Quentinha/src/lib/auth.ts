import { SignJWT, jwtVerify } from 'jose'
import { cookies } from 'next/headers'
import { prisma } from '@/lib/prisma'

if (!process.env.JWT_SECRET) throw new Error('JWT_SECRET não definido no ambiente')
const secret = new TextEncoder().encode(process.env.JWT_SECRET)

const SESSION_MINUTES = 40

export async function signToken(payload: Record<string, unknown>) {
  return await new SignJWT(payload)
    .setProtectedHeader({ alg: 'HS256' })
    .setExpirationTime('7d')
    .sign(secret)
}

export async function verifyToken(token: string) {
  try {
    const { payload } = await jwtVerify(token, secret)
    return payload
  } catch {
    return null
  }
}

export async function getSession() {
  const cookieStore = await cookies()
  const token = cookieStore.get('auth-token')?.value
  if (!token) return null

  const payload = await verifyToken(token)
  if (!payload?.id || !payload?.sessionToken) return null

  const now = new Date()
  const user = await prisma.user.findUnique({
    where: { id: payload.id as string },
    select: { id: true, role: true, sessionToken: true, sessionExpiresAt: true },
  })

  if (!user) return null
  if (user.sessionToken !== payload.sessionToken) return null
  if (!user.sessionExpiresAt || user.sessionExpiresAt < now) return null

  // Renova o prazo de inatividade a cada requisição
  await prisma.user.update({
    where: { id: user.id },
    data: { sessionExpiresAt: new Date(now.getTime() + SESSION_MINUTES * 60 * 1000) },
  })

  return payload
}

export async function requireAdmin() {
  const session = await getSession()
  if (!session || session.role !== 'ADMIN') {
    throw new Error('Unauthorized')
  }
  return session
}
