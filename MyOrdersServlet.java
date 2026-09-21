package com.udhaya.udhayamart.controller;

import com.udhaya.udhayamart.dao.OrderDAO;
import com.udhaya.udhayamart.model.Order;
import com.udhaya.udhayamart.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/my-orders")
public class MyOrdersServlet extends HttpServlet {

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

        OrderDAO orderDAO = new OrderDAO();

        List<Order> orders =
                orderDAO.getOrdersByUser(user.getUserId());

        request.setAttribute("orders", orders);

        request.getRequestDispatcher("/user/my-orders.jsp")
               .forward(request, response);
    }
}