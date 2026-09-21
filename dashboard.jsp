<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Admin Dashboard - UDHAYAMART</title>

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

        <span class="header-link">
            Admin
        </span>

        <a href="${pageContext.request.contextPath}/admin/logout"
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
                Dashboard
            </h2>

            <p>
                Manage your UDHAYAMART store
            </p>

        </div>

    </div>


    <!-- DASHBOARD CARDS -->

    <div class="dashboard-grid">


        <!-- TOTAL USERS -->

        <div class="dashboard-card">

            <div class="dashboard-icon">
                👥
            </div>

            <div>

                <div class="dashboard-label">
                    Total Users
                </div>

                <div class="dashboard-value">
                    ${userCount}
                </div>

            </div>

        </div>


        <!-- TOTAL PRODUCTS -->

        <div class="dashboard-card">

            <div class="dashboard-icon">
                📦
            </div>

            <div>

                <div class="dashboard-label">
                    Total Products
                </div>

                <div class="dashboard-value">
                    ${productCount}
                </div>

            </div>

        </div>


        <!-- TOTAL ORDERS -->

        <div class="dashboard-card">

            <div class="dashboard-icon">
                🛒
            </div>

            <div>

                <div class="dashboard-label">
                    Total Orders
                </div>

                <div class="dashboard-value">
                    ${orderCount}
                </div>

            </div>

        </div>


        <!-- TOTAL SALES -->

        <div class="dashboard-card">

            <div class="dashboard-icon">
                ₹
            </div>

            <div>

                <div class="dashboard-label">
                    Total Sales
                </div>

                <div class="dashboard-value">
                    ₹${totalSales}
                </div>

            </div>

        </div>


    </div>


    <!-- ADMIN ACTIONS -->

    <div class="checkout-card admin-actions-card">

        <div class="checkout-card-header">

            <h3>
                Quick Actions
            </h3>

            <p>
                Manage your online store
            </p>

        </div>


        <div class="admin-actions">

            <a href="${pageContext.request.contextPath}/admin/add-product"
               class="primary-btn">
                Add Product
            </a>


            <a href="${pageContext.request.contextPath}/admin/products"
               class="primary-btn">
                Manage Products
            </a>


            <a href="${pageContext.request.contextPath}/admin/orders"
               class="primary-btn">
                Manage Orders
            </a>


            <a href="${pageContext.request.contextPath}/admin/users"
               class="primary-btn">
                Manage Users
            </a>

        </div>

    </div>


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