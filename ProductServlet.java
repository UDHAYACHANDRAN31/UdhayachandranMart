package com.udhaya.udhayamart.controller;

import com.udhaya.udhayamart.dao.ProductDAO;
import com.udhaya.udhayamart.model.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;
import com.udhaya.udhayamart.dao.CategoryDAO;
import java.util.Map;

@WebServlet("/products")
public class ProductServlet extends HttpServlet {

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

     String keyword = request.getParameter("search");
String categoryParam = request.getParameter("category");
String minPriceParam = request.getParameter("minPrice");
String maxPriceParam = request.getParameter("maxPrice");
String sort = request.getParameter("sort");

List<Product> products;

Integer categoryId = null;
Double minPrice = null;
Double maxPrice = null;

if (categoryParam != null && !categoryParam.trim().isEmpty()) {
    categoryId = Integer.parseInt(categoryParam);
}

if (minPriceParam != null && !minPriceParam.trim().isEmpty()) {
    minPrice = Double.parseDouble(minPriceParam);
}

if (maxPriceParam != null && !maxPriceParam.trim().isEmpty()) {
    maxPrice = Double.parseDouble(maxPriceParam);
}

products = productDAO.filterProducts(
        keyword,
        categoryId,
        minPrice,
        maxPrice,
        sort
);

CategoryDAO categoryDAO = new CategoryDAO();

Map<Integer, String> categories =
        categoryDAO.getAllCategories();

request.setAttribute("categories", categories);

        request.setAttribute("products", products);

        request.getRequestDispatcher("user/products.jsp")
               .forward(request, response);
    }
}