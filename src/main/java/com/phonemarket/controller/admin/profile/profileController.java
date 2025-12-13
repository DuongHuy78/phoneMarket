package com.phonemarket.controller.admin.profile;

import com.phonemarket.model.bean.Users;
import com.phonemarket.model.bo.UsersBO;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/admin/profile/*")
public class profileController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws jakarta.servlet.ServletException, IOException {
        String action = req.getPathInfo();
        if (action == null || "/".equals(action)) {
            Integer userIdObj = (Integer) req.getSession().getAttribute("currentUserId");
            if (userIdObj == null) {
                req.getSession().setAttribute("error", "Session expired. Please log in again.");
                resp.sendRedirect(req.getContextPath() + "/login");
                return;
            }
            int userId = userIdObj;
            System.out.println("Current User ID: " + userId);
            try {
                Users user = new UsersBO().getUserById(userId);
                req.setAttribute("currentUser", user);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            req.getRequestDispatcher("/jsp/admin/profile/profile.jsp").forward(req, resp);
        } else if ("/edit".equals(action)) {
            Integer userIdObj = (Integer) req.getSession().getAttribute("currentUserId");
            if (userIdObj == null) {
                req.getSession().setAttribute("error", "Session expired. Please log in again.");
                resp.sendRedirect(req.getContextPath() + "/login");
                return;
            }
            int userId = userIdObj;
            try {
                Users user = new UsersBO().getUserById(userId);
                req.setAttribute("currentUser", user);
                req.getSession().setAttribute("currentUser", user);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            System.out.println("Current User ID: " + userId);
            req.getRequestDispatcher("/jsp/admin/profile/editProfile.jsp").forward(req, resp);
        } else if ("/changePassword".equals(action)) {
            req.getRequestDispatcher("/jsp/admin/profile/changePassword.jsp").forward(req, resp);
        } else {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws jakarta.servlet.ServletException, IOException {
        String action = req.getPathInfo();
        if ("/edit".equals(action)) {
            Integer userIdObj = (Integer) req.getSession().getAttribute("currentUserId");
            if (userIdObj == null) {
                req.getSession().setAttribute("error", "Session expired. Please log in again.");
                resp.sendRedirect(req.getContextPath() + "/login");
                return;
            }
            int userId = userIdObj;

            UsersBO usersBO = new UsersBO();
            Users user;
            try {
                user = usersBO.getUserById(userId);
                if (user == null) {
                    req.getSession().setAttribute("error", "User not found.");
                    resp.sendRedirect(req.getContextPath() + "/admin/profile");
                    return;
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

            // Form data
            String username = req.getParameter("username");
            String fullName = req.getParameter("fullName");
            String email = req.getParameter("email");
            String phone = req.getParameter("phone_number");
            String address = req.getParameter("address");

            // Update
            user.setUsername(username);
            user.setFullName(fullName);
            user.setEmail(email);
            user.setPhone(phone);
            user.setAddress(address);

            if (usersBO.updateUser(user)) {
                req.getSession().setAttribute("success", "Profile updated successfully.");
                req.getSession().setAttribute("currentUser", user);
            } else {
                req.getSession().setAttribute("error", "Failed to update profile.");
            }
            resp.sendRedirect(req.getContextPath() + "/admin/profile");
        } else if ("/changePassword".equals(action)) {
            Users user = (Users) req.getSession().getAttribute("currentUser");
            if (user == null) {
                Integer userIdObj = (Integer) req.getSession().getAttribute("currentUserId");
                if (userIdObj == null) {
                    req.getSession().setAttribute("error", "Session expired. Please log in again.");
                    resp.sendRedirect(req.getContextPath() + "/login");
                    return;
                }
                try {
                    user = new UsersBO().getUserById(userIdObj);
                    req.getSession().setAttribute("currentUser", user);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }

            String currentPassword = req.getParameter("currentPassword");
            String newPassword = req.getParameter("newPassword");

            UsersBO usersBO = new UsersBO();
            if (usersBO.checkPassword(user.getUserId(), currentPassword)) {
                usersBO.updatePassword(user.getUserId(), newPassword);
                req.getSession().setAttribute("success", "Password updated successfully.");
            } else {
                req.getSession().setAttribute("error", "Current password is incorrect.");
            }
            resp.sendRedirect(req.getContextPath() + "/admin/profile");
        } else {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }
}
