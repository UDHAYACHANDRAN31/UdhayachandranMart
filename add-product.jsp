<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Add Product - UDHAYAMART</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">
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

    <div class="header-actions">

        <a href="${pageContext.request.contextPath}/admin/dashboard"
           class="header-link">
            Dashboard
        </a>

        <a href="${pageContext.request.contextPath}/logout"
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
                Add Product
            </h2>

            <p>
                Add a new product to your store
            </p>

        </div>

    </div>


    <section class="checkout-card">

        <div class="checkout-card-header">

            <h3>
                Product Details
            </h3>

            <p>
                Enter the product information
            </p>

        </div>


        <form action="${pageContext.request.contextPath}/admin/add-product"
              method="post">


            <div class="checkout-form-group">

                <label for="productName">
                    Product Name
                </label>

                <input type="text"
                       id="productName"
                       name="productName"
                       placeholder="Enter product name"
                       required>

            </div>


            <div class="checkout-form-group">

                <label for="categoryId">
                    Category ID
                </label>

                <input type="number"
                       id="categoryId"
                       name="categoryId"
                       placeholder="Enter category ID"
                       required>

            </div>


            <div class="checkout-form-group">

                <label for="description">
                    Description
                </label>

                <textarea
                    id="description"
                    name="description"
                    rows="4"
                    placeholder="Enter product description"
                    required></textarea>

            </div>


            <div class="checkout-form-row">

                <div class="checkout-form-group">

                    <label for="price">
                        Price
                    </label>

                    <input type="number"
                           id="price"
                           name="price"
                           step="0.01"
                           placeholder="Enter price"
                           required>

                </div>


                <div class="checkout-form-group">

                    <label for="stock">
                        Stock
                    </label>

                    <input type="number"
                           id="stock"
                           name="stock"
                           min="0"
                           placeholder="Enter stock"
                           required>

                </div>

            </div>


            <div class="checkout-form-group">

                <label for="image">
                    Image
                </label>

                <input type="text"
                       id="image"
                       name="image"
                       placeholder="Enter image file name"
                       required>

            </div>


            <button type="submit"
                    class="primary-btn checkout-btn">

                Add Product

            </button>

        </form>

    </section>

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