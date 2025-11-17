package com.phonemarket.model.dao;

import com.phonemarket.model.bean.Products;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class ProductsDao {

    public ProductsDao() {
    }
    //TODO: sửa lại thông tin kết nối database cho đúng
    private Connection getConnection() throws SQLException {
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp_example", "root", "112233";
        return conn;
    }

    public Optional<Products> findById(int id) throws SQLException {
        String sql = "SELECT id, name, description, price FROM products WHERE id = ?";
        try (Connection c = getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) return Optional.of(mapRow(rs));
            }
        }
        return Optional.empty();
    }

    public List<Products> findAll() throws SQLException {
        String sql = "SELECT id, name, description, price FROM products";
        List<Products> list = new ArrayList<>();
        try (Connection c = getConnection();
             PreparedStatement ps = c.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) list.add(mapRow(rs));
        }
        return list;
    }

    public int insert(Products p) throws SQLException {
        String sql = "INSERT INTO products (name, description, price) VALUES (?, ?, ?)";
        try (Connection c = getConnection();
             PreparedStatement ps = c.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, p.getName());
            ps.setString(2, p.getDescription());
            ps.setDouble(3, p.getPrice());
            int affected = ps.executeUpdate();
            if (affected == 0) return -1;
            try (ResultSet keys = ps.getGeneratedKeys()) {
                if (keys.next()) return keys.getInt(1);
            }
        }
        return -1;
    }

    public boolean update(Products p) throws SQLException {
        String sql = "UPDATE products SET name = ?, description = ?, price = ? WHERE id = ?";
        try (Connection c = getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, p.getName());
            ps.setString(2, p.getDescription());
            ps.setDouble(3, p.getPrice());
            ps.setInt(4, p.getId());
            return ps.executeUpdate() > 0;
        }
    }

    public boolean delete(int id) throws SQLException {
        String sql = "DELETE FROM products WHERE id = ?";
        try (Connection c = getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        }
    }
    //TODO: coi lại database và sửa lại hàm mapRow bên dưới
//    private Products mapRow(ResultSet rs) throws SQLException {
//        return new Products(
//                rs.getInt("id"),
//                rs.getString("name"),
//                rs.getString("description"),
//                rs.getDouble("price")
//        );
//    }
}
