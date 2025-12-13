package com.phonemarket.controller.user;

import com.phonemarket.model.bean.Users;
import com.phonemarket.model.bo.UsersBO;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.sql.SQLException;

@WebServlet("/profile/*")
public class ProfileController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws jakarta.servlet.ServletException, java.io.IOException {
        String action = req.getPathInfo();
        if(action == null || "/".equals(action)) {
            int userId = (int) req.getSession().getAttribute("currentUserId");
            Users user;
            try {
                user = new UsersBO().getUserById(userId);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            req.setAttribute("currentUser", user);
            System.out.println("Current User ID: " + user.getUserId());
            req.getRequestDispatcher("/jsp/user/profile/profile.jsp").forward(req, resp);
        } else if ("/edit".equals(action)) {
            int userId = (int) req.getSession().getAttribute("currentUserId");
            try {
                Users user = new UsersBO().getUserById(userId);
                req.setAttribute("currentUser", user);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            System.out.println("DEBUG User profile controller Current User ID: " + userId);
            req.getRequestDispatcher("/jsp/user/profile/editProfile.jsp").forward(req, resp);

        } else if ("/changePassword".equals(action)) {
            req.getRequestDispatcher("/jsp/user/profile/changePassword.jsp").forward(req, resp);
        } else {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws jakarta.servlet.ServletException, java.io.IOException {
        String action = req.getPathInfo();
        if ("/edit".equals(action)) {
            int userId = (int) req.getSession().getAttribute("currentUserId");
            UsersBO usersBO = new UsersBO();
            Users user;
            try {
                user = usersBO.getUserById(userId);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

            // Lấy dữ liệu từ form
            String username = req.getParameter("username");
            String fullName = req.getParameter("fullName");
            String email = req.getParameter("email");
            String phone = req.getParameter("phone_number");
            String address = req.getParameter("address");

            // Cập nhật thông tin người dùng
            user.setUsername(username);
            user.setFullName(fullName);
            user.setEmail(email);
            user.setPhone(phone);
            user.setAddress(address);

            if(usersBO.updateUser(user)) { // Cập nhật vào DB
                req.getSession().setAttribute("success", "Profile updated successfully.");
                req.getSession().setAttribute("currentUser", user); // Cập nhật session
            } else {
                req.getSession().setAttribute("error", "Failed to update profile.");
            }
            resp.sendRedirect(req.getContextPath() + "/profile"); // Chuyển hướng về trang profile
        } else if ("/changePassword".equals(action)) {
            String currentPassword = req.getParameter("currentPassword");
            String newPassword = req.getParameter("newPassword");
            Users user = (Users) req.getSession().getAttribute("currentUser");
            UsersBO usersBO = new UsersBO();
            if (usersBO.checkPassword(user.getUserId(), currentPassword)) {
                usersBO.updatePassword(user.getUserId(), newPassword);
                req.getSession().setAttribute("success", "Password updated successfully.");
                resp.sendRedirect(req.getContextPath() + "/profile");
            } else {
                req.getSession().setAttribute("error", "Current password is incorrect.");
                resp.sendRedirect(req.getContextPath() + "/profile");
            }
        }
    }
}
