import { prisma } from '@/lib/prisma'
import Navbar from '@/components/Navbar'
import ProductCard from '@/components/ProductCard'
import { UtensilsCrossed, Clock, MapPin, Star } from 'lucide-react'

export const dynamic = 'force-dynamic'

export default async function HomePage() {
  const products = await prisma.product.findMany({
    orderBy: { createdAt: 'asc' },
  })

  const categories = [...new Set(products.map(p => p.category).filter(Boolean))]

  return (
    <div className="min-h-screen">
      <Navbar />

      {/* Hero */}
      <section className="bg-gradient-to-r from-orange-500 to-orange-600 text-white py-16">
        <div className="max-w-6xl mx-auto px-4 text-center">
          <div className="flex justify-center mb-4">
            <UtensilsCrossed size={56} className="text-orange-100" />
          </div>
          <h1 className="text-4xl md:text-5xl font-bold mb-4">Marmitas Deliciosas</h1>
          <p className="text-orange-100 text-lg mb-8">Feitas com amor, entregues com rapidez</p>
          <div className="flex flex-wrap justify-center gap-6 text-sm">
            <div className="flex items-center gap-2">
              <Clock size={18} />
              <span>Entrega em 45 min</span>
            </div>
            <div className="flex items-center gap-2">
              <MapPin size={18} />
              <span>Entrega na sua casa</span>
            </div>
            <div className="flex items-center gap-2">
              <Star size={18} />
              <span>4.9 ★ avaliações</span>
            </div>
          </div>
        </div>
      </section>

      {/* Products */}
      <main className="max-w-6xl mx-auto px-4 py-12">
        {products.length === 0 ? (
          <div className="text-center py-20 text-gray-400">
            <UtensilsCrossed size={48} className="mx-auto mb-4" />
            <p className="text-xl">Cardápio em breve!</p>
          </div>
        ) : (
          <>
            {categories.length > 0 ? (
              categories.map(category => {
                const catProducts = products.filter(p => p.category === category)
                return (
                  <section key={category} className="mb-10">
                    <h2 className="text-2xl font-bold text-gray-800 mb-4 flex items-center gap-2">
                      <span className="w-1 h-6 bg-orange-500 rounded-full inline-block"></span>
                      {category}
                    </h2>
                    <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
                      {catProducts.map(product => (
                        <ProductCard key={product.id} product={product} />
                      ))}
                    </div>
                  </section>
                )
              })
            ) : (
              <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
                {products.map(product => (
                  <ProductCard key={product.id} product={product} />
                ))}
              </div>
            )}
          </>
        )}
      </main>

      <footer className="bg-gray-800 text-gray-400 text-center py-6 text-sm">
        <p>© 2024 Rei da Quentinha — Todos os direitos reservados</p>
      </footer>
    </div>
  )
}
