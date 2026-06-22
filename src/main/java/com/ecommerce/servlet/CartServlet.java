package com.ecommerce.servlet;

import com.ecommerce.dao.CartDAO;
import com.ecommerce.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
    private CartDAO cartDAO = new CartDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
            
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("register.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");
        String action = request.getParameter("action");
        int productId = Integer.parseInt(request.getParameter("productId"));

        try {
            if ("add".equals(action)) {
                cartDAO.addToCart(user.getUserId(), productId, 1);
            } else if ("update".equals(action)) {
                int quantity = Integer.parseInt(request.getParameter("quantity"));
                cartDAO.updateCartQuantity(user.getUserId(), productId, quantity);
            } else if ("remove".equals(action)) {
                cartDAO.removeFromCart(user.getUserId(), productId);
            }
            // Use redirect to home to refresh the page after modifying cart.
            // Or we could return JSON and use AJAX. The user asked for "Buy Now button... modify that... decrease quantity".
            // A redirect is simpler but let's use a redirect to the referring page.

            String referer = request.getHeader("Referer");
            if(referer != null) {
                response.sendRedirect(referer);
            } else {
                response.sendRedirect("home");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");
        java.util.List<com.ecommerce.model.CartItem> cartItems = cartDAO.getCartItems(user.getUserId());
        request.setAttribute("cartItems", cartItems);
        
        java.math.BigDecimal totalAmount = java.math.BigDecimal.ZERO;
        for (com.ecommerce.model.CartItem item : cartItems) {
            if (item.getProduct() != null && item.getProduct().getPrice() != null) {
                java.math.BigDecimal itemTotal = item.getProduct().getPrice().multiply(new java.math.BigDecimal(item.getQuantity()));
                totalAmount = totalAmount.add(itemTotal);
            }
        }
        request.setAttribute("totalAmount", totalAmount);
        
        request.getRequestDispatcher("cart.jsp").forward(request, response);
    }
}
