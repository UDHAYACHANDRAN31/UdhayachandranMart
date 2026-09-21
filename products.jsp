<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.udhaya.udhayamart.model.Product" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>UDHAYAMART - Products</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>

<body class="shop-page">

<header class="shop-header">

    <div class="shop-logo">

        <div class="shop-logo-icon">
            U
        </div>

        <h1>
            UDHAYA<span>MART</span>
        </h1>

    </div>

    <form action="${pageContext.request.contextPath}/products"
      method="get"
      class="search-box">

    <span>⌕</span>

    <input
        type="text"
        name="search"
        value="<%= request.getParameter("search") != null
                ? request.getParameter("search")
                : "" %>"
        placeholder="Search for products, brands and more..."
    >

</form>
    <div class="header-actions">

        <a href="home.jsp" class="header-link">
            Home
        </a>

        <a href="#" class="header-link">
            Wishlist
        </a>

        <a href="#" class="cart-link">
            🛒
            <span class="cart-count">0</span>
        </a>

        <a href="${pageContext.request.contextPath}/logout"
   class="logout-btn">
    Logout
</a>

    </div>

</header>


<nav class="category-nav">

    <a href="products.jsp">All Products</a>

    <a href="#">Electronics</a>

    <a href="#">Fashion</a>

    <a href="#">Home & Kitchen</a>

    <a href="#">Mobiles</a>

    <a href="#">Beauty</a>

    <a href="#">Offers</a>

</nav>


<main class="shop-main">

    <section class="content-section">

        <div class="section-heading">

            <div>

                <div class="section-label">
                    UDHAYAMART STORE
                </div>

                <h2>
                    All Products
                </h2>

            </div>

        </div>

        <form action="${pageContext.request.contextPath}/products"
      method="get"
      style="margin: 20px 0;">

    <select name="category"
            onchange="this.form.submit()"
            style="padding: 10px 15px;
                   border-radius: 6px;
                   border: 1px solid #ccc;">

        <option value="">All Categories</option>

        <%
            java.util.Map<Integer, String> categories =
                (java.util.Map<Integer, String>)
                request.getAttribute("categories");

            String selectedCategory =
                request.getParameter("category");
        %>

        <% if (categories != null) {
            for (java.util.Map.Entry<Integer, String> entry
                    : categories.entrySet()) { %>

            <option value="<%= entry.getKey() %>"
                <%= String.valueOf(entry.getKey()).equals(selectedCategory)
                    ? "selected"
                    : "" %>>

                <%= entry.getValue() %>

            </option>

        <%  }
           } %>

    </select>

</form>
<form action="${pageContext.request.contextPath}/products"
      method="get"
      style="margin: 20px 0;">

    <input type="number"
           name="minPrice"
           placeholder="Min Price"
           min="0"
           step="0.01"
           style="padding:10px;">

    <input type="number"
           name="maxPrice"
           placeholder="Max Price"
           min="0"
           step="0.01"
           style="padding:10px;">

    <button type="submit"
            class="primary-btn">
        Filter Price
    </button>

</form>
       <form action="${pageContext.request.contextPath}/products"
      method="get"
      style="margin: 20px 0;">

    <select name="sort"
            onchange="this.form.submit()"
            style="padding:10px 15px;
                   border-radius:6px;
                   border:1px solid #ccc;">

        <option value="">Sort Products</option>
        <option value="low">Price: Low to High</option>
        <option value="high">Price: High to Low</option>
        <option value="name">Name: A to Z</option>

    </select>

</form>

        <div class="product-grid">

            <%
                List<Product> products =
                    (List<Product>) request.getAttribute("products");

                if (products != null && !products.isEmpty()) {

                    for (Product product : products) {
            %>

                <a href="product-details?id=<%= product.getProductId() %>" class="product-card"></a>

                    <div class="product-image">

                        <%
                            if (product.getImage() != null
                                    && !product.getImage().isEmpty()) {
                        %>

                            <img
                                src="<%= product.getImage() %>"
                                alt="<%= product.getProductName() %>"
                                style="max-width: 100%; max-height: 180px;"
                            >

                        <%
                            } else {
                        %>

                            <span>Product</span>

                        <%
                            }
                        %>

                    </div>


                    <div class="product-info">

                        <div class="product-category">
                            Product
                        </div>

                        <h3>
                        <a href="product-details?id=<%= product.getProductId() %>">
        <%= product.getProductName() %>
    </a>
</h3>
                        <p>
                            <%= product.getDescription() %>
                        </p>

                        <div class="product-bottom">

                            <strong>
                                ₹<%= product.getPrice() %>
                            </strong>

                            <span>
                                Stock: <%= product.getStock() %>
                            </span>

                        </div>

                    </div>

                </div>

            <%
                    }

                } else {
            %>

                <div class="offer-section">

                    <h2>
                        No products available
                    </h2>

                    <p>
                        Products will appear here once they are added.
                    </p>

                </div>

            <%
                }
            %>

        </div>

    </section>

</main>


<footer class="shop-footer">

    <div class="footer-brand">

        <h2>
            UDHAYAMART
        </h2>

        <p>
            Your modern online shopping destination.
        </p>

    </div>

    <div class="footer-copy">

        © 2026 UDHAYAMART. All rights reserved.

    </div>

</footer>

</body>
</html>