'use client'
import { useState, useEffect } from 'react'
import { useCart } from '@/store/cart'
import Navbar from '@/components/Navbar'
import { useRouter } from 'next/navigation'
import toast from 'react-hot-toast'
import { CreditCard, Smartphone, Banknote, Tag, CheckCircle, Search, Loader2, Copy, XCircle } from 'lucide-react'
import { validatePhone, formatPhone } from '@/lib/validators'

const PAYMENT_METHODS = [
  { value: 'PIX', label: 'PIX', icon: Smartphone },
  { value: 'CREDIT_CARD', label: 'Cartão de Crédito', icon: CreditCard },
  { value: 'CASH', label: 'Dinheiro', icon: Banknote },
]

export default function CheckoutPage() {
  const { items, total, clearCart } = useCart()
  const router = useRouter()
  const [loading, setLoading] = useState(false)
  const [cepLoading, setCepLoading] = useState(false)
  const [couponCode, setCouponCode] = useState('')
  const [couponData, setCouponData] = useState<{ discount: number; type: string; id: string } | null>(null)
  const [couponLoading, setCouponLoading] = useState(false)
  const [pixData, setPixData] = useState<{ qrCode: string; payload: string } | null>(null)
  const [pixLoading, setPixLoading] = useState(false)
  const [form, setForm] = useState({
    customerName: '',
    customerPhone: '',
    cep: '',
    logradouro: '',
    numero: '',
    complemento: '',
    bairro: '',
    cidade: '',
    estado: '',
    paymentMethod: 'PIX',
    changeFor: '',
    notes: '',
  })

  useEffect(() => {
    fetch('/api/auth/me').then(r => r.ok ? r.json() : null).then(data => {
      if (data?.user) {
        setForm(f => ({
          ...f,
          customerName: data.user.name,
          customerPhone: data.user.phone || '',
        }))
      }
    })
  }, [])

  const buscarCep = async (cep: string) => {
    const cepLimpo = cep.replace(/\D/g, '')
    if (cepLimpo.length !== 8) return
    setCepLoading(true)
    try {
      const res = await fetch(`https://viacep.com.br/ws/${cepLimpo}/json/`)
      const data = await res.json()
      if (data.erro) {
        toast.error('CEP não encontrado')
        return
      }
      setForm(f => ({
        ...f,
        logradouro: data.logradouro || '',
        bairro: data.bairro || '',
        cidade: data.localidade || '',
        estado: data.uf || '',
        complemento: data.complemento || f.complemento,
      }))
      toast.success('Endereço encontrado!')
      setTimeout(() => document.getElementById('campo-numero')?.focus(), 100)
    } catch {
      toast.error('Erro ao buscar CEP')
    } finally {
      setCepLoading(false)
    }
  }

  const handleCepChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    let val = e.target.value.replace(/\D/g, '')
    if (val.length > 8) val = val.slice(0, 8)
    const formatted = val.length > 5 ? `${val.slice(0, 5)}-${val.slice(5)}` : val
    setForm(f => ({ ...f, cep: formatted }))
    if (val.length === 8) buscarCep(val)
  }

  const addressFull = [
    form.logradouro,
    form.numero && `nº ${form.numero}`,
    form.complemento,
    form.bairro,
    form.cidade,
    form.estado,
    form.cep,
  ].filter(Boolean).join(', ')

  const generatePix = async (amount: number) => {
    setPixLoading(true)
    setPixData(null)
    try {
      const res = await fetch('/api/pix', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ amount }),
      })
      if (!res.ok) throw new Error()
      const data = await res.json()
      setPixData(data)
    } catch {
      toast.error('Erro ao gerar QR Code PIX. Verifique a configuração da chave PIX.')
    } finally {
      setPixLoading(false)
    }
  }

  const subtotal = total()
  const discount = couponData
    ? couponData.type === 'PERCENTAGE'
      ? (subtotal * couponData.discount) / 100
      : couponData.discount
    : 0
  const finalTotal = Math.max(0, subtotal - discount)

  const applyCoupon = async () => {
    if (!couponCode.trim()) return
    setCouponLoading(true)
    try {
      const res = await fetch(`/api/coupons/${couponCode.trim().toUpperCase()}`)
      if (!res.ok) { toast.error('Cupom inválido ou expirado'); setCouponData(null); return }
      const data = await res.json()
      setCouponData(data)
      toast.success(`Cupom aplicado! ${data.type === 'PERCENTAGE' ? data.discount + '%' : 'R$ ' + data.discount} de desconto`)
      if (form.paymentMethod === 'PIX') {
        const newDiscount = data.type === 'PERCENTAGE' ? (subtotal * data.discount) / 100 : data.discount
        generatePix(Math.max(0, subtotal - newDiscount))
      }
    } catch {
      toast.error('Erro ao aplicar cupom')
    } finally {
      setCouponLoading(false)
    }
  }

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault()
    if (items.length === 0) { toast.error('Carrinho vazio'); return }
    if (!form.customerName || !form.customerPhone) { toast.error('Preencha nome e celular'); return }
    const phoneErr = validatePhone(form.customerPhone)
    if (phoneErr) { toast.error(phoneErr); return }
    if (!form.logradouro || !form.numero || !form.cidade) { toast.error('Preencha o endereço completo'); return }
    setLoading(true)
    try {
      const res = await fetch('/api/orders', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          customerName: form.customerName,
          customerPhone: form.customerPhone,
          address: addressFull,
          items: items.map(i => ({ productId: i.id, quantity: i.quantity, price: i.price })),
          subtotal,
          discount,
          total: finalTotal,
          couponId: couponData?.id || null,
          notes: form.notes,
          changeFor: form.paymentMethod === 'CASH' && form.changeFor ? parseFloat(form.changeFor) : null,
        }),
      })
      if (!res.ok) throw new Error()
      const order = await res.json()
      clearCart()
      toast.success('Pedido realizado com sucesso!')
      router.push(`/pedido/${order.id}`)
    } catch {
      toast.error('Erro ao finalizar pedido. Tente novamente.')
    } finally {
      setLoading(false)
    }
  }

  if (items.length === 0) {
    return (
      <div className="min-h-screen">
        <Navbar />
        <div className="max-w-4xl mx-auto px-4 py-20 text-center">
          <p className="text-xl text-gray-500">Seu carrinho está vazio.</p>
        </div>
      </div>
    )
  }

  return (
    <div className="min-h-screen">
      <Navbar />
      <main className="max-w-5xl mx-auto px-4 py-10">
        <h1 className="text-3xl font-bold text-gray-800 mb-8">Finalizar Pedido</h1>

        <form onSubmit={handleSubmit} className="grid grid-cols-1 lg:grid-cols-3 gap-8">
          <div className="lg:col-span-2 space-y-6">

            {/* Dados pessoais */}
            <div className="card p-6">
              <h2 className="text-lg font-bold text-gray-800 mb-4">Dados do Cliente</h2>
              <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                <div className="sm:col-span-2">
                  <label className="block text-sm font-medium text-gray-700 mb-1">Nome completo *</label>
                  <input
                    type="text"
                    className="input-field"
                    value={form.customerName}
                    onChange={e => setForm(f => ({ ...f, customerName: e.target.value }))}
                    required
                  />
                </div>
                <div className="sm:col-span-2">
                  <label className="block text-sm font-medium text-gray-700 mb-1">Celular *</label>
                  <div className="relative">
                    <input
                      type="tel"
                      inputMode="numeric"
                      className={`input-field pr-9 ${form.customerPhone && validatePhone(form.customerPhone) ? 'border-red-400 focus:ring-red-300' : form.customerPhone && !validatePhone(form.customerPhone) ? 'border-green-400 focus:ring-green-300' : ''}`}
                      placeholder="(11) 99999-9999"
                      maxLength={15}
                      value={form.customerPhone}
                      onChange={e => setForm(f => ({ ...f, customerPhone: formatPhone(e.target.value) }))}
                      required
                    />
                    {form.customerPhone && (
                      <div className="absolute right-3 top-1/2 -translate-y-1/2">
                        {!validatePhone(form.customerPhone)
                          ? <CheckCircle size={16} className="text-green-500" />
                          : <XCircle size={16} className="text-red-400" />}
                      </div>
                    )}
                  </div>
                  {form.customerPhone && validatePhone(form.customerPhone) && (
                    <p className="text-red-500 text-xs mt-1">{validatePhone(form.customerPhone)}</p>
                  )}
                </div>
              </div>
            </div>

            {/* Endereço com busca de CEP */}
            <div className="card p-6">
              <h2 className="text-lg font-bold text-gray-800 mb-4">Endereço de Entrega</h2>
              <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">

                {/* CEP */}
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">CEP *</label>
                  <div className="relative">
                    <input
                      type="text"
                      className="input-field pr-10"
                      placeholder="00000-000"
                      maxLength={9}
                      value={form.cep}
                      onChange={handleCepChange}
                      required
                    />
                    <div className="absolute right-3 top-1/2 -translate-y-1/2 text-gray-400">
                      {cepLoading ? <Loader2 size={16} className="animate-spin" /> : <Search size={16} />}
                    </div>
                  </div>
                  <p className="text-xs text-gray-400 mt-1">Preenchimento automático ao digitar</p>
                </div>

                {/* Estado */}
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">Estado</label>
                  <input
                    type="text"
                    className="input-field"
                    placeholder="SP"
                    maxLength={2}
                    value={form.estado}
                    onChange={e => setForm(f => ({ ...f, estado: e.target.value.toUpperCase() }))}
                  />
                </div>

                {/* Logradouro */}
                <div className="sm:col-span-2">
                  <label className="block text-sm font-medium text-gray-700 mb-1">Endereço (Rua/Av.) *</label>
                  <input
                    type="text"
                    className="input-field"
                    placeholder="Rua das Flores"
                    value={form.logradouro}
                    onChange={e => setForm(f => ({ ...f, logradouro: e.target.value }))}
                    required
                  />
                </div>

                {/* Número */}
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">Número *</label>
                  <input
                    id="campo-numero"
                    type="text"
                    className="input-field"
                    placeholder="123"
                    value={form.numero}
                    onChange={e => setForm(f => ({ ...f, numero: e.target.value }))}
                    required
                  />
                </div>

                {/* Complemento */}
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">Complemento</label>
                  <input
                    type="text"
                    className="input-field"
                    placeholder="Apto 12, Bloco B..."
                    value={form.complemento}
                    onChange={e => setForm(f => ({ ...f, complemento: e.target.value }))}
                  />
                </div>

                {/* Bairro */}
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">Bairro *</label>
                  <input
                    type="text"
                    className="input-field"
                    placeholder="Centro"
                    value={form.bairro}
                    onChange={e => setForm(f => ({ ...f, bairro: e.target.value }))}
                    required
                  />
                </div>

                {/* Cidade */}
                <div>
                  <label className="block text-sm font-medium text-gray-700 mb-1">Cidade *</label>
                  <input
                    type="text"
                    className="input-field"
                    placeholder="São Paulo"
                    value={form.cidade}
                    onChange={e => setForm(f => ({ ...f, cidade: e.target.value }))}
                    required
                  />
                </div>

                {/* Preview do endereço */}
                {addressFull && (
                  <div className="sm:col-span-2 bg-orange-50 border border-orange-200 rounded-lg px-4 py-2 text-sm text-orange-700">
                    <span className="font-medium">Endereço: </span>{addressFull}
                  </div>
                )}
              </div>

              <div className="mt-4">
                <label className="block text-sm font-medium text-gray-700 mb-1">Observações do pedido</label>
                <textarea
                  className="input-field resize-none"
                  rows={2}
                  placeholder="Sem cebola, sem pimenta, campainha não funciona..."
                  value={form.notes}
                  onChange={e => setForm(f => ({ ...f, notes: e.target.value }))}
                />
              </div>
            </div>

            {/* Pagamento */}
            <div className="card p-6">
              <h2 className="text-lg font-bold text-gray-800 mb-4">Forma de Pagamento</h2>
              <div className="grid grid-cols-2 gap-3">
                {PAYMENT_METHODS.map(({ value, label, icon: Icon }) => (
                  <button
                    key={value}
                    type="button"
                    onClick={() => {
                      setForm(f => ({ ...f, paymentMethod: value }))
                      setPixData(null)
                      if (value === 'PIX') generatePix(finalTotal)
                    }}
                    className={`flex items-center gap-3 p-3 rounded-lg border-2 transition-colors ${
                      form.paymentMethod === value
                        ? 'border-orange-500 bg-orange-50 text-orange-700'
                        : 'border-gray-200 hover:border-gray-300'
                    }`}
                  >
                    <Icon size={20} />
                    <span className="text-sm font-medium">{label}</span>
                  </button>
                ))}
              </div>

              {/* QR Code PIX */}
              {form.paymentMethod === 'PIX' && (
                <div className="mt-5">
                  {pixLoading ? (
                    <div className="flex flex-col items-center py-6 gap-3 text-gray-400">
                      <Loader2 size={36} className="animate-spin text-orange-400" />
                      <span className="text-sm">Gerando QR Code PIX...</span>
                    </div>
                  ) : pixData ? (
                    <div className="flex flex-col items-center gap-3 bg-green-50 border border-green-200 rounded-xl p-5">
                      <p className="text-sm font-semibold text-green-700">Escaneie o QR Code para pagar</p>
                      <img src={pixData.qrCode} alt="QR Code PIX" className="w-52 h-52 rounded-lg shadow" />
                      <p className="text-lg font-bold text-orange-500">
                        {finalTotal.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' })}
                      </p>
                      <div className="w-full">
                        <p className="text-xs text-gray-500 mb-1 text-center">Ou copie o código PIX:</p>
                        <div className="flex gap-2">
                          <input
                            readOnly
                            value={pixData.payload}
                            className="input-field text-xs flex-1 bg-gray-50 font-mono"
                            onClick={e => (e.target as HTMLInputElement).select()}
                          />
                          <button
                            type="button"
                            onClick={() => {
                              navigator.clipboard.writeText(pixData.payload)
                              toast.success('Código copiado!')
                            }}
                            className="btn-primary px-3 flex items-center gap-1 text-sm whitespace-nowrap"
                          >
                            <Copy size={14} /> Copiar
                          </button>
                        </div>
                      </div>
                      <p className="text-xs text-gray-400 text-center">
                        Após o pagamento, clique em <strong>Confirmar Pedido</strong>
                      </p>
                    </div>
                  ) : (
                    <div className="flex flex-col items-center gap-2 py-4 text-gray-400">
                      <button
                        type="button"
                        onClick={() => generatePix(finalTotal)}
                        className="btn-primary flex items-center gap-2"
                      >
                        <Smartphone size={18} /> Gerar QR Code PIX
                      </button>
                    </div>
                  )}
                </div>
              )}

              {form.paymentMethod === 'CASH' && (
                <div className="mt-4">
                  <label className="block text-sm font-medium text-gray-700 mb-1">Troco para quanto?</label>
                  <input
                    type="number"
                    className="input-field"
                    placeholder="Ex: 50.00"
                    step="0.01"
                    value={form.changeFor}
                    onChange={e => setForm(f => ({ ...f, changeFor: e.target.value }))}
                  />
                </div>
              )}
            </div>

            {/* Cupom */}
            <div className="card p-6">
              <h2 className="text-lg font-bold text-gray-800 mb-4 flex items-center gap-2">
                <Tag size={20} className="text-orange-500" />
                Cupom de Desconto
              </h2>
              <div className="flex gap-2">
                <input
                  type="text"
                  className="input-field flex-1 uppercase"
                  placeholder="BEMVINDO10"
                  value={couponCode}
                  onChange={e => setCouponCode(e.target.value.toUpperCase())}
                />
                <button type="button" onClick={applyCoupon} disabled={couponLoading} className="btn-primary px-4 whitespace-nowrap">
                  {couponLoading ? '...' : 'Aplicar'}
                </button>
              </div>
              {couponData && (
                <p className="text-green-600 text-sm mt-2 flex items-center gap-1">
                  <CheckCircle size={16} />
                  Desconto de {couponData.type === 'PERCENTAGE' ? couponData.discount + '%' : 'R$ ' + couponData.discount} aplicado!
                </p>
              )}
            </div>
          </div>

          {/* Resumo */}
          <div className="card p-6 h-fit sticky top-4">
            <h2 className="text-xl font-bold text-gray-800 mb-4">Resumo do Pedido</h2>
            <div className="space-y-2 mb-4 max-h-48 overflow-y-auto">
              {items.map(item => (
                <div key={item.id} className="flex justify-between text-sm text-gray-600">
                  <span>{item.quantity}x {item.name}</span>
                  <span>{(item.price * item.quantity).toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' })}</span>
                </div>
              ))}
            </div>
            <div className="border-t pt-4 space-y-2">
              <div className="flex justify-between text-gray-600">
                <span>Subtotal</span>
                <span>{subtotal.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' })}</span>
              </div>
              {discount > 0 && (
                <div className="flex justify-between text-green-600">
                  <span>Desconto</span>
                  <span>- {discount.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' })}</span>
                </div>
              )}
              <div className="flex justify-between font-bold text-lg text-gray-800 border-t pt-2">
                <span>Total</span>
                <span className="text-orange-500">
                  {finalTotal.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' })}
                </span>
              </div>
            </div>
            <button
              type="submit"
              disabled={loading}
              className="btn-primary w-full mt-6 flex items-center justify-center gap-2 py-3 text-lg"
            >
              {loading ? 'Processando...' : 'Confirmar Pedido'}
            </button>
          </div>
        </form>
      </main>
    </div>
  )
}
