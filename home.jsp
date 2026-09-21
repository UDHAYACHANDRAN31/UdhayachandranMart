<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.udhaya.udhayamart.model.User" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>UDHAYAMART - Home</title>

    <link rel="stylesheet" href="../css/style.css">
</head>

<body class="shop-page">

<%
    User user = (User) session.getAttribute("user");

    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!-- ================= HEADER ================= -->

<header class="shop-header">

    <div class="shop-logo">

        <div class="shop-logo-icon">
            U
        </div>

        <h1>
            UDHAYA<span>MART</span>
        </h1>

    </div>


    <div class="search-box">

        <span>⌕</span>

        <input
            type="text"
            placeholder="Search for products, brands and more..."
        >

    </div>


    <div class="header-actions">

        <div class="user-menu">

            <div class="user-menu-icon">
                <%= user.getName().substring(0, 1).toUpperCase() %>
            </div>

            <span class="user-label">
                Hi, <%= user.getName() %>
            </span>

        </div>


        <a href="#" class="header-link">
            Wishlist
        </a>


        <a href="#" class="cart-link">
            🛒
            <span class="cart-count">0</span>
        </a>
        <a href="${pageContext.request.contextPath}/my-orders"
   class="header-link">
    My Orders
</a>


        <a href="../logout" class="logout-btn">
            Logout
        </a>

    </div>

</header>


<!-- ================= CATEGORY NAV ================= -->

<nav class="category-nav">

    <a href="#">All Categories</a>

    <a href="#">Electronics</a>

    <a href="#">Fashion</a>

    <a href="#">Home & Kitchen</a>

    <a href="#">Mobiles</a>

    <a href="#">Beauty</a>

    <a href="#">Offers</a>

</nav>


<!-- ================= MAIN ================= -->

<main class="shop-main">


    <!-- ================= HERO ================= -->

    <section class="hero-section">

        <div class="hero-content">

            <span class="hero-badge">
                WELCOME TO UDHAYAMART
            </span>

            <h2>
                Everything you need.
                <span>All in one place.</span>
            </h2>

            <p>
                Discover products across electronics, fashion,
                home essentials and more — all from one shopping
                destination.
            </p>


            <div class="hero-buttons">

                <a href="../products" class="primary-btn">
                    Start Shopping
                </a>

                <a href="#" class="secondary-btn">
                    Explore Categories
                </a>

            </div>

        </div>


        <div class="hero-visual">

            <div class="hero-circle circle-one"></div>

            <div class="hero-circle circle-two"></div>

            <div class="shopping-card">

                <div class="shopping-icon">
                    🛍️
                </div>

                <p>
                    Shop Smart
                </p>

            </div>

        </div>

    </section>


    <!-- ================= WELCOME BAR ================= -->

    <div class="welcome-bar">

        <div>

            <strong>
                Welcome back, <%= user.getName() %> 👋
            </strong>

        </div>

        <div class="welcome-email">

            <%= user.getEmail() %>

        </div>

    </div>


    <!-- ================= CATEGORIES ================= -->

    <section class="content-section">

        <div class="section-heading">

            <div>

                <div class="section-label">
                    EXPLORE
                </div>

                <h2>
                    Shop by Category
                </h2>

            </div>

        </div>


        <div class="category-grid">


            <a href="#" class="category-card">

                <div class="category-icon">
                    📱
                </div>

                <span>
                    Mobiles
                </span>

            </a>


            <a href="#" class="category-card">

                <div class="category-icon">
                    💻
                </div>

                <span>
                    Electronics
                </span>

            </a>


            <a href="#" class="category-card">

                <div class="category-icon">
                    👕
                </div>

                <span>
                    Fashion
                </span>

            </a>


            <a href="#" class="category-card">

                <div class="category-icon">
                    🏠
                </div>

                <span>
                    Home & Kitchen
                </span>

            </a>


            <a href="#" class="category-card">

                <div class="category-icon">
                    💄
                </div>

                <span>
                    Beauty
                </span>

            </a>


            <a href="#" class="category-card">

                <div class="category-icon">
                    🎁
                </div>

                <span>
                    Offers
                </span>

            </a>


        </div>

    </section>


    <!-- ================= PRODUCTS ================= -->

    <section class="content-section">

        <div class="section-heading">

            <div>

                <div class="section-label">
                    TRENDING NOW
                </div>

                <h2>
                    Featured Products
                </h2>

            </div>

        </div>


        <div class="product-grid">


            <div class="product-card">

                <div class="product-image">
                    📱
                </div>

                <div class="product-info">

                    <div class="product-category">
                        Electronics
                    </div>

                    <h3>
                        Smartphones
                    </h3>

                    <p>
                        Discover the latest smartphones
                        and accessories.
                    </p>

                    <div class="product-bottom">

                        <strong>
                            Explore
                        </strong>

                    </div>

                </div>

            </div>


            <div class="product-card">

                <div class="product-image">
                    💻
                </div>

                <div class="product-info">

                    <div class="product-category">
                        Electronics
                    </div>

                    <h3>
                        Laptops
                    </h3>

                    <p>
                        Powerful laptops for work,
                        study and entertainment.
                    </p>

                    <div class="product-bottom">

                        <strong>
                            Explore
                        </strong>

                    </div>

                </div>

            </div>


            <div class="product-card">

                <div class="product-image">
                    👟
                </div>

                <div class="product-info">

                    <div class="product-category">
                        Fashion
                    </div>

                    <h3>
                        Fashion & Footwear
                    </h3>

                    <p>
                        Upgrade your style with
                        trending fashion products.
                    </p>

                    <div class="product-bottom">

                        <strong>
                            Explore
                        </strong>

                    </div>

                </div>

            </div>


            <div class="product-card">

                <div class="product-image">
                    🎧
                </div>

                <div class="product-info">

                    <div class="product-category">
                        Accessories
                    </div>

                    <h3>
                        Audio & Accessories
                    </h3>

                    <p>
                        Headphones, earbuds and
                        everyday accessories.
                    </p>

                    <div class="product-bottom">

                        <strong>
                            Explore
                        </strong>

                    </div>

                </div>

            </div>


        </div>

    </section>


    <!-- ================= OFFER ================= -->

    <section class="offer-section">

        <div>

            <h2>
                More products are coming soon.
            </h2>

            <p>
                UDHAYAMART is being built to bring
                everything you need into one place.
            </p>

        </div>

    </section>


</main>


<!-- ================= FOOTER ================= -->

<footer class="shop-footer">


    <div class="footer-brand">

        <h2>
            UDHAYAMART
        </h2>

        <p>
            Your modern online shopping destination.
            Discover products, explore categories and
            enjoy a simple shopping experience.
        </p>

    </div>


    <div class="footer-links">

        <strong>
            Quick Links
        </strong>

        <a href="#">
            Home
        </a>

        <a href="#">
            Categories
        </a>

        <a href="#">
            Wishlist
        </a>

    </div>


    <div class="footer-links">

        <strong>
            Customer
        </strong>

        <a href="#">
            My Account
        </a>

        <a href="#">
            Orders
        </a>

        <a href="#">
            Help & Support
        </a>

    </div>


    <div class="footer-copy">

        © 2026 UDHAYAMART. All rights reserved.

    </div>


</footer>

</body>
</html>