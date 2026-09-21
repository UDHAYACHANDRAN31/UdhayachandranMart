<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.udhaya.udhayamart.model.CartItem" %>

<%
    List<CartItem> cartItems =
            (List<CartItem>) request.getAttribute("cartItems");

    double totalAmount = 0.0;
    int totalItems = 0;

    if (cartItems != null) {
        for (CartItem item : cartItems) {
            totalAmount += item.getPrice() * item.getQuantity();
            totalItems += item.getQuantity();
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Checkout - UDHAYAMART</title>

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
        <a href="cart" class="header-link">Cart</a>
        <a href="products" class="header-link">Products</a>
        <a href="logout" class="logout-btn">Logout</a>
    </div>

</header>

<main class="shop-main">

    <div class="section-heading">
        <div>
            <div class="section-label">ORDER</div>
            <h2>Checkout</h2>
        </div>
    </div>

    <div class="checkout-layout">

        <!-- DELIVERY ADDRESS -->

        <section class="checkout-card">

            <div class="checkout-card-header">
                <h3>Delivery Address</h3>
                <p>Enter your delivery details</p>
            </div>

            <form action="place-order" method="post">

                <div class="checkout-form-group">
                    <label for="address">Address</label>

                    <textarea
                        id="address"
                        name="address"
                        rows="4"
                        placeholder="Enter your complete delivery address"
                        required></textarea>
                </div>

                <div class="checkout-form-row">

                    <div class="checkout-form-group">
                        <label for="city">City</label>

                        <input
                            type="text"
                            id="city"
                            name="city"
                            placeholder="Enter city"
                            required>
                    </div>

                    <div class="checkout-form-group">
                        <label for="state">State</label>

                        <input
                            type="text"
                            id="state"
                            name="state"
                            placeholder="Enter state"
                            required>
                    </div>

                </div>

                <div class="checkout-form-row">

                    <div class="checkout-form-group">
                        <label for="pincode">Pincode</label>

                        <input
                            type="text"
                            id="pincode"
                            name="pincode"
                            placeholder="Enter pincode"
                            required>
                    </div>

                    <div class="checkout-form-group">
                        <label for="phone">Phone Number</label>

                        <input
                            type="text"
                            id="phone"
                            name="phone"
                            placeholder="Enter phone number"
                            required>
                    </div>

                </div>

                <button type="submit"
        class="primary-btn checkout-btn">
    Place Order
</button>

            </form>

        </section>


        <!-- ORDER SUMMARY -->

        <aside class="checkout-summary">

            <div class="checkout-card-header">
                <h3>Order Summary</h3>
                <p>Review your order before payment</p>
            </div>


            <!-- CART ITEMS -->

            <div class="checkout-items">

                <%
                    if (cartItems != null && !cartItems.isEmpty()) {

                        for (CartItem item : cartItems) {

                            double itemTotal =
                                    item.getPrice() * item.getQuantity();
                %>

                    <div class="summary-row">
                        <span>
                            <%= item.getProductName() %>
                            × <%= item.getQuantity() %>
                        </span>

                        <strong>
                            ₹<%= String.format("%.2f", itemTotal) %>
                        </strong>
                    </div>

                <%
                        }

                    } else {
                %>

                    <div class="summary-row">
                        <span>Items</span>
                        <strong>Your Cart is Empty</strong>
                    </div>

                <%
                    }
                %>

            </div>


            <!-- TOTAL ITEMS -->

            <div class="summary-row">
                <span>Total Items</span>
                <strong><%= totalItems %></strong>
            </div>


            <!-- DELIVERY -->

            <div class="summary-row">
                <span>Delivery</span>
                <strong>Free</strong>
            </div>


            <div class="summary-divider"></div>


            <!-- TOTAL -->

            <div class="summary-total">
                <span>Total Amount</span>

                <strong>
                    ₹<%= String.format("%.2f", totalAmount) %>
                </strong>
            </div>

        </aside>

    </div>

</main>


<footer class="shop-footer">

    <div class="footer-brand">
        <h2>UDHAYAMART</h2>
        <p>Your trusted online shopping destination.</p>
    </div>

    <div class="footer-copy">
        © 2026 UDHAYAMART. All rights reserved.
    </div>

</footer>

</body>
</html>