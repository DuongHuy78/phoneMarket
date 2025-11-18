package com.phonemarket.model.bo;

import com.phonemarket.model.bean.Products;
import com.phonemarket.model.dao.ProductsDao;

import java.sql.SQLException;
import java.util.List;

public class ProductsBo {
    private ProductsDao productsDao;

    public ProductsBo() {
        this.productsDao = new ProductsDao();
    }

    // Lấy tất cả sản phẩm
    public List<Products> getAllProducts() {
        try {
//            List<Products> temp = productsDao.findAll();
//            for(int i = 0; i < temp.size(); i++) {
//                System.out.println(temp.get(i).getName());
//            }
            return productsDao.findAll();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    // Lấy sản phẩm theo ID
    public Products getProductById(int id) {
        try {
            return productsDao.findById(id);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    // Thêm sản phẩm mới
    public boolean addProduct(Products product) {
        // Kiểm tra validation trước khi thêm
        if (product == null || product.getName() == null || product.getName().trim().isEmpty()) {
            return false;
        }
        if (product.getPrice() <= 0) {
            return false;
        }
        try {
            return productsDao.insert(product);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    // Cập nhật sản phẩm
    public boolean updateProduct(Products product) {
        if (product == null || product.getId() <= 0) {
            return false;
        }
        try {
            return productsDao.update(product);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    // Xóa sản phẩm
    public boolean deleteProduct(int id) {
        if (id <= 0) {
            return false;
        }
        try {
            return productsDao.delete(id);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    // Tìm kiếm sản phẩm theo tên
    public List<Products> searchProductsByName(String keyword) throws SQLException {
        if (keyword == null || keyword.trim().isEmpty()) {
            return getAllProducts();
        }
        try {
            return productsDao.findByName(keyword);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
