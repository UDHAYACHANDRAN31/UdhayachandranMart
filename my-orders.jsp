<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.udhaya.udhayamart.model.Order" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>My Orders - UDHAYAMART</title>

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

        <a href="${pageContext.request.contextPath}/products"
           class="header-link">
            Products
        </a>

        <a href="${pageContext.request.contextPath}/cart"
           class="header-link">
            Cart
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

        <h2>My Orders</h2>

        <%
            List<Order> orders =
                (List<Order>) request.getAttribute("orders");
        %>

        <% if (orders == null || orders.isEmpty()) { %>

            <p style="margin-top:25px;">
                You have no orders yet.
            </p>

        <% } else { %>

            <div style="overflow-x:auto; margin-top:25px;">

                <table style="width:100%; border-collapse:collapse;">

                    <thead>
                        <tr>
                            <th style="padding:12px; text-align:left;">
                                Order ID
                            </th>

                            <th style="padding:12px; text-align:left;">
                                Total Amount
                            </th>

                            <th style="padding:12px; text-align:left;">
                                Status
                            </th>

                            <th style="padding:12px; text-align:left;">
                                Order Date
                            </th>
                        </tr>
                    </thead>

                    <tbody>

                    <% for (Order order : orders) { %>

                        <tr>

                            <td style="padding:12px;">
                                #<%= order.getOrderId() %>
                            </td>

                            <td style="padding:12px;">
                                ₹<%= String.format("%.2f",
                                    order.getTotalAmount()) %>
                            </td>

                            <td style="padding:12px;">
                                <%= order.getOrderStatus() %>
                            </td>

                            <td style="padding:12px;">
                                <%= order.getOrderDate() %>
                            </td>

                        </tr>

                    <% } %>

                    </tbody>

                </table>

            </div>

        <% } %>

        <div style="margin-top:30px;">

            <a href="${pageContext.request.contextPath}/products"
               class="primary-btn">
                Continue Shopping
            </a>

        </div>

    </div>

</main>

</body>
</html>