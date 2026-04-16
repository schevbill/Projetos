import { PrismaClient } from '@prisma/client'
import bcrypt from 'bcryptjs'

const prisma = new PrismaClient()

async function main() {
  const adminPassword = await bcrypt.hash('admin123', 10)
  await prisma.user.upsert({
    where: { email: 'admin@rei-da-quentinha.com' },
    update: {},
    create: {
      name: 'Administrador',
      email: 'admin@rei-da-quentinha.com',
      password: adminPassword,
      role: 'ADMIN',
    },
  })

  const products = [
    { name: 'Marmita Fitness', description: 'Frango grelhado, arroz integral, brócolis e cenoura', price: 18.90, category: 'Fitness' },
    { name: 'Marmita Tradicional', description: 'Bife acebolado, arroz, feijão e farofa', price: 16.90, category: 'Tradicional' },
    { name: 'Marmita Vegetariana', description: 'Proteína de soja, legumes salteados, arroz e salada', price: 15.90, category: 'Vegetariana' },
    { name: 'Marmita Executive', description: 'Filé mignon, arroz branco, purê de batata e legumes', price: 24.90, category: 'Premium' },
    { name: 'Marmita Kids', description: 'Frango desfiado, macarrão e legumes', price: 12.90, category: 'Kids' },
  ]

  for (const product of products) {
    await prisma.product.upsert({
      where: { id: product.name.toLowerCase().replace(/ /g, '-') },
      update: {},
      create: { ...product, id: product.name.toLowerCase().replace(/ /g, '-') },
    })
  }

  await prisma.coupon.upsert({
    where: { code: 'BEMVINDO10' },
    update: {},
    create: {
      code: 'BEMVINDO10',
      discount: 10,
      type: 'PERCENTAGE',
      maxUses: 100,
      active: true,
    },
  })

  console.log('Seed concluído!')
}

main()
  .catch(console.error)
  .finally(() => prisma.$disconnect())
