'use client'
import { useState, useEffect } from 'react'
import toast from 'react-hot-toast'
import { Save, QrCode, RefreshCw } from 'lucide-react'

export default function ConfiguracoesPage() {
  const [form, setForm] = useState({ pixKey: '', pixName: '', pixCity: '' })
  const [loading, setLoading] = useState(false)
  const [testAmount, setTestAmount] = useState('10.00')
  const [testPix, setTestPix] = useState<{ qrCode: string; payload: string } | null>(null)
  const [testLoading, setTestLoading] = useState(false)

  useEffect(() => {
    fetch('/api/config').then(r => r.ok ? r.json() : null).then(data => {
      if (data) setForm(data)
    })
  }, [])

  const handleSave = async (e: React.FormEvent) => {
    e.preventDefault()
    setLoading(true)
    try {
      const res = await fetch('/api/config', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(form),
      })
      if (!res.ok) throw new Error()
      toast.success('Configurações salvas! Reinicie o servidor para aplicar.')
    } catch {
      toast.error('Erro ao salvar')
    } finally {
      setLoading(false)
    }
  }

  const testPixGenerate = async () => {
    setTestLoading(true)
    setTestPix(null)
    try {
      const res = await fetch('/api/pix', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ amount: parseFloat(testAmount) }),
      })
      const data = await res.json()
      if (!res.ok) { toast.error(data.error || 'Erro'); return }
      setTestPix(data)
      toast.success('QR Code gerado com sucesso!')
    } catch {
      toast.error('Erro ao gerar PIX')
    } finally {
      setTestLoading(false)
    }
  }

  return (
    <div className="p-8 max-w-2xl">
      <h1 className="text-3xl font-bold text-gray-800 mb-8">Configurações PIX</h1>

      <form onSubmit={handleSave} className="card p-6 mb-6 space-y-4">
        <h2 className="text-lg font-bold text-gray-700 flex items-center gap-2">
          <QrCode size={20} className="text-orange-500" /> Dados da Chave PIX
        </h2>
        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1">
            Chave PIX *
          </label>
          <input
            className="input-field"
            placeholder="CPF, CNPJ, e-mail, telefone ou chave aleatória"
            value={form.pixKey}
            onChange={e => setForm(f => ({ ...f, pixKey: e.target.value }))}
            required
          />
          <p className="text-xs text-gray-400 mt-1">Ex: 11999999999 ou seuemail@gmail.com</p>
        </div>
        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1">Nome do recebedor *</label>
          <input
            className="input-field"
            placeholder="Nome que aparece no QR Code"
            value={form.pixName}
            onChange={e => setForm(f => ({ ...f, pixName: e.target.value }))}
            required
          />
        </div>
        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1">Cidade *</label>
          <input
            className="input-field"
            placeholder="Sao Paulo"
            value={form.pixCity}
            onChange={e => setForm(f => ({ ...f, pixCity: e.target.value }))}
            required
          />
          <p className="text-xs text-gray-400 mt-1">Sem acentos</p>
        </div>
        <button type="submit" disabled={loading} className="btn-primary flex items-center gap-2">
          <Save size={16} /> {loading ? 'Salvando...' : 'Salvar Configurações'}
        </button>
      </form>

      {/* Teste do PIX */}
      <div className="card p-6">
        <h2 className="text-lg font-bold text-gray-700 mb-4 flex items-center gap-2">
          <RefreshCw size={20} className="text-orange-500" /> Testar QR Code PIX
        </h2>
        <div className="flex gap-3 mb-4">
          <div className="flex-1">
            <label className="block text-sm font-medium text-gray-700 mb-1">Valor de teste (R$)</label>
            <input
              type="number"
              step="0.01"
              className="input-field"
              value={testAmount}
              onChange={e => setTestAmount(e.target.value)}
            />
          </div>
          <div className="flex items-end">
            <button onClick={testPixGenerate} disabled={testLoading} className="btn-primary flex items-center gap-2 h-[42px]">
              <QrCode size={16} /> {testLoading ? 'Gerando...' : 'Gerar'}
            </button>
          </div>
        </div>
        {testPix && (
          <div className="flex flex-col items-center gap-3 bg-green-50 border border-green-200 rounded-xl p-4">
            <img src={testPix.qrCode} alt="QR Code teste" className="w-48 h-48 rounded-lg" />
            <p className="text-sm font-bold text-green-700">
              R$ {parseFloat(testAmount).toLocaleString('pt-BR', { minimumFractionDigits: 2 })}
            </p>
            <p className="text-xs text-gray-500 break-all text-center">{testPix.payload}</p>
          </div>
        )}
      </div>
    </div>
  )
}
