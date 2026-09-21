package com.udhaya.udhayamart.controller;

import com.udhaya.udhayamart.dao.CartDAO;
import com.udhaya.udhayamart.dao.OrderDAO;
import com.udhaya.udhayamart.model.CartItem;
import com.udhaya.udhayamart.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/place-order")
public class PlaceOrderServlet extends HttpServlet {

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

        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String pincode = request.getParameter("pincode");
        String phone = request.getParameter("phone");

        CartDAO cartDAO = new CartDAO();

        List<CartItem> cartItems =
                cartDAO.getCartItems(user.getUserId());

        if (cartItems == null || cartItems.isEmpty()) {
            response.sendRedirect(
                    request.getContextPath() + "/cart");
            return;
        }

        OrderDAO orderDAO = new OrderDAO();

        int orderId = orderDAO.placeOrder(
                user.getUserId(),
                user.getName(),
                phone,
                address,
                city,
                state,
                pincode,
                cartItems
        );

        if (orderId > 0) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/order-confirmed?id=" + orderId);

        } else {

            response.sendRedirect(
                    request.getContextPath()
                    + "/checkout");
        }
    }
}