package com.phonemarket.bo;

import com.phonemarket.dao.authDao;
import com.phonemarket.model.User;

public class authBO {
    authDao authDao = new authDao();



    public boolean register(User user) {
        return authDao.register(user);
    }

    public User login(String username, String password) throws Exception {
        // Business validation
        if (username == null || username.trim().isEmpty() || password == null || password.trim().isEmpty()) {
            throw new Exception("Tên đăng nhập và mật khẩu không được để trống!");
        }
        User user = authDao.findByUsernameAndPassword(username.trim(), password.trim());
        if (user == null) {
            throw new Exception("Tài khoản không tồn tại hoặc mật khẩu sai!");
        }
        return user;
    }
}
