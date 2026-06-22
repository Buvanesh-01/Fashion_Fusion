<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Fashion Fusion - Home</title>
    <style>
@import url('https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;700&family=DM+Serif+Display&display=swap');

:root {
    /* Terracotta Theme Colors */
    --primary: #2B1D14;
    --secondary: #8B6F5B;
    --tertiary: #C56A3C;
    --neutral: #F3E8D8;
    --surface: #FBF4E7;
    --on-primary: #FBF4E7;

    /* Typography */
    --font-display: 'DM Serif Display', serif;
    --font-body: 'DM Sans', sans-serif;

    /* Spacing & Borders */
    --radius-sm: 4px;
    --radius-md: 8px;
    --radius-lg: 16px;
    --shadow: 0 8px 24px rgba(43, 29, 20, 0.06);
}

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    background-color: var(--neutral);
    color: var(--primary);
    font-family: var(--font-body);
    font-size: 1.05rem;
    line-height: 1.7;
    -webkit-font-smoothing: antialiased;
}

h1, h2, h3, h4, h5, h6, .logo {
    font-family: var(--font-display);
    font-weight: 400;
    color: var(--primary);
}

h1 {
    font-size: 2.75rem;
    margin-bottom: 24px;
}

h2 {
    font-size: 2rem;
    margin-bottom: 16px;
}

a {
    color: var(--primary);
    text-decoration: underline;
    text-decoration-color: var(--secondary);
    text-underline-offset: 4px;
}

a:hover {
    color: var(--tertiary);
    text-decoration-color: var(--tertiary);
}

/* Header & Nav */
.header-main {
    background-color: var(--surface);
    color: var(--primary);
    display: flex;
    align-items: center;
    padding: 16px 32px;
    gap: 32px;
    border-bottom: 1px solid rgba(139, 111, 91, 0.2);
}

.logo {
    font-size: 2rem;
    color: var(--primary);
    text-decoration: none;
    letter-spacing: -0.015em;
}

.search-bar-container {
    flex-grow: 1;
    display: flex;
    height: 48px;
    border-radius: var(--radius-md);
    overflow: hidden;
    border: 1px solid var(--secondary);
    background-color: var(--on-primary);
}

.search-bar-container input {
    flex-grow: 1;
    padding: 12px 16px;
    border: none;
    outline: none;
    font-size: 1.05rem;
    font-family: var(--font-body);
    background: transparent;
    color: var(--primary);
}

.search-btn {
    background-color: var(--surface);
    border: none;
    border-left: 1px solid var(--secondary);
    padding: 0 24px;
    cursor: pointer;
    transition: background-color 0.2s;
    color: var(--primary);
}

.search-btn:hover {
    background-color: #f0e6d6;
}

.nav-links {
    display: flex;
    gap: 24px;
    align-items: center;
}

.nav-links a {
    text-decoration: none;
    font-weight: 500;
}

.sub-nav {
    background-color: var(--surface);
    padding: 12px 32px;
    display: flex;
    gap: 16px;
    flex-wrap: wrap;
    justify-content: center;
    border-bottom: 1px solid rgba(139, 111, 91, 0.1);
}

.sub-nav a {
    text-decoration: none;
    font-size: 0.95rem;
    color: var(--secondary);
    padding: 8px 16px;
    border-radius: var(--radius-sm);
    transition: all 0.2s;
}

.sub-nav a:hover, .sub-nav a.active {
    color: var(--on-primary);
    background-color: var(--tertiary);
}

.price-filter-form {
    display: flex;
    align-items: center;
    gap: 8px;
    margin-left: auto;
}

.price-filter-form input {
    width: 120px;
    padding: 6px 12px;
    border: 1px solid var(--secondary);
    border-radius: var(--radius-sm);
    background: transparent;
    color: var(--primary);
}

.price-filter-form button {
    background-color: var(--secondary);
    color: var(--on-primary);
    border: none;
    border-radius: var(--radius-sm);
    padding: 6px 16px;
    cursor: pointer;
    font-weight: 500;
}

/* Hero Section */
.hero-section {
    width: 100%;
    padding: 100px 32px;
    background-color: var(--surface);
    background-image: linear-gradient(rgba(251, 244, 231, 0.8), rgba(251, 244, 231, 0.8)), url('images/hero_bg.png');
    background-size: cover;
    background-position: center;
    text-align: center;
    border-bottom: 1px solid rgba(139, 111, 91, 0.2);
    margin-bottom: 48px;
}

.hero-content h1 {
    font-size: 4.5rem;
    letter-spacing: -0.015em;
    margin-bottom: 16px;
}

.hero-content p {
    font-size: 1.2rem;
    color: var(--secondary);
    max-width: 600px;
    margin: 0 auto;
}

/* Product Grid */
.container {
    max-width: 1440px;
    margin: 0 auto;
    padding: 0 32px 64px 32px;
}

.product-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(380px, 1fr));
    gap: 48px;
}

.product-card {
    background-color: var(--surface);
    border-radius: var(--radius-lg);
    padding: 24px;
    display: flex;
    flex-direction: column;
    position: relative;
    border: 1px solid rgba(139, 111, 91, 0.1);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.product-card:hover {
    transform: translateY(-8px);
    box-shadow: var(--shadow);
}

.product-image {
    width: 100%;
    height: 260px; /* Slightly taller to accommodate varying sizes */
    object-fit: contain; /* Shows the FULL image without cutting it in half */
    margin-bottom: 24px;
    border-radius: var(--radius-md);
    background-color: transparent;
    mix-blend-mode: multiply; /* Elegantly blends white image backgrounds into the card surface */
}

.product-title {
    font-family: var(--font-display);
    font-size: 1.5rem;
    margin-bottom: 8px;
    color: var(--primary);
}

.product-brand {
    font-size: 0.85rem;
    letter-spacing: 0.1em;
    text-transform: uppercase;
    color: var(--secondary);
    margin-bottom: 8px;
}

.product-description {
    font-size: 0.95rem;
    color: var(--secondary);
    line-height: 1.5;
    margin-bottom: 24px;
    flex-grow: 1; /* This elegantly pushes the price and button to the bottom */
}

.product-price {
    font-size: 1.5rem;
    font-family: var(--font-display);
    margin-bottom: 24px;
    color: var(--primary);
}

/* Buttons & Inputs */
.buy-btn, .btn-primary {
    background-color: var(--tertiary);
    color: var(--on-primary);
    border: none;
    border-radius: var(--radius-md);
    padding: 12px 20px;
    font-size: 1rem;
    font-family: var(--font-body);
    font-weight: 500;
    cursor: pointer;
    transition: opacity 0.2s;
    width: 100%;
    text-align: center;
    text-decoration: none;
}

.buy-btn:hover, .btn-primary:hover {
    opacity: 0.9;
    text-decoration: none;
}

input[type="number"] {
    background: transparent;
    border: 1px solid var(--secondary);
    border-radius: var(--radius-md);
    color: var(--primary);
    font-family: var(--font-body);
}

/* Forms */
.form-container {
    max-width: 480px;
    margin: 64px auto;
    background: var(--surface);
    padding: 48px;
    border-radius: var(--radius-lg);
    border: 1px solid rgba(139, 111, 91, 0.1);
}

.form-container h2 {
    font-family: var(--font-display);
    font-size: 2.75rem;
    text-align: center;
    margin-bottom: 32px;
}

.form-group {
    margin-bottom: 24px;
}

.form-group label {
    display: block;
    margin-bottom: 8px;
    font-size: 0.75rem;
    letter-spacing: 0.1em;
    text-transform: uppercase;
    color: var(--secondary);
}

.form-group input, .form-group textarea {
    width: 100%;
    padding: 12px 16px;
    border: 1px solid var(--secondary);
    border-radius: var(--radius-sm);
    font-size: 1.05rem;
    font-family: var(--font-body);
    background-color: transparent;
    color: var(--primary);
}

.form-group input:focus, .form-group textarea:focus {
    border-color: var(--tertiary);
    outline: none;
}

.error-msg {
    color: #A33A3A;
    font-size: 0.9rem;
    margin-bottom: 24px;
    padding: 12px;
    background-color: rgba(163, 58, 58, 0.1);
    border-radius: var(--radius-sm);
}

.success-msg {
    color: #3A7A50;
    font-size: 0.9rem;
    margin-bottom: 24px;
    padding: 12px;
    background-color: rgba(58, 122, 80, 0.1);
    border-radius: var(--radius-sm);
}
    </style>
</head>
<body>

    <!-- Header Navigation -->
    <header class="header-main">
        <a href="home" class="logo">Fashion Fusion</a>
        
        <form action="home#products-grid" method="GET" class="search-bar-container">
            <input type="text" name="search" placeholder="Search the store..." value="${searchQuery}">
            <button type="submit" class="search-btn">Search</button>
        </form>

        <div class="nav-links">
            <c:choose>
                <c:when test="${not empty sessionScope.user}">
                    <span>Welcome, ${sessionScope.user.fullName}</span>
                    <a href="cart">Cart</a>
                    <a href="#">Orders</a>
                    <a href="login.jsp">Logout</a>
                </c:when>
                <c:otherwise>
                    <a href="login.jsp">Login / Sign Up</a>
                </c:otherwise>
            </c:choose>
        </div>
    </header>

    <!-- Sub Navigation -->
    <div class="sub-nav">
        <a href="home#products-grid" class="${empty selectedCategory ? 'active' : ''}">All Products</a>
        <c:forEach var="cat" items="${categories}">
            <a href="home?category=${cat}#products-grid" class="${selectedCategory == cat ? 'active' : ''}">${cat}</a>
        </c:forEach>
        
        <form action="home#products-grid" method="GET" class="price-filter-form">
            <c:if test="${not empty selectedCategory}">
                <input type="hidden" name="category" value="${selectedCategory}">
            </c:if>
            <input type="number" name="maxPrice" placeholder="Max Price (₹)" value="${maxPrice}">
            <button type="submit">Filter</button>
        </form>
    </div>

    <!-- Hero Section -->
    <div class="hero-section">
        <div class="hero-content">
            <h1>Sun-baked essentials.</h1>
            <p>Discover our curated collection of goods built for slow, intentional living. Browse below or search for exactly what you need.</p>
        </div>
    </div>

    <!-- Main Content Grid -->
    <div class="container" id="products-grid">
        
        <c:if test="${not empty searchQuery}">
            <h2 style="margin-bottom: 20px;">Search results for: "${searchQuery}"</h2>
        </c:if>

        <div class="product-grid">
            <c:forEach var="product" items="${products}">
                <div class="product-card">
                    <!-- Fetch image directly from database BLOB via ImageServlet -->
                    <img src="productImage?id=${product.productId}" alt="${product.productName}" class="product-image" onerror="this.src='https://via.placeholder.com/200x200?text=${product.category}'">
                    
                    <div class="product-title">${product.productName}</div>
                    <div class="product-brand">${product.brand}</div>
                    <div class="product-description">
                        <c:choose>
                            <c:when test="${not empty product.description}">
                                ${product.description}
                            </c:when>
                            <c:otherwise>
                                A premium quality product designed for modern living.
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="product-price">₹${product.price}</div>
                    
                    <!-- Calculate qty in cart -->
                    <c:set var="qtyInCart" value="0" />
                    <c:forEach var="cartItem" items="${cartItems}">
                        <c:if test="${cartItem.productId == product.productId}">
                            <c:set var="qtyInCart" value="${cartItem.quantity}" />
                        </c:if>
                    </c:forEach>

                    <div class="buy-section">
                        <c:choose>
                            <c:when test="${empty sessionScope.user}">
                                <a href="register.jsp" class="btn-primary" style="display:block; padding:12px; margin-top:auto;">Add to Cart</a>
                            </c:when>
                            <c:when test="${qtyInCart > 0}">
                                <form id="form_${product.productId}" action="cart" method="POST">
                                    <input type="hidden" name="action" value="update">
                                    <input type="hidden" name="productId" value="${product.productId}">
                                    <div style="display: flex; gap: 10px; align-items: center; margin-top: 5px;">
                                        <input type="number" name="quantity" value="${qtyInCart}" min="0" style="width: 60px; padding: 8px; text-align: center; border: 1px solid #a6a6a6; border-radius: 4px; font-size: 14px;">
                                        <button type="submit" class="buy-btn" style="padding: 8px 15px; flex-grow: 1;">Update</button>
                                    </div>
                                </form>
                            </c:when>
                            <c:otherwise>
                                <form action="cart" method="POST">
                                    <input type="hidden" name="action" value="add">
                                    <input type="hidden" name="productId" value="${product.productId}">
                                    <button type="submit" class="buy-btn">Add to Cart</button>
                                </form>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </c:forEach>
            
            <c:if test="${empty products}">
                <div style="grid-column: 1 / -1; text-align: center; padding: 40px;">
                    <h3>No products found.</h3>
                </div>
            </c:if>
        </div>
    </div>
</body>
</html>
