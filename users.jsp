<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.udhaya.udhayamart.model.User" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>Manage Users - UDHAYAMART</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">

    <style>

        .admin-container {
            width: 90%;
            margin: 40px auto;
        }

        .admin-container h2 {
            margin-bottom: 25px;
        }

        .users-table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
        }

        .users-table th,
        .users-table td {
            padding: 14px;
            border-bottom: 1px solid #ddd;
            text-align: left;
        }

        .users-table th {
            background: #f5f5f5;
            font-weight: bold;
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

        .delete-btn {
            padding: 8px 14px;
            background: #d9534f;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        .delete-btn:hover {
            opacity: 0.85;
        }

    </style>

</head>

<body>

<div class="admin-container">

    <a href="${pageContext.request.contextPath}/admin/dashboard"
       class="back-btn">
        ← Back to Dashboard
    </a>

    <h2>Manage Users</h2>

    <table class="users-table">

        <thead>

        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Action</th>
        </tr>

        </thead>

        <tbody>

        <%
            List<User> users =
                (List<User>) request.getAttribute("users");

            if (users != null && !users.isEmpty()) {

                for (User user : users) {
        %>

        <tr>

            <td>
                <%= user.getUserId() %>
            </td>

            <td>
                <%= user.getName() %>
            </td>

            <td>
                <%= user.getEmail() %>
            </td>

            <td>
                <%= user.getPhone() %>
            </td>

            <td>

                <form action="${pageContext.request.contextPath}/admin/users"
                      method="post"
                      onsubmit="return confirm('Are you sure you want to delete this user?');">

                    <input type="hidden"
                           name="action"
                           value="delete">

                    <input type="hidden"
                           name="userId"
                           value="<%= user.getUserId() %>">

                    <button type="submit"
                            class="delete-btn">
                        Delete
                    </button>

                </form>

            </td>

        </tr>

        <%
                }

            } else {
        %>

        <tr>

            <td colspan="5">
                No users found.
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