package com.udhaya.udhayamart.controller;

import com.udhaya.udhayamart.dao.WishlistDAO;
import com.udhaya.udhayamart.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/wishlist")
public class WishlistServlet extends HttpServlet {
@Override
protected void doGet(HttpServletRequest request,
                     HttpServletResponse response)
        throws ServletException, IOException {

    HttpSession session = request.getSession(false);

    if (session == null || session.getAttribute("user") == null) {
        response.sendRedirect(
                request.getContextPath() + "/user/login.jsp");
        return;
    }

    User user = (User) session.getAttribute("user");

    WishlistDAO wishlistDAO = new WishlistDAO();

    request.setAttribute(
            "wishlist",
            wishlistDAO.getWishlist(user.getUserId())
    );

    request.getRequestDispatcher("/user/wishlist.jsp")
           .forward(request, response);
}
    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(
                    request.getContextPath() + "/user/login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");

        String productIdParam =
                request.getParameter("productId");

        if (productIdParam == null) {
            response.sendRedirect(
                    request.getContextPath() + "/products");
            return;
        }

        int productId =
                Integer.parseInt(productIdParam);

        WishlistDAO wishlistDAO =
                new WishlistDAO();

        wishlistDAO.addToWishlist(
                user.getUserId(),
                productId);

        response.sendRedirect(
                request.getContextPath() + "/wishlist");
    }
}