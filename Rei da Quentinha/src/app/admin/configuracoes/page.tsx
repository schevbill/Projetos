'use client'
import { useState, useEffect } from 'react'
import toast from 'react-hot-toast'
import { Save, QrCode, RefreshCw, Mail, Settings, Send, Eye, EyeOff } from 'lucide-react'

export default function ConfiguracoesPage() {
  const [tab, setTab] = useState<'pix' | 'email'>('pix')

  // PIX
  const [pixForm, setPixForm] = useState({ pixKey: '', pixName: '', pixCity: '' })
  const [pixLoading, setPixLoading] = useState(false)
  const [testAmount, setTestAmount] = useState('10.00')
  const [testPix, setTestPix] = useState<{ qrCode: string; payload: string } | null>(null)
  const [testPixLoading, setTestPixLoading] = useState(false)

  // Email
  const [emailForm, setEmailForm] = useState({
    host: 'smtp.gmail.com', port: '587', user: '', pass: '', from: '', active: false,
  })
  const [emailLoading, setEmailLoading] = useState(false)
  const [testEmailLoading, setTestEmailLoading] = useState(false)
  const [showPass, setShowPass] = useState(false)

  useEffect(() => {
    fetch('/api/config').then(r => r.ok ? r.json() : null).then(d => { if (d) setPixForm(d) })
    fetch('/api/config-email').then(r => r.ok ? r.json() : null).then(d => {
      if (d) setEmailForm({ host: d.host, port: String(d.port), user: d.user, pass: d.pass, from: d.from, active: d.active })
    })
  }, [])

  const handleSavePix = async (e: React.FormEvent) => {
    e.preventDefault()
    setPixLoading(true)
    try {
      const res = await fetch('/api/config', { method: 'POST', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify(pixForm) })
      if (!res.ok) throw new Error()
      toast.success('Configurações PIX salvas!')
    } catch { toast.error('Erro ao salvar') } finally { setPixLoading(false) }
  }

  const testPixGenerate = async () => {
    setTestPixLoading(true); setTestPix(null)
    try {
      const res = await fetch('/api/pix', { method: 'POST', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify({ amount: parseFloat(testAmount) }) })
      const data = await res.json()
      if (!res.ok) { toast.error(data.error || 'Erro'); return }
      setTestPix(data)
      toast.success('QR Code gerado!')
    } catch { toast.error('Erro ao gerar PIX') } finally { setTestPixLoading(false) }
  }

  const handleSaveEmail = async (e: React.FormEvent) => {
    e.preventDefault()
    setEmailLoading(true)
    try {
      const res = await fetch('/api/config-email', { method: 'POST', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify(emailForm) })
      if (!res.ok) throw new Error()
      toast.success('Configurações de e-mail salvas!')
    } catch { toast.error('Erro ao salvar') } finally { setEmailLoading(false) }
  }

  const handleTestEmail = async () => {
    setTestEmailLoading(true)
    try {
      const res = await fetch('/api/config-email/test', { method: 'POST' })
      const data = await res.json()
      if (!res.ok) throw new Error(data.detail ? `${data.error} — ${data.detail}` : data.error)
      toast.success(`E-mail de teste enviado para ${data.sentTo}!`)
    } catch (err: any) { toast.error(err?.message || 'Erro ao enviar e-mail de teste') } finally { setTestEmailLoading(false) }
  }

  return (
    <div className="p-8 max-w-2xl">
      <div className="flex items-center gap-3 mb-8">
        <Settings size={28} className="text-brand-500" />
        <div>
          <h1 className="text-3xl font-bold text-gray-800">Configurações</h1>
          <p className="text-gray-500 text-sm mt-0.5">PIX e notificações por e-mail</p>
        </div>
      </div>

      {/* Tabs */}
      <div className="flex gap-1 bg-gray-100 p-1 rounded-xl mb-8 w-fit">
        <button
          onClick={() => setTab('pix')}
          className={`flex items-center gap-2 px-5 py-2 rounded-lg text-sm font-medium transition-all ${tab === 'pix' ? 'bg-white shadow text-gray-800' : 'text-gray-500 hover:text-gray-700'}`}
        >
          <QrCode size={15} /> PIX
        </button>
        <button
          onClick={() => setTab('email')}
          className={`flex items-center gap-2 px-5 py-2 rounded-lg text-sm font-medium transition-all ${tab === 'email' ? 'bg-white shadow text-gray-800' : 'text-gray-500 hover:text-gray-700'}`}
        >
          <Mail size={15} /> E-mail
        </button>
      </div>

      {/* ── PIX ── */}
      {tab === 'pix' && (
        <>
          <form onSubmit={handleSavePix} className="card p-6 mb-6 space-y-4">
            <h2 className="text-base font-bold text-gray-700 flex items-center gap-2">
              <QrCode size={18} className="text-brand-500" /> Chave PIX
            </h2>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Chave PIX *</label>
              <input className="input-field" placeholder="CPF, CNPJ, e-mail, telefone ou aleatória"
                value={pixForm.pixKey} onChange={e => setPixForm(f => ({ ...f, pixKey: e.target.value }))} required />
              <p className="text-xs text-gray-400 mt-1">Ex: 11999999999 ou seuemail@gmail.com</p>
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Nome do recebedor *</label>
              <input className="input-field" placeholder="Nome que aparece no QR Code"
                value={pixForm.pixName} onChange={e => setPixForm(f => ({ ...f, pixName: e.target.value }))} required />
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Cidade *</label>
              <input className="input-field" placeholder="Sao Paulo (sem acentos)"
                value={pixForm.pixCity} onChange={e => setPixForm(f => ({ ...f, pixCity: e.target.value }))} required />
            </div>
            <button type="submit" disabled={pixLoading} className="btn-primary flex items-center gap-2">
              <Save size={16} /> {pixLoading ? 'Salvando...' : 'Salvar'}
            </button>
          </form>

          <div className="card p-6">
            <h2 className="text-base font-bold text-gray-700 mb-4 flex items-center gap-2">
              <RefreshCw size={18} className="text-brand-500" /> Testar QR Code
            </h2>
            <div className="flex gap-3 mb-4">
              <div className="flex-1">
                <label className="block text-sm font-medium text-gray-700 mb-1">Valor (R$)</label>
                <input type="number" step="0.01" className="input-field" value={testAmount} onChange={e => setTestAmount(e.target.value)} />
              </div>
              <div className="flex items-end">
                <button onClick={testPixGenerate} disabled={testPixLoading} className="btn-primary flex items-center gap-2 h-[42px]">
                  <QrCode size={16} /> {testPixLoading ? 'Gerando...' : 'Gerar'}
                </button>
              </div>
            </div>
            {testPix && (
              <div className="flex flex-col items-center gap-3 bg-green-50 border border-green-200 rounded-xl p-4">
                <img src={testPix.qrCode} alt="QR Code" className="w-48 h-48 rounded-lg" />
                <p className="text-sm font-bold text-green-700">R$ {parseFloat(testAmount).toLocaleString('pt-BR', { minimumFractionDigits: 2 })}</p>
                <p className="text-xs text-gray-500 break-all text-center">{testPix.payload}</p>
              </div>
            )}
          </div>
        </>
      )}

      {/* ── EMAIL ── */}
      {tab === 'email' && (
        <>
          <form onSubmit={handleSaveEmail} className="card p-6 mb-6 space-y-4">
            <div className="flex items-center justify-between">
              <h2 className="text-base font-bold text-gray-700 flex items-center gap-2">
                <Mail size={18} className="text-brand-500" /> Servidor SMTP
              </h2>
              <label className="flex items-center gap-2 cursor-pointer">
                <span className="text-sm text-gray-600">Ativo</span>
                <div
                  onClick={() => setEmailForm(f => ({ ...f, active: !f.active }))}
                  className={`w-10 h-6 rounded-full transition-colors relative cursor-pointer ${emailForm.active ? 'bg-green-500' : 'bg-gray-300'}`}
                >
                  <div className={`w-4 h-4 bg-white rounded-full absolute top-1 transition-all ${emailForm.active ? 'left-5' : 'left-1'}`} />
                </div>
              </label>
            </div>

            <div className="grid grid-cols-3 gap-3">
              <div className="col-span-2">
                <label className="block text-sm font-medium text-gray-700 mb-1">Servidor SMTP</label>
                <input className="input-field" placeholder="smtp.gmail.com"
                  value={emailForm.host} onChange={e => setEmailForm(f => ({ ...f, host: e.target.value }))} />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-1">Porta</label>
                <input className="input-field" placeholder="587" type="number"
                  value={emailForm.port} onChange={e => setEmailForm(f => ({ ...f, port: e.target.value }))} />
              </div>
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Usuário / E-mail</label>
              <input className="input-field" placeholder="seuemail@gmail.com" type="email"
                value={emailForm.user} onChange={e => setEmailForm(f => ({ ...f, user: e.target.value }))} />
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Senha / Senha de App</label>
              <div className="relative">
                <input className="input-field pr-10" placeholder="••••••••••••••••"
                  type={showPass ? 'text' : 'password'}
                  value={emailForm.pass} onChange={e => setEmailForm(f => ({ ...f, pass: e.target.value }))} />
                <button type="button"
                  onMouseDown={() => setShowPass(true)}
                  onMouseUp={() => setShowPass(false)}
                  onMouseLeave={() => setShowPass(false)}
                  onTouchStart={() => setShowPass(true)}
                  onTouchEnd={() => setShowPass(false)}
                  className="absolute right-3 top-1/2 -translate-y-1/2 text-gray-400 hover:text-gray-600 transition-colors">
                  {showPass ? <EyeOff size={16} /> : <Eye size={16} />}
                </button>
              </div>
              <p className="text-xs text-gray-400 mt-1">Para Gmail use uma <strong>Senha de App</strong> (não a senha normal)</p>
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Nome do remetente</label>
              <input className="input-field" placeholder="Rei da Quentinha <seuemail@gmail.com>"
                value={emailForm.from} onChange={e => setEmailForm(f => ({ ...f, from: e.target.value }))} />
              <p className="text-xs text-gray-400 mt-1">Deixe vazio para usar o e-mail do usuário automaticamente</p>
            </div>

            <button type="submit" disabled={emailLoading} className="btn-primary flex items-center gap-2">
              <Save size={16} /> {emailLoading ? 'Salvando...' : 'Salvar Configurações'}
            </button>
          </form>

          <div className="card p-6">
            <h2 className="text-base font-bold text-gray-700 mb-2 flex items-center gap-2">
              <Send size={18} className="text-brand-500" /> Testar Envio
            </h2>
            <p className="text-sm text-gray-500 mb-4">
              Envia um e-mail de teste para o e-mail do usuário admin logado. Salve as configurações antes de testar.
            </p>
            <button onClick={handleTestEmail} disabled={testEmailLoading} className="btn-primary flex items-center gap-2">
              <Send size={16} /> {testEmailLoading ? 'Enviando...' : 'Enviar E-mail de Teste'}
            </button>
          </div>
        </>
      )}
    </div>
  )
}
