<!-- Sidebar Menu Component (CRUD Functions) -->
<link rel="stylesheet" href="/css/component/sidebar.css">
<aside class="sidebar">
  <div class="sidebar-header">
    <h2><i class="fas fa-mobile-alt"></i> PhoneMarket Admin</h2>
  </div>
  <nav class="sidebar-nav">
    <ul>
      <li><a href="/admin/home" class="active"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
      <li><a href="/admin/products/admin-products.jpg"><i class="fas fa-box"></i> Quản lý Sản phẩm</a></li>
      <li><a href="${pageContext.request.contextPath}/admin/orders"><i class="fas fa-shopping-cart"></i> Quản lý Đơn hàng</a></li>
      <li><a href="${pageContext.request.contextPath}/admin/customers"><i class="fas fa-users"></i> Quản lý Khách hàng</a></li>
      <li><a href="${pageContext.request.contextPath}/admin/reports"><i class="fas fa-chart-bar"></i> Báo cáo</a></li>
      <li><a href="${pageContext.request.contextPath}/admin/settings"><i class="fas fa-cog"></i> Cài đặt</a></li>
    </ul>
  </nav>
</aside>