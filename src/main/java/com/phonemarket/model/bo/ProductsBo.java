package com.phonemarket.model.bo;

import com.phonemarket.model.bean.Products;
import com.phonemarket.model.dao.ProductsDao;
import java.util.List;

public class ProductsBo {
    private ProductsDao productsDao;

    public ProductsBo() {
        this.productsDao = new ProductsDao();
    }

    // Lấy tất cả sản phẩm
    public List<Products> getAllProducts() {
        return productsDao.getAllProducts();
    }

    // Lấy sản phẩm theo ID
    public Products getProductById(int id) {
        return productsDao.getProductById(id);
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
        return productsDao.addProduct(product);
    }

    // Cập nhật sản phẩm
    public boolean updateProduct(Products product) {
        if (product == null || product.getId() <= 0) {
            return false;
        }
        return productsDao.updateProduct(product);
    }

    // Xóa sản phẩm
    public boolean deleteProduct(int id) {
        if (id <= 0) {
            return false;
        }
        return productsDao.deleteProduct(id);
    }

    // Tìm kiếm sản phẩm theo tên
    public List<Products> searchProductsByName(String keyword) {
        if (keyword == null || keyword.trim().isEmpty()) {
            return getAllProducts();
        }
        return productsDao.searchProductsByName(keyword);
    }
}
