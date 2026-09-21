<%@ page import="com.udhaya.udhayamart.model.User" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>UDHAYAMART | Login</title>
    <link rel="stylesheet" href="../css/style.css">
</head>

<body class="login-page">

    <div class="background-shape shape-one"></div>
    <div class="background-shape shape-two"></div>
    <div class="background-shape shape-three"></div>

    <div class="login-card">

        <!-- BRAND SIDE -->
        <div class="brand-section">

            <div class="logo-box">
                <span class="logo-u">U</span>
            </div>

            <h1>UDHAYA<span>MART</span></h1>

            <p class="tagline">
                Everything you need.<br>
                All in one place.
            </p>

            <div class="feature-box">
                <div class="feature">
                    <span></span>
                    <p>Wide range of products</p>
                </div>

                <div class="feature">
                    <span></span>
                    <p>Easy & secure shopping</p>
                </div>

                <div class="feature">
                    <span></span>
                    <p>Fast order experience</p>
                </div>
            </div>

        </div>


        <!-- LOGIN SIDE -->
        <div class="form-section">

            <div class="form-header">
                <p class="welcome">WELCOME BACK</p>

                <h2>Sign in to your account</h2>

                <p>
                    Enter your details to continue shopping.
                </p>
            </div>


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


            <form action="../login" method="post">

                <div class="input-box">

                    <label>Email Address</label>

                    <div class="input-wrapper">
                        <span class="input-icon"></span>

                        <input
                            type="email"
                            name="email"
                            placeholder="Enter your email"
                            required>
                    </div>

                </div>


                <div class="input-box">

                    <label>Password</label>

                    <div class="input-wrapper">
                        <span class="input-icon"></span>

                        <input
                            type="password"
                            name="password"
                            placeholder="Enter your password"
                            required>
                    </div>

                </div>


                <div class="login-options">

                    <label class="remember">
                        <input type="checkbox">
                        Remember me
                    </label>

                    <a href="#">Forgot Password?</a>

                </div>


                <button type="submit" class="login-btn">
                    <span>Login to UDHAYAMART</span>
                    <span class="arrow">→</span>
                </button>

            </form>


            <div class="divider">
                <span>NEW TO UDHAYAMART?</span>
            </div>


            <a href="register.jsp" class="create-account">
                Create a new account
            </a>


            <p class="bottom-text">
                © 2026 UDHAYAMART. All rights reserved.
            </p>

        </div>

    </div>

</body>
</html>