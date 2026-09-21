package com.udhaya.udhayamart.controller;

import com.udhaya.udhayamart.dao.ProductDAO;
import com.udhaya.udhayamart.dao.UserDAO;
import com.udhaya.udhayamart.dao.OrderDAO;
import com.udhaya.udhayamart.model.Order;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/dashboard")
public class AdminDashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        UserDAO userDAO = new UserDAO();
        ProductDAO productDAO = new ProductDAO();
        OrderDAO orderDAO = new OrderDAO();

        int userCount = userDAO.getUserCount();

        int productCount = productDAO.getProductCount();

        List<Order> orders = orderDAO.getAllOrders();

        int orderCount = orders.size();

        double totalSales = 0;

        for (Order order : orders) {
            totalSales += order.getTotalAmount();
        }

        request.setAttribute("userCount", userCount);
        request.setAttribute("productCount", productCount);
        request.setAttribute("orderCount", orderCount);
        request.setAttribute("totalSales", totalSales);

        request.getRequestDispatcher("/admin/dashboard.jsp")
               .forward(request, response);
    }
}