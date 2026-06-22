<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Fashion Fusion - Cart</title>
    <style>
@import url('https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;700&family=DM+Serif+Display&display=swap');

:root {
    --primary: #2B1D14;
    --secondary: #8B6F5B;
    --tertiary: #C56A3C;
    --neutral: #F3E8D8;
    --surface: #FBF4E7;
    --on-primary: #FBF4E7;

    --font-display: 'DM Serif Display', serif;
    --font-body: 'DM Sans', sans-serif;

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

.nav-links {
    display: flex;
    gap: 24px;
    align-items: center;
    margin-left: auto;
}

.nav-links a {
    text-decoration: none;
    font-weight: 500;
}

.container {
    max-width: 1000px;
    margin: 48px auto;
    padding: 0 32px;
}

.cart-container {
    background: var(--surface);
    border-radius: var(--radius-lg);
    padding: 32px;
    border: 1px solid rgba(139, 111, 91, 0.1);
    box-shadow: var(--shadow);
}

.cart-header {
    border-bottom: 1px solid rgba(139, 111, 91, 0.2);
    padding-bottom: 16px;
    margin-bottom: 24px;
}

.cart-item {
    display: flex;
    align-items: center;
    padding: 24px 0;
    border-bottom: 1px solid rgba(139, 111, 91, 0.1);
    gap: 24px;
}

.cart-item:last-child {
    border-bottom: none;
}

.cart-item-image {
    width: 120px;
    height: 120px;
    object-fit: contain;
    border-radius: var(--radius-md);
    mix-blend-mode: multiply;
}

.cart-item-details {
    flex-grow: 1;
}

.cart-item-title {
    font-family: var(--font-display);
    font-size: 1.5rem;
    margin-bottom: 8px;
}

.cart-item-price {
    font-weight: 500;
    color: var(--secondary);
    font-size: 1.2rem;
}

.cart-item-actions {
    display: flex;
    align-items: center;
    gap: 16px;
}

.qty-input {
    width: 80px;
    padding: 8px;
    text-align: center;
    border: 1px solid var(--secondary);
    border-radius: var(--radius-md);
    background: transparent;
    font-family: var(--font-body);
    font-size: 1rem;
    color: var(--primary);
}

.btn {
    background-color: var(--secondary);
    color: var(--on-primary);
    border: none;
    border-radius: var(--radius-md);
    padding: 10px 20px;
    font-size: 1rem;
    font-family: var(--font-body);
    font-weight: 500;
    cursor: pointer;
    transition: opacity 0.2s;
    text-decoration: none;
    display: inline-block;
}

.btn:hover {
    opacity: 0.9;
    text-decoration: none;
}

.btn-remove {
    background-color: transparent;
    color: #A33A3A;
    border: 1px solid #A33A3A;
}

.btn-remove:hover {
    background-color: rgba(163, 58, 58, 0.1);
    color: #A33A3A;
}

.btn-primary {
    background-color: var(--tertiary);
}

.cart-summary {
    margin-top: 32px;
    padding-top: 32px;
    border-top: 2px solid rgba(139, 111, 91, 0.2);
    text-align: right;
}

.cart-total {
    font-family: var(--font-display);
    font-size: 2.5rem;
    margin-bottom: 24px;
}

.empty-cart {
    text-align: center;
    padding: 64px 0;
}

.empty-cart p {
    margin-bottom: 24px;
    color: var(--secondary);
    font-size: 1.2rem;
}
    </style>
</head>
<body>

    <header class="header-main">
        <a href="home" class="logo">Fashion Fusion</a>
        
        <div class="nav-links">
            <span>Welcome, ${sessionScope.user.fullName}</span>
            <a href="home">Home</a>
            <a href="cart">Cart</a>
            <a href="#">Orders</a>
            <a href="login.jsp">Logout</a>
        </div>
    </header>

    <div class="container">
        <div class="cart-container">
            <div class="cart-header">
                <h2>Your Cart</h2>
            </div>
            
            <c:choose>
                <c:when test="${empty cartItems}">
                    <div class="empty-cart">
                        <h2>Your cart is empty.</h2>
                        <p>Looks like you haven't added anything to your cart yet.</p>
                        <a href="home" class="btn btn-primary">Continue Shopping</a>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="cart-items">
                        <c:forEach var="item" items="${cartItems}">
                            <div class="cart-item">
                                <img src="productImage?id=${item.productId}" alt="${item.product.productName}" class="cart-item-image" onerror="this.src='https://via.placeholder.com/120x120?text=No+Image'">
                                
                                <div class="cart-item-details">
                                    <div class="cart-item-title">${item.product.productName}</div>
                                    <div class="cart-item-price">₹${item.product.price}</div>
                                </div>
                                
                                <div class="cart-item-actions">
                                    <form action="cart" method="POST" style="display: flex; gap: 8px; align-items: center;">
                                        <input type="hidden" name="action" value="update">
                                        <input type="hidden" name="productId" value="${item.productId}">
                                        <input type="number" name="quantity" value="${item.quantity}" min="1" class="qty-input">
                                        <button type="submit" class="btn">Update</button>
                                    </form>
                                    
                                    <form action="cart" method="POST">
                                        <input type="hidden" name="action" value="remove">
                                        <input type="hidden" name="productId" value="${item.productId}">
                                        <button type="submit" class="btn btn-remove">Remove</button>
                                    </form>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    
                    <div class="cart-summary">
                        <div class="cart-total">Total Amount to Pay: ₹${totalAmount}</div>
                        <a href="home" class="btn">Continue Shopping</a>
                        <button class="btn btn-primary" onclick="alert('Proceeding to Checkout...');">Proceed to Checkout</button>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

</body>
</html>
