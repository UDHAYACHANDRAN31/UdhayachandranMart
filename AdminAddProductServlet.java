package com.udhaya.udhayamart.controller;

import com.udhaya.udhayamart.dao.ProductDAO;
import com.udhaya.udhayamart.model.Product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/admin/add-product")
public class AdminAddProductServlet extends HttpServlet {

    private ProductDAO productDAO;

    @Override
    public void init() {
        productDAO = new ProductDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("/admin/add-product.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        try {

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
            if (productName == null
                    || productName.trim().isEmpty()
                    || categoryParam == null
                    || categoryParam.trim().isEmpty()
                    || priceParam == null
                    || priceParam.trim().isEmpty()
                    || stockParam == null
                    || stockParam.trim().isEmpty()) {

                response.sendRedirect(
                        request.getContextPath()
                        + "/admin/add-product?error=required");

                return;
            }


            // Convert values
            double price =
                    Double.parseDouble(priceParam);

            int stock =
                    Integer.parseInt(stockParam);

            int categoryId =
                    Integer.parseInt(categoryParam);


            // Price and stock validation
            if (price <= 0 || stock < 0) {

                response.sendRedirect(
                        request.getContextPath()
                        + "/admin/add-product?error=invalid");

                return;
            }


            // Create product
            Product product = new Product();

            product.setProductName(
                    productName.trim());

            product.setCategoryId(
                    categoryId);

            product.setDescription(
                    description);

            product.setPrice(
                    price);

            product.setStock(
                    stock);

            product.setImage(
                    image);


            // Save product
            boolean success =
                    productDAO.addProduct(product);


            if (success) {

                response.sendRedirect(
                        request.getContextPath()
                        + "/admin/products");

            } else {

                response.sendRedirect(
                        request.getContextPath()
                        + "/admin/add-product?error=failed");
            }


        } catch (NumberFormatException e) {

            e.printStackTrace();

            response.sendRedirect(
                    request.getContextPath()
                    + "/admin/add-product?error=invalid");

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                    request.getContextPath()
                    + "/admin/add-product?error=failed");
        }
    }
}