package com.udhaya.udhayamart.controller;

import com.udhaya.udhayamart.dao.ProductDAO;
import com.udhaya.udhayamart.model.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/admin/edit-product")
public class AdminEditProductServlet extends HttpServlet {

    private ProductDAO productDAO;

    @Override
    public void init() {
        productDAO = new ProductDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            int productId = Integer.parseInt(
                    request.getParameter("id"));

            Product product =
                    productDAO.getProductById(productId);

            request.setAttribute("product", product);

            request.getRequestDispatcher(
                    "/admin/edit-product.jsp")
                    .forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                    request.getContextPath()
                    + "/admin/products");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        try {

            String productIdParam =
                    request.getParameter("productId");

            String productName =
                    request.getParameter("productName");

            String categoryParam =
                    request.getParameter("categoryId");

            String description =
                    request.getParameter("description");

            String priceParam =
                    request.getParameter("price");

            String stockParam =
                    request.getParameter("stock");

            String image =
                    request.getParameter("image");


            // Required field validation
            if (productIdParam == null
                    || productIdParam.trim().isEmpty()
                    || productName == null
                    || productName.trim().isEmpty()
                    || categoryParam == null
                    || categoryParam.trim().isEmpty()
                    || priceParam == null
                    || priceParam.trim().isEmpty()
                    || stockParam == null
                    || stockParam.trim().isEmpty()) {

                response.sendRedirect(
                        request.getContextPath()
                        + "/admin/products");

                return;
            }


            int productId =
                    Integer.parseInt(productIdParam);

            int categoryId =
                    Integer.parseInt(categoryParam);

            double price =
                    Double.parseDouble(priceParam);

            int stock =
                    Integer.parseInt(stockParam);


            // Price and stock validation
            if (price <= 0 || stock < 0) {

                response.sendRedirect(
                        request.getContextPath()
                        + "/admin/products");

                return;
            }


            // Create product
            Product product = new Product();

            product.setProductId(productId);

            product.setProductName(
                    productName.trim());

            product.setCategoryId(categoryId);

            product.setDescription(description);

            product.setPrice(price);

            product.setStock(stock);

            product.setImage(image);


            // Update product
            productDAO.updateProduct(product);


            response.sendRedirect(
                    request.getContextPath()
                    + "/admin/products");

        } catch (NumberFormatException e) {

            e.printStackTrace();

            response.sendRedirect(
                    request.getContextPath()
                    + "/admin/products");

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                    request.getContextPath()
                    + "/admin/products");
        }
    }
}