<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Order Confirmed - UDHAYAMART</title>

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

        <a href="${pageContext.request.contextPath}/logout"
           class="logout-btn">
            Logout
        </a>
    </div>

</header>

<main class="shop-main">

    <div class="checkout-card"
         style="max-width:600px; margin:60px auto; text-align:center;">

        <div style="font-size:60px; margin-bottom:20px;">
            ✅
        </div>

        <h2>Order Confirmed!</h2>

        <p style="margin-top:15px;">
            Your order has been placed successfully.
        </p>

        <p>
            Thank you for shopping with UDHAYAMART.
        </p>

        <a href="${pageContext.request.contextPath}/products"
           class="primary-btn"
           style="display:inline-block; margin-top:25px;">
            Continue Shopping
        </a>

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