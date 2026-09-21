package com.udhaya.udhayamart.controller;

import com.udhaya.udhayamart.dao.UserDAO;
import com.udhaya.udhayamart.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private UserDAO userDAO;

    @Override
    public void init() {
        userDAO = new UserDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");

        User user = new User(name, email, password, phone);

        boolean registered = userDAO.registerUser(user);

        if (registered) {
            response.sendRedirect("user/login.jsp");
        } else {
            response.sendRedirect("user/register.jsp?error=failed");
        }
    }
}
