package com.phonemarket.controller;



import com.phonemarket.connection.ConnectJDBC;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class TestServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        resp.setContentType("text/html;charset=UTF-8");
        PrintWriter out = resp.getWriter();

        try (Connection conn = ConnectJDBC.getConnection();
             Statement stmt = conn.createStatement()) {

            // Lấy toàn bộ dữ liệu bảng sinhvien
            String sql = "SELECT * FROM sinhvien";
            ResultSet rs = stmt.executeQuery(sql);

            out.println("<h2>Danh sách sinh viên</h2>");

            while (rs.next()) {
                int id = rs.getInt("id");
                String ten = rs.getString("ten");
                int tuoi = rs.getInt("tuoi");
                String diachi = rs.getString("diachi");

                out.println("ID: " + id + "<br>");
                out.println("Tên: " + ten + "<br>");
                out.println("Tuổi: " + tuoi + "<br>");
                out.println("Địa chỉ: " + diachi + "<br><br>");
            }

        } catch (Exception e) {
            out.println("<p style='color:red'>Lỗi: " + e.getMessage() + "</p>");
            e.printStackTrace();
        }
    }
}
