package com.udhaya.udhayamart.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/admin/login")
public class AdminLoginServlet extends HttpServlet {

    private static final String ADMIN_EMAIL =
            "admin@udhayamart.com";

    private static final String ADMIN_PASSWORD =
            "admin123";

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String email =
                request.getParameter("email");

        String password =
                request.getParameter("password");

        if (ADMIN_EMAIL.equals(email)
                && ADMIN_PASSWORD.equals(password)) {

            HttpSession session =
                    request.getSession(true);

            session.setAttribute(
                    "admin",
                    true
            );

            session.setAttribute(
                    "adminEmail",
                    email
            );

            response.sendRedirect(
                    request.getContextPath()
                    + "/admin/dashboard"
            );

        } else {

            response.sendRedirect(
                    request.getContextPath()
                    + "/admin/admin-login.jsp?error=invalid"
            );
        }
    }
}