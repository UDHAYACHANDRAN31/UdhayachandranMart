
package com.udhaya.udhayamart.controller;

import com.udhaya.udhayamart.dao.CartDAO;
import com.udhaya.udhayamart.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/remove-cart-item")
public class RemoveCartItemServlet extends HttpServlet {

    private final CartDAO cartDAO = new CartDAO();

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("user/login.jsp");
            return;
        }

        String cartItemIdParameter = request.getParameter("id");

        if (cartItemIdParameter == null || cartItemIdParameter.isEmpty()) {
            response.sendRedirect("cart");
            return;
        }

        try {
            int cartItemId = Integer.parseInt(cartItemIdParameter);

            cartDAO.removeCartItem(cartItemId);

            response.sendRedirect("cart");

        } catch (NumberFormatException e) {
            response.sendRedirect("cart");
        }
    }
}