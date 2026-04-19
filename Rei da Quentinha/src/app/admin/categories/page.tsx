'use client'
import { useEffect, useState } from 'react'
import toast from 'react-hot-toast'
import { Plus, Pencil, Trash2, Check, X } from 'lucide-react'

interface Category { id: string; name: string; _count?: { products: number } }

export default function AdminCategories() {
  const [categories, setCategories] = useState<Category[]>([])
  const [newName, setNewName] = useState('')
  const [editingId, setEditingId] = useState<string | null>(null)
  const [editName, setEditName] = useState('')
  const [loading, setLoading] = useState(false)

  const load = () =>
    fetch('/api/categories').then(r => r.json()).then(setCategories)

  useEffect(() => { load() }, [])

  const handleCreate = async (e: React.FormEvent) => {
    e.preventDefault()
    if (!newName.trim()) return
    setLoading(true)
    try {
      const res = await fetch('/api/categories', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ name: newName }),
      })
      const data = await res.json()
      if (!res.ok) { toast.error(data.error); return }
      toast.success('Categoria criada!')
      setNewName('')
      load()
    } catch {
      toast.error('Erro ao criar categoria')
    } finally {
      setLoading(false)
    }
  }

  const handleEdit = async (id: string) => {
    if (!editName.trim()) return
    try {
      const res = await fetch(`/api/categories/${id}`, {
        method: 'PUT',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ name: editName }),
      })
      const data = await res.json()
      if (!res.ok) { toast.error(data.error); return }
      toast.success('Categoria atualizada!')
      setEditingId(null)
      load()
    } catch {
      toast.error('Erro ao atualizar')
    }
  }

  const handleDelete = async (id: string, name: string) => {
    if (!confirm(`Excluir a categoria "${name}"?`)) return
    const res = await fetch(`/api/categories/${id}`, { method: 'DELETE' })
    const data = await res.json()
    if (res.ok) { toast.success('Categoria excluída'); load() }
    else toast.error(data.error || 'Erro ao excluir')
  }

  return (
    <div className="p-8 max-w-2xl">
      <h1 className="text-3xl font-bold text-gray-800 mb-8">Categorias</h1>

      {/* Formulário nova categoria */}
      <form onSubmit={handleCreate} className="card p-5 mb-6 flex gap-3">
        <input
          className="input-field flex-1"
          placeholder="Nome da nova categoria..."
          value={newName}
          onChange={e => setNewName(e.target.value)}
          required
        />
        <button type="submit" disabled={loading} className="btn-primary flex items-center gap-2 whitespace-nowrap">
          <Plus size={16} /> Adicionar
        </button>
      </form>

      {/* Lista */}
      <div className="card overflow-hidden">
        {categories.length === 0 ? (
          <div className="text-center py-12 text-gray-400">Nenhuma categoria cadastrada</div>
        ) : (
          <ul className="divide-y">
            {categories.map(cat => (
              <li key={cat.id} className="flex items-center gap-3 px-5 py-3">
                {editingId === cat.id ? (
                  <>
                    <input
                      className="input-field flex-1 py-1.5 text-sm"
                      value={editName}
                      onChange={e => setEditName(e.target.value)}
                      onKeyDown={e => e.key === 'Enter' && handleEdit(cat.id)}
                      autoFocus
                    />
                    <button onClick={() => handleEdit(cat.id)} className="p-1.5 text-green-600 hover:bg-green-50 rounded">
                      <Check size={16} />
                    </button>
                    <button onClick={() => setEditingId(null)} className="p-1.5 text-gray-400 hover:bg-gray-100 rounded">
                      <X size={16} />
                    </button>
                  </>
                ) : (
                  <>
                    <span className="flex-1 font-medium text-gray-800">{cat.name}</span>
                    <button
                      onClick={() => { setEditingId(cat.id); setEditName(cat.name) }}
                      className="p-1.5 text-blue-500 hover:bg-blue-50 rounded"
                    >
                      <Pencil size={15} />
                    </button>
                    <button
                      onClick={() => handleDelete(cat.id, cat.name)}
                      className="p-1.5 text-red-500 hover:bg-red-50 rounded"
                    >
                      <Trash2 size={15} />
                    </button>
                  </>
                )}
              </li>
            ))}
          </ul>
        )}
      </div>
    </div>
  )
}
