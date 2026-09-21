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

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

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

        CartDAO cartDAO = new CartDAO();

        request.setAttribute("user", user);

        request.setAttribute(
                "cartItems",
                cartDAO.getCartItems(user.getUserId())
        );

        request.getRequestDispatcher("user/cart.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("user/login.jsp");
            return;
        }

        try {

            User user = (User) session.getAttribute("user");

            String action = request.getParameter("action");

            int productId = Integer.parseInt(
                    request.getParameter("productId")
            );

            CartDAO cartDAO = new CartDAO();

            if ("update".equals(action)) {

                int quantity = Integer.parseInt(
                        request.getParameter("quantity")
                );

                if (quantity > 0) {

                    cartDAO.updateCartQuantity(
                            user.getUserId(),
                            productId,
                            quantity
                    );

                } else {

                    cartDAO.removeFromCart(
                            user.getUserId(),
                            productId
                    );
                }

            } else if ("remove".equals(action)) {

                cartDAO.removeFromCart(
                        user.getUserId(),
                        productId
                );
            }

            response.sendRedirect(
                    request.getContextPath() + "/cart"
            );

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                    request.getContextPath() + "/cart"
            );
        }
    }
}