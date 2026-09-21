<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.udhaya.udhayamart.model.Product" %>

<%
    Product product = (Product) request.getAttribute("product");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Product - UDHAYAMART</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

    <style>
        .form-container {
            max-width: 700px;
            margin: 40px auto;
            padding: 30px;
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
        }

        .form-container h2 {
            margin-bottom: 25px;
        }

        .form-group {
            margin-bottom: 18px;
        }

        .form-group label {
            display: block;
            margin-bottom: 7px;
            font-weight: bold;
        }

        .form-group input,
        .form-group textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 6px;
            box-sizing: border-box;
        }

        .form-group textarea {
            min-height: 100px;
            resize: vertical;
        }

        .btn {
            display: inline-block;
            padding: 12px 22px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            text-decoration: none;
            margin-right: 10px;
        }

        .update-btn {
            background: #2196f3;
            color: white;
        }

        .cancel-btn {
            background: #777;
            color: white;
        }
    </style>
</head>

<body>

<div class="form-container">

    <h2>Edit Product</h2>

    <form method="post"
          action="${pageContext.request.contextPath}/admin/edit-product">

        <input type="hidden"
               name="productId"
               value="<%= product.getProductId() %>">

        <div class="form-group">
            <label>Product Name</label>

            <input type="text"
                   name="productName"
                   value="<%= product.getProductName() %>"
                   required>
        </div>

        <div class="form-group">
            <label>Category ID</label>

            <input type="number"
                   name="categoryId"
                   value="<%= product.getCategoryId() %>"
                   required>
        </div>

        <div class="form-group">
            <label>Description</label>

            <textarea name="description"><%= product.getDescription() == null ? "" : product.getDescription() %></textarea>
        </div>

        <div class="form-group">
            <label>Price</label>

            <input type="number"
                   name="price"
                   step="0.01"
                   value="<%= product.getPrice() %>"
                   required>
        </div>

        <div class="form-group">
            <label>Stock</label>

            <input type="number"
                   name="stock"
                   value="<%= product.getStock() %>"
                   required>
        </div>

        <div class="form-group">
            <label>Image</label>

            <input type="text"
                   name="image"
                   value="<%= product.getImage() == null ? "" : product.getImage() %>">
        </div>

        <button type="submit" class="btn update-btn">
            Update Product
        </button>

        <a href="${pageContext.request.contextPath}/admin/products"
           class="btn cancel-btn">
            Cancel
        </a>

    </form>

</div>

</body>
</html>