<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>UDHAYAMART - Create Account</title>

    <link rel="stylesheet" href="../css/style.css">
</head>

<body>

    <div class="form-container">

        <!-- BRAND -->
        <h1>UDHAYAMART</h1>

        <!-- TITLE -->
        <h2>Create Your Account</h2>

        <p class="form-subtitle">
            Create your account and start shopping with UDHAYAMART.
        </p>


        <!-- REGISTER FORM -->
        <form action="../register" method="post">

            <!-- NAME -->
            <label for="name">Full Name</label>

            <input
                type="text"
                id="name"
                name="name"
                placeholder="Enter your full name"
                autocomplete="name"
                required
            >


            <!-- EMAIL -->
            <label for="email">Email Address</label>

            <input
                type="email"
                id="email"
                name="email"
                placeholder="Enter your email address"
                autocomplete="email"
                required
            >


            <!-- PASSWORD -->
            <label for="password">Password</label>

            <input
                type="password"
                id="password"
                name="password"
                placeholder="Create a password"
                autocomplete="new-password"
                required
            >


            <!-- PHONE -->
            <label for="phone">Phone Number</label>

            <input
                type="tel"
                id="phone"
                name="phone"
                placeholder="Enter your phone number"
                autocomplete="tel"
                required
            >


            <!-- REGISTER BUTTON -->
            <button type="submit">
                Create Account
            </button>

        </form>


        <!-- LOGIN LINK -->
        <p class="form-footer">
            Already have an account?
            <a href="login.jsp">Login here</a>
        </p>

    </div>

</body>

</html>