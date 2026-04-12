// =====================================================
// DADOS DOS PRODUTOS
// =====================================================
const products = [
  {
    id: 1,
    name: "Royal Canin Medium Adult",
    description: "Ração completa para cães adultos de porte médio. Fórmula exclusiva com nutrientes essenciais para manter a saúde do seu pet.",
    category: "caes",
    brand: "Royal Canin",
    weight: "15kg",
    price: 299.90,
    originalPrice: 349.90,
    image: "https://placehold.co/300x300/FF7F50/fff?text=Royal+Canin",
    rating: 5,
    reviews: 128,
    badge: "Mais Vendido",
    stock: 15
  },
  {
    id: 2,
    name: "Pedigree Adulto Carne",
    description: "Ração saborosa com carne para cães adultos. Rica em proteínas e vitaminas para uma vida saudável e ativa.",
    category: "caes",
    brand: "Pedigree",
    weight: "15kg",
    price: 149.90,
    originalPrice: null,
    image: "https://placehold.co/300x300/E07B39/fff?text=Pedigree",
    rating: 4,
    reviews: 89,
    badge: null,
    stock: 22
  },
  {
    id: 3,
    name: "Premier Filhote Raças Médias",
    description: "Formulada especialmente para filhotes de raças médias. Suporte ao desenvolvimento ósseo e imunológico.",
    category: "caes",
    brand: "Premier",
    weight: "15kg",
    price: 239.90,
    originalPrice: 279.90,
    image: "https://placehold.co/300x300/D4632A/fff?text=Premier",
    rating: 5,
    reviews: 156,
    badge: "Promoção",
    stock: 8
  },
  {
    id: 4,
    name: "Golden Fórmula Adulto",
    description: "Ração premium para cães adultos com frango e arroz. Alto teor de ômega 3 e 6 para pelo brilhante.",
    category: "caes",
    brand: "Golden",
    weight: "15kg",
    price: 189.90,
    originalPrice: 219.90,
    image: "https://placehold.co/300x300/C1551C/fff?text=Golden",
    rating: 4,
    reviews: 74,
    badge: "Promoção",
    stock: 18
  },
  {
    id: 5,
    name: "Whiskas Carne Adultos",
    description: "Ração completa para gatos adultos com sabor carne. Apetitosa e nutritiva, com tudo que seu gato precisa.",
    category: "gatos",
    brand: "Whiskas",
    weight: "10.1kg",
    price: 119.90,
    originalPrice: null,
    image: "https://placehold.co/300x300/9B59B6/fff?text=Whiskas",
    rating: 4,
    reviews: 203,
    badge: null,
    stock: 30
  },
  {
    id: 6,
    name: "Royal Canin Fit 32",
    description: "Ideal para gatos adultos que têm acesso ao exterior. Mantém o peso ideal e a vitalidade do seu felino.",
    category: "gatos",
    brand: "Royal Canin",
    weight: "7.5kg",
    price: 219.90,
    originalPrice: 249.90,
    image: "https://placehold.co/300x300/8E44AD/fff?text=RC+Gatos",
    rating: 5,
    reviews: 87,
    badge: "Premium",
    stock: 12
  },
  {
    id: 7,
    name: "Purina Cat Chow Castrado",
    description: "Desenvolvida para gatos castrados. Controla o peso e a saúde urinária com uma fórmula equilibrada.",
    category: "gatos",
    brand: "Purina",
    weight: "10.1kg",
    price: 99.90,
    originalPrice: 119.90,
    image: "https://placehold.co/300x300/7D3C98/fff?text=Purina",
    rating: 4,
    reviews: 134,
    badge: "Promoção",
    stock: 25
  },
  {
    id: 8,
    name: "Mix Tropical Canários",
    description: "Mistura de sementes tropicais para canários e outros pássaros pequenos. Rico em nutrientes e vitaminas.",
    category: "passaros",
    brand: "Trill",
    weight: "500g",
    price: 24.90,
    originalPrice: 32.90,
    image: "https://placehold.co/300x300/F39C12/fff?text=Mix+Tropical",
    rating: 4,
    reviews: 45,
    badge: "Promoção",
    stock: 40
  },
  {
    id: 9,
    name: "Nutrópica Agapornis Natural",
    description: "Ração extrusada para agapornis e calopsitas. Alimento completo sem conservantes artificiais.",
    category: "passaros",
    brand: "Nutrópica",
    weight: "300g",
    price: 29.90,
    originalPrice: null,
    image: "https://placehold.co/300x300/D4AC0D/fff?text=Nutropica",
    rating: 5,
    reviews: 38,
    badge: null,
    stock: 35
  },
  {
    id: 10,
    name: "Tetra Goldfish Granulado",
    description: "Alimento granulado para peixes dourados e carpas koi. Fórmula especial para coloração vibrante.",
    category: "peixes",
    brand: "Tetra",
    weight: "145g",
    price: 39.90,
    originalPrice: null,
    image: "https://placehold.co/300x300/2980B9/fff?text=Tetra+Gold",
    rating: 5,
    reviews: 67,
    badge: null,
    stock: 50
  },
  {
    id: 11,
    name: "Tetra Bits Tropicais",
    description: "Chips especiais para peixes tropicais. Não turva a água e oferece nutrição completa e balanceada.",
    category: "peixes",
    brand: "Tetra",
    weight: "105g",
    price: 34.90,
    originalPrice: 44.90,
    image: "https://placehold.co/300x300/1A6FA5/fff?text=Tetra+Bits",
    rating: 4,
    reviews: 52,
    badge: "Promoção",
    stock: 45
  },
  {
    id: 12,
    name: "Vita Snack Hamster & Cobaia",
    description: "Mistura nutritiva para hamsters, cobaias e outros roedores pequenos. Inclui sementes, frutas e vegetais desidratados.",
    category: "roedores",
    brand: "Vita",
    weight: "350g",
    price: 19.90,
    originalPrice: 24.90,
    image: "https://placehold.co/300x300/27AE60/fff?text=Vita+Snack",
    rating: 4,
    reviews: 31,
    badge: "Promoção",
    stock: 28
  }
];

// =====================================================
// GERENCIAMENTO DO CARRINHO
// =====================================================
const Cart = {
  getItems() {
    return JSON.parse(localStorage.getItem("mantiqueira_cart")) || [];
  },

  saveItems(items) {
    localStorage.setItem("mantiqueira_cart", JSON.stringify(items));
    this.updateCartBadge();
  },

  addItem(productId, quantity = 1) {
    const product = products.find(p => p.id === productId);
    if (!product) return;

    const items = this.getItems();
    const existing = items.find(i => i.id === productId);

    if (existing) {
      existing.quantity += quantity;
    } else {
      items.push({
        id: product.id,
        name: product.name,
        price: product.price,
        image: product.image,
        weight: product.weight,
        category: product.category,
        quantity
      });
    }

    this.saveItems(items);
    showToast(`"${product.name}" adicionado ao carrinho!`, "success");
  },

  removeItem(productId) {
    const items = this.getItems().filter(i => i.id !== productId);
    this.saveItems(items);
  },

  updateQuantity(productId, quantity) {
    const items = this.getItems();
    const item = items.find(i => i.id === productId);
    if (item) {
      if (quantity <= 0) {
        this.removeItem(productId);
        return;
      }
      item.quantity = quantity;
      this.saveItems(items);
    }
  },

  getTotal() {
    return this.getItems().reduce((sum, item) => sum + (item.price * item.quantity), 0);
  },

  getCount() {
    return this.getItems().reduce((sum, item) => sum + item.quantity, 0);
  },

  clear() {
    localStorage.removeItem("mantiqueira_cart");
    this.updateCartBadge();
  },

  updateCartBadge() {
    const badge = document.getElementById("cart-badge");
    if (badge) {
      const count = this.getCount();
      badge.textContent = count;
      badge.style.display = count > 0 ? "flex" : "none";
    }
  }
};

// =====================================================
// TOAST NOTIFICATION
// =====================================================
function showToast(message, type = "success") {
  const container = document.getElementById("toast-container");
  if (!container) return;

  const toast = document.createElement("div");
  toast.className = `toast toast-${type}`;
  toast.innerHTML = `
    <i class="fas ${type === "success" ? "fa-check-circle" : type === "error" ? "fa-times-circle" : "fa-info-circle"}"></i>
    <span>${message}</span>
  `;

  container.appendChild(toast);
  setTimeout(() => toast.classList.add("show"), 10);
  setTimeout(() => {
    toast.classList.remove("show");
    setTimeout(() => toast.remove(), 300);
  }, 3000);
}

// =====================================================
// RENDERIZAR CARD DE PRODUTO
// =====================================================
function renderProductCard(product) {
  const discount = product.originalPrice
    ? Math.round((1 - product.price / product.originalPrice) * 100)
    : 0;

  const stars = Array.from({ length: 5 }, (_, i) =>
    `<i class="fa${i < product.rating ? "s" : "r"} fa-star"></i>`
  ).join("");

  return `
    <div class="product-card" data-id="${product.id}">
      ${product.badge ? `<span class="product-badge badge-${product.badge === "Promoção" ? "promo" : product.badge === "Premium" ? "premium" : "bestseller"}">${product.badge}</span>` : ""}
      ${discount > 0 ? `<span class="discount-tag">-${discount}%</span>` : ""}
      <div class="product-image" onclick="openModal(${product.id})">
        <img src="${product.image}" alt="${product.name}" loading="lazy">
        <div class="product-overlay">
          <button class="btn-quick-view">Ver Detalhes</button>
        </div>
      </div>
      <div class="product-info">
        <span class="product-brand">${product.brand}</span>
        <h3 class="product-name" onclick="openModal(${product.id})">${product.name}</h3>
        <span class="product-weight"><i class="fas fa-weight-hanging"></i> ${product.weight}</span>
        <div class="product-rating">
          <div class="stars">${stars}</div>
          <span class="review-count">(${product.reviews})</span>
        </div>
        <div class="product-price">
          ${product.originalPrice ? `<span class="original-price">R$ ${product.originalPrice.toFixed(2).replace(".", ",")}</span>` : ""}
          <span class="current-price">R$ ${product.price.toFixed(2).replace(".", ",")}</span>
        </div>
        <div class="product-installments">
          em até <strong>6x de R$ ${(product.price / 6).toFixed(2).replace(".", ",")}</strong> sem juros
        </div>
        <button class="btn-add-cart" onclick="Cart.addItem(${product.id})">
          <i class="fas fa-shopping-cart"></i> Adicionar ao Carrinho
        </button>
      </div>
    </div>
  `;
}

// =====================================================
// MODAL DE PRODUTO
// =====================================================
function openModal(productId) {
  const product = products.find(p => p.id === productId);
  if (!product) return;

  const discount = product.originalPrice
    ? Math.round((1 - product.price / product.originalPrice) * 100)
    : 0;

  const stars = Array.from({ length: 5 }, (_, i) =>
    `<i class="fa${i < product.rating ? "s" : "r"} fa-star"></i>`
  ).join("");

  const modal = document.getElementById("product-modal");
  const modalBody = document.getElementById("modal-body");

  modalBody.innerHTML = `
    <div class="modal-product">
      <div class="modal-image">
        <img src="${product.image}" alt="${product.name}">
        ${product.badge ? `<span class="product-badge badge-${product.badge === "Promoção" ? "promo" : product.badge === "Premium" ? "premium" : "bestseller"}">${product.badge}</span>` : ""}
      </div>
      <div class="modal-details">
        <span class="product-brand">${product.brand}</span>
        <h2>${product.name}</h2>
        <span class="product-weight"><i class="fas fa-weight-hanging"></i> ${product.weight}</span>
        <div class="product-rating">
          <div class="stars">${stars}</div>
          <span class="review-count">(${product.reviews} avaliações)</span>
        </div>
        <div class="product-price">
          ${product.originalPrice ? `<span class="original-price">R$ ${product.originalPrice.toFixed(2).replace(".", ",")} ${discount > 0 ? `<em>(-${discount}%)</em>` : ""}</span>` : ""}
          <span class="current-price">R$ ${product.price.toFixed(2).replace(".", ",")}</span>
        </div>
        <p class="product-description">${product.description}</p>
        <div class="modal-qty">
          <label>Quantidade:</label>
          <div class="qty-control">
            <button onclick="changeModalQty(-1)"><i class="fas fa-minus"></i></button>
            <input type="number" id="modal-qty-input" value="1" min="1" max="${product.stock}">
            <button onclick="changeModalQty(1)"><i class="fas fa-plus"></i></button>
          </div>
          <span class="stock-info"><i class="fas fa-box"></i> ${product.stock} em estoque</span>
        </div>
        <button class="btn-add-cart btn-modal-cart" onclick="Cart.addItem(${product.id}, parseInt(document.getElementById('modal-qty-input').value)); closeModal()">
          <i class="fas fa-shopping-cart"></i> Adicionar ao Carrinho
        </button>
      </div>
    </div>
  `;

  modal.classList.add("active");
  document.body.style.overflow = "hidden";
}

function changeModalQty(delta) {
  const input = document.getElementById("modal-qty-input");
  if (input) {
    const newVal = Math.max(1, parseInt(input.value) + delta);
    input.value = newVal;
  }
}

function closeModal() {
  const modal = document.getElementById("product-modal");
  modal.classList.remove("active");
  document.body.style.overflow = "";
}

// =====================================================
// PÁGINA: INDEX
// =====================================================
function initIndex() {
  const featuredGrid = document.getElementById("featured-products-grid");
  if (featuredGrid) {
    const featured = products.slice(0, 8);
    featuredGrid.innerHTML = featured.map(renderProductCard).join("");
  }
}

// =====================================================
// PÁGINA: PRODUTOS
// =====================================================
let currentFilter = { category: "todos", brand: "todas", maxPrice: 500, search: "" };
let currentSort = "relevancia";

function initProdutos() {
  const grid = document.getElementById("products-grid");
  if (!grid) return;

  renderFilteredProducts();
  setupFilters();
  setupSearch();
}

function renderFilteredProducts() {
  const grid = document.getElementById("products-grid");
  const countEl = document.getElementById("products-count");

  let filtered = [...products];

  if (currentFilter.category !== "todos") {
    filtered = filtered.filter(p => p.category === currentFilter.category);
  }
  if (currentFilter.brand !== "todas") {
    filtered = filtered.filter(p => p.brand === currentFilter.brand);
  }
  filtered = filtered.filter(p => p.price <= currentFilter.maxPrice);

  if (currentFilter.search) {
    const q = currentFilter.search.toLowerCase();
    filtered = filtered.filter(p =>
      p.name.toLowerCase().includes(q) ||
      p.brand.toLowerCase().includes(q) ||
      p.description.toLowerCase().includes(q)
    );
  }

  switch (currentSort) {
    case "menor-preco":
      filtered.sort((a, b) => a.price - b.price);
      break;
    case "maior-preco":
      filtered.sort((a, b) => b.price - a.price);
      break;
    case "mais-avaliados":
      filtered.sort((a, b) => b.reviews - a.reviews);
      break;
    case "maior-desconto":
      filtered.sort((a, b) => {
        const da = a.originalPrice ? (1 - a.price / a.originalPrice) : 0;
        const db = b.originalPrice ? (1 - b.price / b.originalPrice) : 0;
        return db - da;
      });
      break;
  }

  if (countEl) countEl.textContent = filtered.length;

  if (filtered.length === 0) {
    grid.innerHTML = `
      <div class="no-products">
        <i class="fas fa-search"></i>
        <h3>Nenhum produto encontrado</h3>
        <p>Tente ajustar os filtros ou buscar por outro termo.</p>
      </div>
    `;
  } else {
    grid.innerHTML = filtered.map(renderProductCard).join("");
  }
}

function setupFilters() {
  const priceRange = document.getElementById("price-range");
  const priceDisplay = document.getElementById("price-display");

  if (priceRange) {
    priceRange.addEventListener("input", () => {
      currentFilter.maxPrice = parseInt(priceRange.value);
      if (priceDisplay) priceDisplay.textContent = `Até R$ ${priceRange.value}`;
      renderFilteredProducts();
    });
  }

  document.querySelectorAll(".filter-category").forEach(btn => {
    btn.addEventListener("click", () => {
      document.querySelectorAll(".filter-category").forEach(b => b.classList.remove("active"));
      btn.classList.add("active");
      currentFilter.category = btn.dataset.category;
      renderFilteredProducts();
    });
  });

  document.querySelectorAll(".filter-brand").forEach(cb => {
    cb.addEventListener("change", () => {
      const checked = [...document.querySelectorAll(".filter-brand:checked")].map(c => c.value);
      currentFilter.brand = checked.length === 0 ? "todas" : checked[0];
      renderFilteredProducts();
    });
  });

  const sortSelect = document.getElementById("sort-select");
  if (sortSelect) {
    sortSelect.addEventListener("change", () => {
      currentSort = sortSelect.value;
      renderFilteredProducts();
    });
  }
}

function setupSearch() {
  const searchInput = document.getElementById("search-input");
  if (searchInput) {
    const urlParams = new URLSearchParams(window.location.search);
    const q = urlParams.get("q");
    if (q) {
      searchInput.value = q;
      currentFilter.search = q;
    }

    searchInput.addEventListener("input", () => {
      currentFilter.search = searchInput.value;
      renderFilteredProducts();
    });
  }
}

// =====================================================
// PÁGINA: CARRINHO
// =====================================================
function initCarrinho() {
  renderCart();
}

function renderCart() {
  const cartItemsEl = document.getElementById("cart-items");
  const cartSummaryEl = document.getElementById("cart-summary");
  const emptyCart = document.getElementById("empty-cart");
  const cartContent = document.getElementById("cart-content");

  const items = Cart.getItems();

  if (items.length === 0) {
    if (emptyCart) emptyCart.style.display = "flex";
    if (cartContent) cartContent.style.display = "none";
    return;
  }

  if (emptyCart) emptyCart.style.display = "none";
  if (cartContent) cartContent.style.display = "grid";

  if (cartItemsEl) {
    cartItemsEl.innerHTML = items.map(item => `
      <div class="cart-item" data-id="${item.id}">
        <img src="${item.image}" alt="${item.name}">
        <div class="cart-item-info">
          <h4>${item.name}</h4>
          <span class="cart-item-weight">${item.weight}</span>
          <span class="cart-item-price">R$ ${item.price.toFixed(2).replace(".", ",")}</span>
        </div>
        <div class="cart-item-qty">
          <button onclick="updateCartQty(${item.id}, ${item.quantity - 1})"><i class="fas fa-minus"></i></button>
          <span>${item.quantity}</span>
          <button onclick="updateCartQty(${item.id}, ${item.quantity + 1})"><i class="fas fa-plus"></i></button>
        </div>
        <div class="cart-item-total">
          R$ ${(item.price * item.quantity).toFixed(2).replace(".", ",")}
        </div>
        <button class="cart-item-remove" onclick="removeCartItem(${item.id})" title="Remover">
          <i class="fas fa-trash"></i>
        </button>
      </div>
    `).join("");
  }

  updateCartSummary();
}

function updateCartQty(id, qty) {
  Cart.updateQuantity(id, qty);
  renderCart();
}

function removeCartItem(id) {
  Cart.removeItem(id);
  renderCart();
  showToast("Item removido do carrinho.", "info");
}

function updateCartSummary() {
  const subtotal = Cart.getTotal();
  const shipping = subtotal >= 200 ? 0 : 19.90;
  const total = subtotal + shipping;

  const el = id => document.getElementById(id);

  if (el("summary-subtotal"))
    el("summary-subtotal").textContent = `R$ ${subtotal.toFixed(2).replace(".", ",")}`;

  if (el("summary-shipping")) {
    el("summary-shipping").textContent = shipping === 0
      ? "Grátis!"
      : `R$ ${shipping.toFixed(2).replace(".", ",")}`;
    if (el("shipping-msg")) {
      el("shipping-msg").textContent = shipping > 0
        ? `Faltam R$ ${(200 - subtotal).toFixed(2).replace(".", ",")} para frete grátis!`
        : "Você ganhou frete grátis!";
      el("shipping-msg").className = shipping > 0 ? "shipping-msg" : "shipping-msg shipping-free";
    }
  }

  if (el("summary-total"))
    el("summary-total").textContent = `R$ ${total.toFixed(2).replace(".", ",")}`;
}

// =====================================================
// HEADER SCROLL & MOBILE MENU
// =====================================================
function initHeader() {
  const header = document.querySelector("header");
  if (header) {
    window.addEventListener("scroll", () => {
      header.classList.toggle("scrolled", window.scrollY > 50);
    });
  }

  const menuToggle = document.getElementById("menu-toggle");
  const mobileMenu = document.getElementById("mobile-nav");
  if (menuToggle && mobileMenu) {
    menuToggle.addEventListener("click", () => {
      mobileMenu.classList.toggle("open");
      menuToggle.classList.toggle("open");
    });
  }

  // Global search
  const headerSearch = document.getElementById("header-search");
  const headerSearchBtn = document.getElementById("header-search-btn");
  if (headerSearchBtn && headerSearch) {
    headerSearchBtn.addEventListener("click", () => {
      const q = headerSearch.value.trim();
      if (q) window.location.href = `produtos.html?q=${encodeURIComponent(q)}`;
    });
    headerSearch.addEventListener("keydown", e => {
      if (e.key === "Enter") {
        const q = headerSearch.value.trim();
        if (q) window.location.href = `produtos.html?q=${encodeURIComponent(q)}`;
      }
    });
  }
}

// =====================================================
// INICIALIZAÇÃO
// =====================================================
document.addEventListener("DOMContentLoaded", () => {
  initHeader();
  Cart.updateCartBadge();

  const page = document.body.dataset.page;
  if (page === "index") initIndex();
  if (page === "produtos") initProdutos();
  if (page === "carrinho") initCarrinho();

  // Modal close
  const modal = document.getElementById("product-modal");
  if (modal) {
    modal.addEventListener("click", e => {
      if (e.target === modal) closeModal();
    });
  }
});
