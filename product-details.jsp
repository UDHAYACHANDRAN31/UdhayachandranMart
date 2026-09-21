<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.udhaya.udhayamart.model.Product" %>

<%
Product product = (Product) request.getAttribute("product");

if (product == null) {
    response.sendRedirect("products");
    return;
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title><%= product.getProductName() %> | UDHAYAMART</title>

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
        <a href="home.jsp" class="header-link">Home</a>
        <a href="products" class="header-link">Products</a>
        <a href="${pageContext.request.contextPath}/wishlist"
   class="header-link">
    Wishlist
</a>
        <a href="#" class="cart-link">Cart</a>
        <a href="../logout" class="logout-btn">Logout</a>
    </div>

</header>

<main class="shop-main">

    <section class="product-details-section">

        <div class="product-details-image">
            <% if (product.getImage() != null && !product.getImage().isEmpty()) { %>

                <img src="<%= product.getImage() %>"
                     alt="<%= product.getProductName() %>">

            <% } else { %>

                <span>Product Image</span>

            <% } %>
        </div>

        <div class="product-details-info">

            <div class="product-category">
                UDHAYAMART PRODUCT
            </div>

            <h1><%= product.getProductName() %></h1>

            <p class="product-details-description">
                <%= product.getDescription() %>
            </p>

            <div class="product-details-price">
                ₹<%= product.getPrice() %>
            </div>

            <div class="product-details-stock">
                Available Stock:
                <strong><%= product.getStock() %></strong>
            </div>

            <div class="product-details-actions">

    <a href="add-to-cart?id=<%= product.getProductId() %>"
       class="primary-btn">
        Add to Cart
    </a>

    <form action="${pageContext.request.contextPath}/wishlist"
          method="post"
          style="display:inline;">

        <input type="hidden"
               name="productId"
               value="<%= product.getProductId() %>">

        <button type="submit" class="primary-btn">
            ♡ Add to Wishlist
        </button>

    </form>

    <a href="products" class="secondary-btn">
        Back to Products
    </a>

</div>

        </div>

    </section>

</main>

<footer class="shop-footer">

    <div class="footer-brand">
        <h2>UDHAYAMART</h2>
        <p>Your modern online shopping destination.</p>
    </div>

    <div class="footer-copy">
        © 2026 UDHAYAMART. All rights reserved.
    </div>

</footer>

</body>
</html>