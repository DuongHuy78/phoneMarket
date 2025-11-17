package com.phonemarket.model;

public class User {
    private String username;
    private String password;
    private int userId;
    private String email;
    private String phone;
    private String address;
    private String fullName;
    private boolean role;
    public User() {

    }
    public User(String username, String password, int userId, String email, String phone, String address, String fullName, boolean role) {

    }
    public String getUsername() {
        return username;
    }
    public String getPassword() {
        return password;
    }
    public int getUserId() {
        return userId;
    }
    public String getEmail() {
        return email;
    }
    public String getPhone() {
        return phone;
    }
    public String getAddress() {
        return address;
    }
    public String getFullName() {
        return fullName;
    }
    public boolean isRole() {
        return role;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public void setPassword(String password) {
        this.password = password;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public void setRole(boolean role) {
        this.role = role;
    }

    public void setId(int id) {
        this.userId = id;
    }
}
