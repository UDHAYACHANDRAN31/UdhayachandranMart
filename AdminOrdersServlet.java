package com.udhaya.udhayamart.controller;

import com.udhaya.udhayamart.dao.OrderDAO;
import com.udhaya.udhayamart.model.Order;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/orders")
public class AdminOrdersServlet extends HttpServlet {

    private OrderDAO orderDAO;

    @Override
    public void init() {
        orderDAO = new OrderDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        List<Order> orders = orderDAO.getAllOrders();

        request.setAttribute("orders", orders);

        request.getRequestDispatcher("/admin/orders.jsp")
               .forward(request, response);
    }
}