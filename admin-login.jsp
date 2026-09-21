<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Admin Login - UDHAYAMART</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

    <style>

        .admin-login-page {
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: #f5f7fb;
        }

        .admin-login-box {
            width: 380px;
            background: white;
            padding: 35px;
            border-radius: 12px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.12);
        }

        .admin-login-box h1 {
            text-align: center;
            margin-bottom: 10px;
        }

        .admin-login-box p {
            text-align: center;
            color: #777;
            margin-bottom: 25px;
        }

        .admin-login-box label {
            display: block;
            margin-bottom: 6px;
            font-weight: bold;
        }

        .admin-login-box input {
            width: 100%;
            padding: 12px;
            margin-bottom: 18px;
            border: 1px solid #ddd;
            border-radius: 6px;
            box-sizing: border-box;
        }

        .admin-login-btn {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 6px;
            background: #1687d9;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }

        .admin-login-btn:hover {
            opacity: 0.9;
        }

        .error-message {
            color: #d9534f;
            text-align: center;
            margin-bottom: 15px;
        }

    </style>

</head>

<body>

<div class="admin-login-page">

    <div class="admin-login-box">

        <h1>UDHAYAMART</h1>

        <p>Admin Login</p>

        <%
            String error = request.getParameter("error");

            if ("invalid".equals(error)) {
        %>

            <div class="error-message">
                Invalid email or password.
            </div>

        <%
            }
        %>

        <form action="${pageContext.request.contextPath}/admin/login"
              method="post">

            <label for="email">
                Email
            </label>

            <input type="email"
                   id="email"
                   name="email"
                   placeholder="Enter admin email"
                   required>

            <label for="password">
                Password
            </label>

            <input type="password"
                   id="password"
                   name="password"
                   placeholder="Enter admin password"
                   required>

            <button type="submit"
                    class="admin-login-btn">
                Admin Login
            </button>

        </form>

    </div>

</div>

</body>

</html>
 df=