package com.udhaya.udhayamart.controller;

import com.udhaya.udhayamart.dao.CartDAO;
import com.udhaya.udhayamart.dao.ProductDAO;
import com.udhaya.udhayamart.model.Product;
import com.udhaya.udhayamart.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/add-to-cart")
public class AddToCartServlet extends HttpServlet {

    private final CartDAO cartDAO = new CartDAO();
    private final ProductDAO productDAO = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("user/login.jsp");
            return;
        }

        String productIdParameter =
                request.getParameter("id");

        if (productIdParameter == null
                || productIdParameter.trim().isEmpty()) {

            response.sendRedirect("products");
            return;
        }

        try {

            User user =
                    (User) session.getAttribute("user");

            int productId =
                    Integer.parseInt(productIdParameter);

            Product product =
                    productDAO.getProductById(productId);

            if (product == null) {

                response.sendRedirect("products");
                return;
            }

            // Stock validation
            if (product.getStock() <= 0) {

                response.sendRedirect(
                        request.getContextPath()
                        + "/products?error=outofstock");

                return;
            }

            cartDAO.addToCart(
                    user.getUserId(),
                    productId
            );

            response.sendRedirect(
                    request.getContextPath()
                    + "/cart"
            );

        } catch (NumberFormatException e) {

            response.sendRedirect("products");

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect("products");
        }
    }
}