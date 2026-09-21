<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.udhaya.udhayamart.model.Product" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>My Wishlist - UDHAYAMART</title>

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

        <a href="${pageContext.request.contextPath}/user/home.jsp"
           class="header-link">
            Home
        </a>

        <a href="${pageContext.request.contextPath}/products"
           class="header-link">
            Products
        </a>

        <a href="${pageContext.request.contextPath}/cart"
           class="header-link">
            Cart
        </a>

        <a href="${pageContext.request.contextPath}/my-orders"
           class="header-link">
            My Orders
        </a>

        <a href="${pageContext.request.contextPath}/logout"
           class="logout-btn">
            Logout
        </a>

    </div>

</header>

<main class="shop-main">

    <div class="checkout-card"
         style="max-width:1000px; margin:40px auto;">

        <h2>My Wishlist</h2>

        <%
            List<Product> wishlist =
                (List<Product>) request.getAttribute("wishlist");
        %>

        <% if (wishlist == null || wishlist.isEmpty()) { %>

            <p style="margin-top:25px;">
                Your wishlist is empty.
            </p>

        <% } else { %>

            <div style="margin-top:25px;">

                <% for (Product product : wishlist) { %>

                    <div style="
                        display:flex;
                        align-items:center;
                        justify-content:space-between;
                        padding:15px;
                        margin-bottom:15px;
                        border:1px solid #ddd;
                        border-radius:8px;
                    ">

                        <div>

                            <h3>
                                <%= product.getProductName() %>
                            </h3>

                            <p>
                                ₹<%= String.format("%.2f",
                                    product.getPrice()) %>
                            </p>

                        </div>

                        <a href="${pageContext.request.contextPath}/product-details?id=<%= product.getProductId() %>"
                           class="primary-btn">
                            View Product
                        </a>

                    </div>

                <% } %>

            </div>

        <% } %>

    </div>

</main>

</body>
</html>