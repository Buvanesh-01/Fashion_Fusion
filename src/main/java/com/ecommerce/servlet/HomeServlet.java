package com.ecommerce.servlet;

import com.ecommerce.dao.CartDAO;
import com.ecommerce.dao.ProductDAO;
import com.ecommerce.model.CartItem;
import com.ecommerce.model.Product;
import com.ecommerce.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/home")
public class HomeServlet extends HttpServlet {
    private ProductDAO productDAO = new ProductDAO();
    private CartDAO cartDAO = new CartDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        User user = null;
        if (session != null && session.getAttribute("user") != null) {
            user = (User) session.getAttribute("user");
        }
        String search = request.getParameter("search");
        String category = request.getParameter("category");
        String maxPriceStr = request.getParameter("maxPrice");
        
        Double maxPrice = null;
        if (maxPriceStr != null && !maxPriceStr.trim().isEmpty()) {
            try {
                maxPrice = Double.parseDouble(maxPriceStr.trim());
            } catch (NumberFormatException e) {
                // Ignore invalid price
            }
        }
        
        List<Product> products;
        if (search != null && !search.trim().isEmpty()) {
            products = productDAO.searchProducts(search.trim());
            request.setAttribute("searchQuery", search.trim());
        } else if ((category != null && !category.isEmpty()) || maxPrice != null) {
            products = productDAO.filterProducts(category, maxPrice);
            request.setAttribute("selectedCategory", category);
            request.setAttribute("maxPrice", maxPrice);
        } else {
            products = productDAO.getAllProducts();
        }
        
        List<String> categories = productDAO.getAllCategories();
        request.setAttribute("categories", categories);
        
        java.util.List<CartItem> cartItems = new java.util.ArrayList<>();
        if (user != null) {
            cartItems = cartDAO.getCartItems(user.getUserId());
        }
        
        request.setAttribute("products", products);
        request.setAttribute("cartItems", cartItems);
        
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}
