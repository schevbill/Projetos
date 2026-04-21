import { prisma } from './prisma'
import { getSession } from './auth'

type Action = 'CREATE' | 'UPDATE' | 'DELETE' | 'LOGIN'
type Entity = 'USER' | 'ORDER' | 'PRODUCT' | 'COUPON' | 'ADDRESS' | 'MOTOBOY' | 'PRINTER' | 'CONFIG' | 'CATEGORY'

interface LogOptions {
  action: Action
  entity: Entity
  entityId?: string
  description: string
  userId?: string
  userName?: string
  userRole?: string
  req?: Request
  before?: Record<string, unknown>
  after?: Record<string, unknown>
}

function getIp(req?: Request): string | undefined {
  if (!req) return undefined
  return req.headers.get('x-forwarded-for')?.split(',')[0].trim()
    || req.headers.get('x-real-ip')
    || undefined
}

export async function writeLog(opts: LogOptions) {
  try {
    await prisma.log.create({
      data: {
        action: opts.action,
        entity: opts.entity,
        entityId: opts.entityId,
        description: opts.description,
        userId: opts.userId,
        userName: opts.userName,
        userRole: opts.userRole,
        ip: opts.req ? getIp(opts.req) : undefined,
        before: opts.before ?? undefined,
        after: opts.after ?? undefined,
      },
    })
  } catch {
    // log failure never breaks the main operation
  }
}

export async function writeLogFromSession(
  opts: Omit<LogOptions, 'userId' | 'userName' | 'userRole'>
) {
  try {
    const session = await getSession()
    await writeLog({
      ...opts,
      userId: session?.id as string | undefined,
      userName: session?.name as string | undefined,
      userRole: session?.role as string | undefined,
    })
  } catch {
    // silently ignore
  }
}
