<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.udhaya.udhayamart.model.Order" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <title>Manage Orders - UDHAYAMART</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

    <style>

        .admin-container {
            width: 92%;
            margin: 40px auto;
        }

        .admin-container h2 {
            margin-bottom: 25px;
        }

        .back-btn {
            display: inline-block;
            margin-bottom: 20px;
            padding: 10px 18px;
            background: #555;
            color: white;
            text-decoration: none;
            border-radius: 6px;
        }

        .orders-table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
        }

        .orders-table th,
        .orders-table td {
            padding: 14px;
            border-bottom: 1px solid #ddd;
            text-align: left;
        }

        .orders-table th {
            background: #f5f5f5;
            font-weight: bold;
        }

        .status {
            font-weight: bold;
        }

        .empty-message {
            text-align: center;
            padding: 30px;
        }

    </style>

</head>

<body>

<div class="admin-container">

    <a href="${pageContext.request.contextPath}/admin/dashboard"
       class="back-btn">
        ← Back to Dashboard
    </a>

    <h2>Manage Orders</h2>

    <table class="orders-table">

        <thead>
        <tr>
            <th>Order ID</th>
            <th>User</th>
            <th>Email</th>
            <th>Address ID</th>
            <th>Total Amount</th>
            <th>Status</th>
            <th>Order Date</th>
        </tr>
        </thead>

        <tbody>

        <%
            List<Order> orders =
                (List<Order>) request.getAttribute("orders");

            if (orders != null && !orders.isEmpty()) {

                for (Order order : orders) {
        %>

        <tr>

            <td>
                <%= order.getOrderId() %>
            </td>

            <td>
                <%= order.getUserName() %>
            </td>

            <td>
                <%= order.getUserEmail() %>
            </td>

            <td>
                <%= order.getAddressId() %>
            </td>

            <td>
                ₹<%= String.format("%.2f",
                        order.getTotalAmount()) %>
            </td>

            <td class="status">
                <%= order.getOrderStatus() %>
            </td>

            <td>
                <%= order.getOrderDate() %>
            </td>

        </tr>

        <%
                }

            } else {
        %>

        <tr>
            <td colspan="7" class="empty-message">
                No orders found.
            </td>
        </tr>

        <%
            }
        %>

        </tbody>

    </table>

</div>

</body>
</html>