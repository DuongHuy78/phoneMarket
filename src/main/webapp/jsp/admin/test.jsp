<%@ page import="java.sql.*" %>

<%@ page import="com.phonemarket.connection.ConnectJDBC" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Danh sách sinh viên</title>
  <style>
    table { border-collapse: collapse; width: 60%; }
    th, td { border: 1px solid #333; padding: 8px; text-align: left; }
    th { background-color: #eee; }
  </style>
</head>
<body>
<h2>Danh sách sinh viên</h2>

<%
  Connection conn = null;
  Statement stmt = null;
  ResultSet rs = null;

  try {
    conn = ConnectJDBC.getConnection();
    stmt = conn.createStatement();
    rs = stmt.executeQuery("SELECT * FROM sinhvien");

    out.println("<table>");
    out.println("<tr><th>ID</th><th>Tên</th><th>Tuổi</th><th>Địa chỉ</th></tr>");

    while (rs.next()) {
      out.println("<tr>");
      out.println("<td>" + rs.getInt("id") + "</td>");
      out.println("<td>" + rs.getString("ten") + "</td>");
      out.println("<td>" + rs.getInt("tuoi") + "</td>");
      out.println("<td>" + rs.getString("diachi") + "</td>");
      out.println("</tr>");
    }

    out.println("</table>");
  } catch (Exception e) {
    out.println("<p style='color:red'>Lỗi: " + e.getMessage() + "</p>");
    e.printStackTrace();
  } finally {
    try { if (rs != null) rs.close(); } catch (Exception ignored) {}
    try { if (stmt != null) stmt.close(); } catch (Exception ignored) {}
    try { if (conn != null) conn.close(); } catch (Exception ignored) {}
  }
%>

</body>
</html>
