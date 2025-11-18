package com.phonemarket.controller.admin;

import com.phonemarket.model.bean.Products;
import com.phonemarket.model.bo.ProductsBo;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/products/*")
public class ProductsController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getPathInfo();
        if("/".equals(action) || action == null) {
            ProductsBo productsBo = new ProductsBo();
            req.setAttribute("productsList", productsBo.getAllProducts());
            for (int i = 0; i < productsBo.getAllProducts().size(); i++) {
                Products p = productsBo.getAllProducts().get(i);
                System.out.println("Product " + i + ": " + p.getName());
            }
            req.getRequestDispatcher("/jsp/admin/products/homeProducts.jsp").forward(req, resp);
        }
        else if ("/add".equals(action)) {
            req.getRequestDispatcher("/jsp/admin/products/addProducts.jsp").forward(req, resp);
        } else {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getPathInfo();
        if ("/add".equals(action)) {
            // Handle adding a new product (to be implemented)
        } else {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }
}