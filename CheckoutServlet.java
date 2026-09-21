package com.udhaya.udhayamart.controller;

import com.udhaya.udhayamart.model.User;
import com.udhaya.udhayamart.dao.CartDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("user/login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");

        request.setAttribute("user", user);

        // Get cart items for the logged-in user
        CartDAO cartDAO = new CartDAO();
        request.setAttribute("cartItems",
                cartDAO.getCartItems(user.getUserId()));

        request.getRequestDispatcher("user/checkout.jsp")
               .forward(request, response);
    }
}