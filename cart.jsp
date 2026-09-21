<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.udhaya.udhayamart.model.CartItem" %>
<%@ page import="java.text.DecimalFormat" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>My Cart | UDHAYAMART</title>

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
        <a href="wishlist" class="header-link">Wishlist</a>
        <a href="cart" class="cart-link">Cart</a>
        <a href="${pageContext.request.contextPath}/logout"
   class="logout-btn">
    Logout
</a>
    </div>

</header>

<main class="shop-main">

    <section class="content-section">

        <div class="section-heading">
            <div>
                <div class="section-label">UDHAYAMART STORE</div>
                <h2>My Shopping Cart</h2>
            </div>
        </div>

        <div class="offer-section">

        <%
            DecimalFormat df = new DecimalFormat("#,##0.00");

            List<CartItem> cartItems =
                    (List<CartItem>) request.getAttribute("cartItems");

            if (cartItems != null && !cartItems.isEmpty()) {

                for (CartItem item : cartItems) {
        %>

            <div class="product-card">

                <div class="product-info">

                    <div class="product-category">
                        CART ITEM
                    </div>

                    <h3>
                        <%= item.getProductName() %>
                    </h3>

                    <p>
                        Price: ₹<%= df.format(item.getPrice()) %>
                    </p>

                    <!-- Quantity Update -->
                    <form action="${pageContext.request.contextPath}/cart"
                          method="post"
                          style="margin-top: 10px;">

                        <input type="hidden"
                               name="action"
                               value="update">

                        <input type="hidden"
                               name="productId"
                               value="<%= item.getProductId() %>">

                        <label>
                            Quantity:
                        </label>

                        <input type="number"
                               name="quantity"
                               value="<%= item.getQuantity() %>"
                               min="1"
                               style="width:70px;">

                        <button type="submit"
                                class="primary-btn">
                            Update
                        </button>

                    </form>

                    <div class="product-bottom">

                        <strong>
                            ₹<%= df.format(
                                item.getPrice() * item.getQuantity()
                            ) %>
                        </strong>

                    </div>

                    <!-- Remove -->
                    <form action="${pageContext.request.contextPath}/cart"
                          method="post"
                          style="margin-top: 10px;">

                        <input type="hidden"
                               name="action"
                               value="remove">

                        <input type="hidden"
                               name="productId"
                               value="<%= item.getProductId() %>">

                        <button type="submit"
                                class="secondary-btn">
                            Remove
                        </button>

                    </form>

                </div>

            </div>

        <%
                }

            } else {
        %>

            <h2>Your cart is empty</h2>

            <p>
                Add products to your cart to see them here.
            </p>

            <a href="products" class="primary-btn">
                Continue Shopping
            </a>

        <%
            }
        %>

        </div>

        <%
            double totalAmount = 0;

            if (cartItems != null) {

                for (CartItem item : cartItems) {

                    totalAmount +=
                            item.getPrice() * item.getQuantity();
                }
            }
        %>

        <div class="cart-total">

            <span>Total Cart Amount</span>

            <strong>
                ₹<%= df.format(totalAmount) %>
            </strong>

        </div>

        <% if (cartItems != null && !cartItems.isEmpty()) { %>

            <a href="checkout" class="primary-btn">
                Proceed to Checkout
            </a>

        <% } %>

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