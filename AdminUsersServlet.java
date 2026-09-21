package com.udhaya.udhayamart.controller;

import com.udhaya.udhayamart.dao.UserDAO;
import com.udhaya.udhayamart.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/users")
public class AdminUsersServlet extends HttpServlet {

    private UserDAO userDAO;

    @Override
    public void init() {
        userDAO = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        List<User> users = userDAO.getAllUsers();

        request.setAttribute("users", users);

        request.getRequestDispatcher("/admin/users.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        try {

            String action =
                    request.getParameter("action");

            String userIdParam =
                    request.getParameter("userId");

            if ("delete".equals(action)
                    && userIdParam != null
                    && !userIdParam.trim().isEmpty()) {

                int userId =
                        Integer.parseInt(userIdParam);

                userDAO.deleteUser(userId);
            }

            response.sendRedirect(
                    request.getContextPath()
                    + "/admin/users"
            );

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                    request.getContextPath()
                    + "/admin/users"
            );
        }
    }
}