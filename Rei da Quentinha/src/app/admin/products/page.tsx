'use client'
import { useEffect, useState, useRef, useCallback } from 'react'
import toast from 'react-hot-toast'
import { Plus, Pencil, Trash2, Package, ImagePlus, X, LayoutList } from 'lucide-react'

interface Product {
  id: string; name: string; description?: string | null; price: number
  categoryId?: string | null; categoryRel?: { name: string } | null
  available: boolean; image?: string | null
}
interface Category { id: string; name: string; _count?: { products: number } }

const emptyForm = { name: '', description: '', price: '', categoryId: '', available: true, image: '' }

export default function AdminProducts() {
  const [tab, setTab] = useState<'products' | 'categories'>('products')

  // Produtos
  const [products, setProducts] = useState<Product[]>([])
  const [showModal, setShowModal] = useState(false)
  const [editing, setEditing] = useState<Product | null>(null)
  const [form, setForm] = useState(emptyForm)
  const [loading, setLoading] = useState(false)
  const [uploading, setUploading] = useState(false)
  const fileRef = useRef<HTMLInputElement>(null)

  // Categorias
  const [categories, setCategories] = useState<Category[]>([])
  const [newName, setNewName] = useState('')
  const [editingCat, setEditingCat] = useState<Category | null>(null)
  const [catLoading, setCatLoading] = useState(false)
  const [showCatModal, setShowCatModal] = useState(false)

  const loadProducts = useCallback(() =>
    fetch('/api/products?withCategory=1', { cache: 'no-store' }).then(r => r.json()).then(d => setProducts(Array.isArray(d) ? d : [])), [])
  const loadCategories = useCallback(() =>
    fetch('/api/categories', { cache: 'no-store' }).then(r => r.json()).then(d => setCategories(Array.isArray(d) ? d : [])), [])

  useEffect(() => { loadProducts(); loadCategories() }, [loadProducts, loadCategories])

  // ── Produtos CRUD ──────────────────────────────────
  const openCreate = () => { setEditing(null); setForm(emptyForm); setShowModal(true) }
  const openEdit = (p: Product) => {
    setEditing(p)
    setForm({ name: p.name, description: p.description || '', price: p.price.toString(), categoryId: p.categoryId || '', available: p.available, image: p.image || '' })
    setShowModal(true)
  }

  const handleImageChange = async (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files?.[0]
    if (!file) return
    setUploading(true)
    try {
      const fd = new FormData()
      fd.append('file', file)
      const res = await fetch('/api/upload', { method: 'POST', body: fd })
      const data = await res.json()
      if (!res.ok) { toast.error(data.error || 'Erro no upload'); return }
      setForm(f => ({ ...f, image: data.url }))
      toast.success('Imagem carregada!')
    } catch {
      toast.error('Erro ao enviar imagem')
    } finally {
      setUploading(false)
      if (fileRef.current) fileRef.current.value = ''
    }
  }

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    setLoading(true)
    try {
      const body = { ...form, price: parseFloat(form.price), categoryId: form.categoryId || null }
      const res = editing
        ? await fetch(`/api/products/${editing.id}`, { method: 'PUT', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify(body) })
        : await fetch('/api/products', { method: 'POST', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify(body) })
      if (!res.ok) throw new Error()
      toast.success(editing ? 'Produto atualizado!' : 'Produto criado!')
      if (editing) {
        const categoryRel = body.categoryId
          ? (categories.find(c => c.id === body.categoryId) ?? null)
          : null
        setProducts(ps => ps.map(p => p.id === editing.id ? { ...p, ...body, categoryRel } : p))
      } else {
        await loadProducts()
      }
      setShowModal(false)
    } catch {
      toast.error('Erro ao salvar produto')
    } finally {
      setLoading(false)
    }
  }

  const handleDeleteProduct = async (id: string) => {
    if (!confirm('Excluir este produto?')) return
    const res = await fetch(`/api/products/${id}`, { method: 'DELETE' })
    if (res.ok) { toast.success('Produto excluído'); loadProducts() }
    else toast.error('Erro ao excluir')
  }

  // ── Categorias CRUD ────────────────────────────────

  const handleSaveCat = async (e: React.FormEvent) => {
    e.preventDefault()
    if (!newName.trim()) return
    setCatLoading(true)
    try {
      const url = editingCat ? `/api/categories/${editingCat.id}` : '/api/categories'
      const method = editingCat ? 'PUT' : 'POST'
      const res = await fetch(url, { method, headers: { 'Content-Type': 'application/json' }, body: JSON.stringify({ name: newName }) })
      const data = await res.json()
      if (!res.ok) { toast.error(data.error); return }
      toast.success(editingCat ? 'Categoria atualizada!' : 'Categoria criada!')
      setShowCatModal(false); loadCategories()
    } catch {
      toast.error('Erro ao salvar')
    } finally {
      setCatLoading(false)
    }
  }

  const handleDeleteCat = async (id: string, name: string) => {
    if (!confirm(`Excluir a categoria "${name}"?`)) return
    const res = await fetch(`/api/categories/${id}`, { method: 'DELETE' })
    const data = await res.json()
    if (res.ok) { toast.success('Categoria excluída'); loadCategories() }
    else toast.error(data.error || 'Erro ao excluir')
  }

  return (
    <div className="p-8">
      <div className="flex justify-between items-center mb-6">
        <h1 className="text-3xl font-bold text-gray-800">Produtos</h1>
        {tab === 'products' && (
          <button onClick={openCreate} className="btn-primary flex items-center gap-2">
            <Plus size={18} /> Novo Produto
          </button>
        )}
        {tab === 'categories' && (
          <button onClick={() => { setEditingCat(null); setNewName(''); setShowCatModal(true) }} className="btn-primary flex items-center gap-2">
            <Plus size={18} /> Nova Categoria
          </button>
        )}
      </div>

      {/* Tabs */}
      <div className="flex gap-1 mb-6 border-b border-gray-200">
        {([
          { key: 'products', label: 'Produtos', icon: Package },
          { key: 'categories', label: 'Categorias', icon: LayoutList },
        ] as const).map(({ key, label, icon: Icon }) => (
          <button key={key} onClick={() => setTab(key)}
            className={`flex items-center gap-2 px-4 py-2.5 text-sm font-medium border-b-2 transition-colors -mb-px ${tab === key ? 'border-brand-500 text-brand-600' : 'border-transparent text-gray-500 hover:text-gray-700'}`}>
            <Icon size={16} /> {label}
          </button>
        ))}
      </div>

      {/* ── Tab Produtos ── */}
      {tab === 'products' && (
        <div className="card overflow-x-auto">
          <table className="w-full text-sm min-w-[600px]">
            <thead className="bg-gray-50">
              <tr>
                {['Produto', 'Categoria', 'Preço', 'Disponível', 'Ações'].map(h => (
                  <th key={h} className="text-left px-6 py-3 text-gray-600 font-semibold">{h}</th>
                ))}
              </tr>
            </thead>
            <tbody>
              {products.map(p => (
                <tr key={p.id} className="border-t hover:bg-gray-50">
                  <td className="px-6 py-4">
                    <div className="flex items-center gap-3">
                      <div className="w-10 h-10 bg-brand-100 rounded-lg flex items-center justify-center overflow-hidden flex-shrink-0">
                        {p.image
                          ? <img src={p.image} alt={p.name} className="w-full h-full object-cover" />
                          : <Package size={18} className="text-brand-400" />}
                      </div>
                      <div>
                        <p className="font-medium text-gray-800">{p.name}</p>
                        <p className="text-gray-400 text-xs truncate max-w-48">{p.description}</p>
                      </div>
                    </div>
                  </td>
                  <td className="px-6 py-4 text-gray-600">{p.categoryRel?.name || '—'}</td>
                  <td className="px-6 py-4 font-bold text-brand-500">
                    {p.price.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' })}
                  </td>
                  <td className="px-6 py-4">
                    <span className={`px-2 py-1 rounded-full text-xs font-medium ${p.available ? 'bg-green-100 text-green-700' : 'bg-red-100 text-red-700'}`}>
                      {p.available ? 'Sim' : 'Não'}
                    </span>
                  </td>
                  <td className="px-6 py-4">
                    <div className="flex gap-2">
                      <button onClick={() => openEdit(p)} className="p-1.5 text-blue-500 hover:bg-blue-50 rounded"><Pencil size={16} /></button>
                      <button onClick={() => handleDeleteProduct(p.id)} className="p-1.5 text-red-500 hover:bg-red-50 rounded"><Trash2 size={16} /></button>
                    </div>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
          {products.length === 0 && <div className="text-center py-12 text-gray-400">Nenhum produto cadastrado</div>}
        </div>
      )}

      {/* ── Tab Categorias ── */}
      {tab === 'categories' && (
        <div className="card overflow-x-auto">
          <table className="w-full text-sm min-w-[400px]">
            <thead className="bg-gray-50">
              <tr>
                {['Categoria', 'Produtos', 'Ações'].map(h => (
                  <th key={h} className="text-left px-6 py-3 text-gray-600 font-semibold">{h}</th>
                ))}
              </tr>
            </thead>
            <tbody>
              {categories.map(cat => (
                <tr key={cat.id} className="border-t hover:bg-gray-50">
                  <td className="px-6 py-4">
                    <div className="flex items-center gap-3">
                      <div className="w-10 h-10 bg-brand-100 rounded-lg flex items-center justify-center flex-shrink-0">
                        <LayoutList size={18} className="text-brand-400" />
                      </div>
                      <p className="font-medium text-gray-800">{cat.name}</p>
                    </div>
                  </td>
                  <td className="px-6 py-4 text-gray-500">
                    {cat._count?.products ?? 0} produto{(cat._count?.products ?? 0) !== 1 ? 's' : ''}
                  </td>
                  <td className="px-6 py-4">
                    <div className="flex gap-2">
                      <button onClick={() => { setEditingCat(cat); setNewName(cat.name); setShowCatModal(true) }} className="p-1.5 text-blue-500 hover:bg-blue-50 rounded"><Pencil size={16} /></button>
                      <button onClick={() => handleDeleteCat(cat.id, cat.name)} className="p-1.5 text-red-500 hover:bg-red-50 rounded"><Trash2 size={16} /></button>
                    </div>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
          {categories.length === 0 && (
            <div className="text-center py-12 text-gray-400">Nenhuma categoria cadastrada</div>
          )}
        </div>
      )}

      {/* ── Modal Produto ── */}
      {showModal && (
        <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4">
          <div className="card w-full max-w-md p-6 max-h-[90vh] overflow-y-auto">
            <h2 className="text-xl font-bold text-gray-800 mb-4">{editing ? 'Editar' : 'Novo'} Produto</h2>
            <form onSubmit={handleSubmit} className="space-y-4">

              {/* Imagem */}
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Imagem do produto</label>
                <div
                  className="relative border-2 border-dashed border-gray-300 rounded-xl overflow-hidden cursor-pointer hover:border-brand-400 transition-colors"
                  style={{ height: 160 }}
                  onClick={() => fileRef.current?.click()}
                >
                  {form.image ? (
                    <>
                      <img src={form.image} alt="preview" className="w-full h-full object-cover" />
                      <button type="button"
                        className="absolute top-2 right-2 bg-white/80 hover:bg-white rounded-full p-1 shadow"
                        onClick={e => { e.stopPropagation(); setForm(f => ({ ...f, image: '' })) }}>
                        <X size={14} className="text-gray-600" />
                      </button>
                    </>
                  ) : (
                    <div className="flex flex-col items-center justify-center h-full gap-2 text-gray-400">
                      {uploading
                        ? <><div className="w-6 h-6 border-2 border-brand-400 border-t-transparent rounded-full animate-spin" /><span className="text-sm">Enviando...</span></>
                        : <><ImagePlus size={28} /><span className="text-sm">Clique para selecionar a imagem</span><span className="text-xs">JPG, PNG, WEBP — máx. 5MB</span></>
                      }
                    </div>
                  )}
                </div>
                <input ref={fileRef} type="file" accept="image/*" className="hidden" onChange={handleImageChange} />
              </div>

              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Nome *</label>
                <input className="input-field" value={form.name} onChange={e => setForm(f => ({ ...f, name: e.target.value }))} required />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Descrição</label>
                <textarea className="input-field resize-none" rows={2} value={form.description} onChange={e => setForm(f => ({ ...f, description: e.target.value }))} />
              </div>
              <div className="grid grid-cols-2 gap-4">
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">Preço *</label>
                  <input type="number" step="0.01" className="input-field" value={form.price} onChange={e => setForm(f => ({ ...f, price: e.target.value }))} required />
                </div>
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">Categoria</label>
                  <select className="input-field" value={form.categoryId} onChange={e => setForm(f => ({ ...f, categoryId: e.target.value }))}>
                    <option value="">Sem categoria</option>
                    {categories.map(c => <option key={c.id} value={c.id}>{c.name}</option>)}
                  </select>
                </div>
              </div>
              <div className="flex items-center gap-2">
                <input type="checkbox" id="available" checked={form.available} onChange={e => setForm(f => ({ ...f, available: e.target.checked }))} />
                <label htmlFor="available" className="text-sm text-gray-700">Disponível para venda</label>
              </div>
              <div className="flex gap-3 pt-2">
                <button type="submit" disabled={loading || uploading} className="btn-primary flex-1">{loading ? 'Salvando...' : 'Salvar'}</button>
                <button type="button" onClick={() => setShowModal(false)} className="btn-secondary flex-1">Cancelar</button>
              </div>
            </form>
          </div>
        </div>
      )}

      {/* ── Modal Nova Categoria ── */}
      {showCatModal && (
        <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50 p-4">
          <div className="card w-full max-w-sm p-6">
            <h2 className="text-xl font-bold text-gray-800 mb-4">{editingCat ? 'Editar' : 'Nova'} Categoria</h2>
            <form onSubmit={handleSaveCat} className="space-y-3">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Nome *</label>
                <input
                  className="input-field"
                  placeholder="Ex: Fitness, Tradicional..."
                  value={newName}
                  onChange={e => setNewName(e.target.value)}
                  required
                  autoFocus
                />
              </div>
              <div className="flex gap-3 pt-2">
                <button type="submit" disabled={catLoading} className="btn-primary flex-1">{catLoading ? 'Salvando...' : 'Salvar'}</button>
                <button type="button" onClick={() => { setShowCatModal(false); setEditingCat(null) }} className="btn-secondary flex-1">Cancelar</button>
              </div>
            </form>
          </div>
        </div>
      )}
    </div>
  )
}
