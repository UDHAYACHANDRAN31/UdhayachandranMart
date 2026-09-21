<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.udhaya.udhayamart.model.Product" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Manage Products - UDHAYAMART</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">
</head>

<body class="shop-page">

<header class="shop-header">

    <div class="shop-logo">
        <div class="shop-logo-icon">U</div>

        <h1>UDHAYA<span>MART</span></h1>
    </div>

    <div class="header-actions">

        <span class="header-link">Admin</span>

        <a href="${pageContext.request.contextPath}/logout"
           class="logout-btn">
            Logout
        </a>

    </div>

</header>


<main class="shop-main">

    <div class="section-heading">

        <div>

            <div class="section-label">
                ADMIN
            </div>

            <h2>
                Manage Products
            </h2>

            <p>
                View and manage your store products
            </p>

        </div>

    </div>


    <div class="checkout-card">

        <div class="checkout-card-header">

            <h3>
                Products
            </h3>

            <p>
                All products in your store
            </p>

        </div>


        <div style="overflow-x:auto;">

            <table style="width:100%; border-collapse:collapse;">

                <thead>

                <tr>

                    <th style="padding:12px; text-align:left;">
                        ID
                    </th>

                    <th style="padding:12px; text-align:left;">
                        Product
                    </th>

                    <th style="padding:12px; text-align:left;">
                        Price
                    </th>

                    <th style="padding:12px; text-align:left;">
                        Stock
                    </th>

                    <th style="padding:12px; text-align:left;">
                        Action
                    </th>

                </tr>

                </thead>


                <tbody>

                <%
                    List<Product> products =
                        (List<Product>) request.getAttribute("products");

                    if (products != null && !products.isEmpty()) {

                        for (Product product : products) {
                %>

                <tr>

                    <td style="padding:12px;">
                        <%= product.getProductId() %>
                    </td>

                    <td style="padding:12px;">
                        <%= product.getProductName() %>
                    </td>

                    <td style="padding:12px;">
                        ₹<%= String.format("%.2f", product.getPrice()) %>
                    </td>

                    <td style="padding:12px;">
                        <%= product.getStock() %>
                    </td>

                    <td style="padding:12px;">

                        <a href="${pageContext.request.contextPath}/admin/edit-product?id=<%= product.getProductId() %>"
   class="primary-btn">
    Edit
</a>

                        <a href="${pageContext.request.contextPath}/admin/delete-product?id=<%= product.getProductId() %>"
   class="primary-btn"
   onclick="return confirm('Are you sure you want to delete this product?');">
    Delete
</a>

                    </td>

                </tr>

                <%
                        }

                    } else {
                %>

                <tr>

                    <td colspan="5"
                        style="padding:30px; text-align:center;">

                        No products found.

                    </td>

                </tr>

                <%
                    }
                %>

                </tbody>

            </table>

        </div>

    </div>


    <br>


    <a href="${pageContext.request.contextPath}/admin/add-product"
       class="primary-btn">

        + Add Product

    </a>


</main>


<footer class="shop-footer">

    <div class="footer-brand">

        <h2>
            UDHAYAMART
        </h2>

        <p>
            Admin Management Panel
        </p>

    </div>

    <div class="footer-copy">

        © 2026 UDHAYAMART. All rights reserved.

    </div>

</footer>

</body>
</html>