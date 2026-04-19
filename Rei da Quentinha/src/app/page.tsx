import { prisma } from '@/lib/prisma'
import Navbar from '@/components/Navbar'
import ProductCard from '@/components/ProductCard'
import { Flame, Clock, MapPin, Star, ChevronRight } from 'lucide-react'

export const dynamic = 'force-dynamic'

export default async function HomePage() {
  const products = await prisma.product.findMany({
    orderBy: { createdAt: 'asc' },
    include: { categoryRel: true },
  })

  const categories = [...new Set(products.map(p => p.categoryRel?.name || p.category).filter(Boolean))]

  return (
    <div className="min-h-screen bg-cream">
      <Navbar />

      {/* Hero */}
      <section className="relative overflow-hidden bg-gray-950">
        <div className="absolute inset-0 bg-gradient-to-r from-brand-900/80 via-gray-950/60 to-gray-950 z-10" />
        <div className="absolute inset-0 bg-[url('https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=1400&q=80')] bg-cover bg-center opacity-30" />
        <div className="relative z-20 max-w-6xl mx-auto px-4 py-20 md:py-28">
          <div className="max-w-xl">
            <div className="flex items-center gap-2 mb-4">
              <span className="bg-brand-600 text-white px-3 py-1 rounded-full text-xs font-bold uppercase tracking-widest flex items-center gap-1">
                <Flame size={12} /> Aberto Agora
              </span>
            </div>
            <h1 className="text-4xl md:text-6xl font-extrabold text-white leading-tight mb-4">
              Marmitas <span className="text-brand-400">Deliciosas</span><br />
              na sua porta
            </h1>
            <p className="text-gray-300 text-lg mb-8">
              Feitas com carinho, tempero de verdade e entrega rápida.
            </p>
            <div className="flex flex-wrap gap-4 text-sm text-gray-400">
              <div className="flex items-center gap-2 bg-white/10 rounded-full px-4 py-2">
                <Clock size={16} className="text-gold-400" />
                <span>Entrega em ~45 min</span>
              </div>
              <div className="flex items-center gap-2 bg-white/10 rounded-full px-4 py-2">
                <MapPin size={16} className="text-gold-400" />
                <span>Entrega em casa</span>
              </div>
              <div className="flex items-center gap-2 bg-white/10 rounded-full px-4 py-2">
                <Star size={16} className="text-gold-400" />
                <span>4.9 ★ avaliações</span>
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* Products */}
      <main className="max-w-6xl mx-auto px-4 py-12">
        {products.length === 0 ? (
          <div className="text-center py-24">
            <div className="inline-flex items-center justify-center w-24 h-24 bg-brand-50 rounded-full mb-6">
              <Flame size={40} className="text-brand-400" />
            </div>
            <p className="text-xl font-semibold text-gray-600">Cardápio em breve!</p>
            <p className="text-gray-400 mt-2">Novidades chegando.</p>
          </div>
        ) : (
          <>
            {categories.length > 0 ? (
              categories.map(category => {
                const catProducts = products.filter(p => (p.categoryRel?.name || p.category) === category)
                return (
                  <section key={category} className="mb-12">
                    <div className="flex items-center justify-between mb-6">
                      <h2 className="text-2xl font-extrabold text-gray-900 flex items-center gap-3">
                        <span className="w-1.5 h-7 bg-brand-600 rounded-full inline-block" />
                        {category}
                      </h2>
                      <span className="flex items-center gap-1 text-sm text-gray-400 font-medium">
                        {catProducts.length} itens <ChevronRight size={16} />
                      </span>
                    </div>
                    <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-5">
                      {catProducts.map(product => (
                        <ProductCard key={product.id} product={product} />
                      ))}
                    </div>
                  </section>
                )
              })
            ) : (
              <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-5">
                {products.map(product => (
                  <ProductCard key={product.id} product={product} />
                ))}
              </div>
            )}
          </>
        )}
      </main>

      <footer className="bg-gray-950 text-gray-500 py-10 mt-4">
        <div className="max-w-6xl mx-auto px-4 flex flex-col md:flex-row items-center justify-between gap-4">
          <div className="flex items-center gap-2 font-bold text-white">
            <span className="bg-brand-600 text-white p-1.5 rounded-lg">
              <Flame size={16} />
            </span>
            Rei da Quentinha
          </div>
          <p className="text-sm">© {new Date().getFullYear()} Rei da Quentinha — Todos os direitos reservados</p>
        </div>
      </footer>
    </div>
  )
}
