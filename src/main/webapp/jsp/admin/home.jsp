<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin Dashboard - PhoneMarket</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <link rel="stylesheet" href="/css/admin.css">
</head>
<body>
<div class="admin-wrapper">
  <!-- Sidebar Menu (CRUD Functions) -->
  <aside class="sidebar">
    <div class="sidebar-header">
      <h2><i class="fas fa-mobile-alt"></i> PhoneMarket Admin</h2>
    </div>
    <nav class="sidebar-nav">
      <ul>
        <li><a href="${pageContext.request.contextPath}/admin/home.jsp" class="active"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/products"><i class="fas fa-box"></i> Quản lý Sản phẩm </a></li>
        <li><a href="${pageContext.request.contextPath}/admin/orders"><i class="fas fa-shopping-cart"></i> Quản lý Đơn hàng</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/customers"><i class="fas fa-users"></i> Quản lý Khách hàng</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/reports"><i class="fas fa-chart-bar"></i> Báo cáo</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/settings"><i class="fas fa-cog"></i> Cài đặt</a></li>
      </ul>
    </nav>
  </aside>

  <!-- Main Content -->
  <main class="main-content">
    <!-- Header -->
    <header class="header">
      <div class="header-left">
        <i class="fas fa-bars menu-toggle"></i>
        <h1>Dashboard</h1>
      </div>
      <div class="header-right">
        <div class="search-bar">
          <i class="fas fa-search"></i>
          <input type="text" placeholder="Search or type command...">
        </div>
        <div class="user-profile">
          <span>MuSher</span>
          <img src="${pageContext.request.contextPath}/images/avatar.jpg" alt="User Avatar" class="avatar">
        </div>
      </div>
    </header>

    <!-- Stats Cards -->
    <section class="stats-grid">
      <div class="stat-card">
        <div class="stat-icon"><i class="fas fa-chart-line"></i></div>
        <div class="stat-info">
          <h3>3,782</h3>
          <p>Monthly Sales</p>
          <span class="stat-change positive">+10.1%</span>
        </div>
      </div>
      <div class="stat-card">
        <div class="stat-icon"><i class="fas fa-dollar-sign"></i></div>
        <div class="stat-info">
          <h3>5,359</h3>
          <p>Revenue</p>
          <span class="stat-change negative">-9.0%</span>
        </div>
      </div>
      <div class="stat-card">
        <div class="stat-icon"><i class="fas fa-users"></i></div>
        <div class="stat-info">
          <h3>1,234</h3>
          <p>New Customers</p>
          <span class="stat-change positive">+15%</span>
        </div>
      </div>
      <div class="stat-card">
        <div class="stat-icon"><i class="fas fa-shopping-bag"></i></div>
        <div class="stat-info">
          <h3>456</h3>
          <p>Orders</p>
          <span class="stat-change positive">+8%</span>
        </div>
      </div>
    </section>

    <!-- Charts Section -->
    <section class="charts-section">
      <div class="chart-card">
        <h3>Monthly Sales</h3>
        <div class="bar-chart">
          <!-- Giả lập data từ Servlet, dùng JSTL -->
          <c:forEach var="month" items="${monthlySales}" varStatus="status">
            <div class="bar" style="height: ${month.value * 2}px; background: ${status.index % 2 == 0 ? '#3b82f6' : '#10b981'}">
              <span>${month.label}</span>
            </div>
          </c:forEach>
        </div>
      </div>
      <div class="chart-card">
        <h3>Target Achievement</h3>
        <div class="progress-circle">
          <div class="circle" style="--progress: 75;">75%</div>
          <p>You earned $3,782 this month, higher than last month.</p>
        </div>
      </div>
      <div class="chart-card">
        <h3>Statistics</h3>
        <canvas id="lineChart" width="400" height="200"></canvas> <!-- Có thể dùng Chart.js nếu thêm lib -->
        <p>Monthly Quarterly Annually</p>
      </div>
    </section>

    <!-- Table Section -->
    <section class="table-section">
      <div class="table-card">
        <h3>Recent Orders</h3>
        <table>
          <thead>
          <tr>
            <th>ID</th>
            <th>Customer</th>
            <th>Product</th>
            <th>Status</th>
            <th>Amount</th>
          </tr>
          </thead>
          <tbody>
          <c:forEach var="order" items="${recentOrders}">
            <tr>
              <td>${order.id}</td>
              <td>${order.customer}</td>
              <td>${order.product}</td>
              <td><span class="status pending">${order.status}</span></td>
              <td>$${order.amount}</td>
            </tr>
          </c:forEach>
          </tbody>
        </table>
      </div>
    </section>
  </main>
</div>

<script>
  // Simple JS cho menu toggle và chart (tùy chọn)
  document.querySelector('.menu-toggle').addEventListener('click', () => {
    document.querySelector('.sidebar').classList.toggle('collapsed');
  });
  // Nếu dùng Chart.js, thêm <script src="https://cdn.jsdelivr.net/npm/chart.js"></script> và code canvas
</script>
</body>
</html>