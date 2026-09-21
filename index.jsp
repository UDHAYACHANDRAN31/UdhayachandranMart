<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>UDHAYAMART | Welcome</title>

    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: Arial, sans-serif;
            min-height: 100vh;
            background: linear-gradient(135deg, #2874f0, #0b3d91);
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .welcome-card {
            width: 90%;
            max-width: 850px;
            background: white;
            border-radius: 20px;
            padding: 55px 45px;
            text-align: center;
            box-shadow: 0 15px 45px rgba(0, 0, 0, 0.20);
        }

        .logo {
            width: 70px;
            height: 70px;
            margin: 0 auto 20px;
            background: #2874f0;
            color: white;
            border-radius: 16px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 38px;
            font-weight: bold;
        }

        h1 {
            font-size: 38px;
            color: #172337;
            margin-bottom: 10px;
        }

        h1 span {
            color: #2874f0;
        }

        .tagline {
            color: #666;
            font-size: 17px;
            margin-bottom: 45px;
        }

        .choose-title {
            font-size: 22px;
            color: #172337;
            margin-bottom: 25px;
        }

        .login-options {
            display: flex;
            gap: 25px;
            justify-content: center;
        }

        .login-card {
            flex: 1;
            max-width: 300px;
            padding: 30px 20px;
            border: 1px solid #e0e0e0;
            border-radius: 14px;
            text-decoration: none;
            transition: 0.2s;
        }

        .login-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.12);
        }

        .user-card {
            background: #f5f9ff;
        }

        .admin-card {
            background: #f8f8f8;
        }

        .icon {
            font-size: 42px;
            margin-bottom: 15px;
        }

        .login-card h2 {
            color: #172337;
            margin-bottom: 10px;
        }

        .login-card p {
            color: #777;
            font-size: 14px;
            margin-bottom: 20px;
        }

        .btn {
            display: inline-block;
            padding: 12px 28px;
            background: #2874f0;
            color: white;
            border-radius: 7px;
            font-weight: bold;
        }

        .admin-card .btn {
            background: #172337;
        }

        .footer {
            margin-top: 40px;
            color: #999;
            font-size: 13px;
        }

        @media (max-width: 650px) {

            .welcome-card {
                padding: 40px 20px;
            }

            .login-options {
                flex-direction: column;
                align-items: center;
            }

            .login-card {
                width: 100%;
            }
        }

    </style>

</head>

<body>

    <div class="welcome-card">

        <div class="logo">
            U
        </div>

        <h1>
            UDHAYA<span>MART</span>
        </h1>

        <p class="tagline">
            Everything you need. All in one place.
        </p>

        <h2 class="choose-title">
            Continue as
        </h2>

        <div class="login-options">

            <!-- User Login -->
            <a href="${pageContext.request.contextPath}/user/login.jsp"
               class="login-card user-card">

                <div class="icon">
                    👤
                </div>

                <h2>User</h2>

                <p>
                    Login to shop products,
                    manage cart and place orders.
                </p>

                <span class="btn">
                    User Login
                </span>

            </a>


            <!-- Admin Login -->
            <a href="${pageContext.request.contextPath}/admin/admin-login.jsp"
               class="login-card admin-card">

                <div class="icon">
                    🛡️
                </div>

                <h2>Admin</h2>

                <p>
                    Login to manage products,
                    users and orders.
                </p>

                <span class="btn">
                    Admin Login
                </span>

            </a>

        </div>

        <div class="footer">
            © 2026 UDHAYAMART. All rights reserved.
        </div>

    </div>

</body>

</html>