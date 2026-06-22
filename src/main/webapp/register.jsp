<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Registration</title>
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
    color: white;
    font-size: 0.95rem;
    font-weight: 500;
    margin-bottom: 24px;
    padding: 16px;
    background-color: #3A7A50;
    border-radius: var(--radius-sm);
    display: flex;
    align-items: center;
    gap: 8px;
}
    </style>
</head>
<body style="background-color: var(--neutral);">

    <div class="form-container">
        <h2>Registration Form</h2>
        
        <% if(request.getParameter("error") != null) { %>
            <div class="error-msg"><%= request.getParameter("error") %></div>
        <% } %>
        <% if(request.getParameter("success") != null) { %>
            <div class="success-msg">
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round">
                    <polyline points="20 6 9 17 4 12"></polyline>
                </svg>
                <%= request.getParameter("success") %>
            </div>
            
            <div style="margin-bottom: 24px; text-align: center;">
                <a href="login.jsp" style="font-weight: 700; font-size: 1.1rem;">Click here to go to the Login Page</a>
            </div>
        <% } else { %>

        <form action="register" method="POST">
            <div class="form-group">
                <label for="fullName">Full Name</label>
                <input type="text" id="fullName" name="fullName" required>
            </div>
            
            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" id="email" name="email" required>
            </div>
            
            <div class="form-group">
                <label for="phone">Phone Number</label>
                <input type="text" id="phone" name="phone" required>
            </div>
            
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>
            
            <div class="form-group">
                <label for="address">Shipping Address</label>
                <textarea id="address" name="address" rows="3" required></textarea>
            </div>
            <button type="submit" class="btn-primary">Register</button>
        </form>
        <% } %>
        
        <div style="margin-top: 32px; text-align: center; font-size: 0.9rem;">
            <a href="login.jsp" style="color: var(--secondary); text-decoration: none;">Already have an account? Sign in.</a>
        </div>
    </div>

</body>
</html>
