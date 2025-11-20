<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Products Management - PhoneMarket Admin</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">


    <link rel="stylesheet" href="/css/admin.css">
    <link rel="stylesheet" href="/css/component/dropdown.css">
    <link rel="stylesheet" href="/css/admin-products.css">
</head>
<body>
<div class="admin-wrapper">
    <!-- Include Sidebar nếu cần (từ trước) -->
    <%@ include file="../component/sidebar.jsp" %>

    <!-- Main Content -->
    <main class="main-content">
        <!-- Include Header với Dropdown -->
        <%@ include file="../component/header.jsp" %>

        <!-- Breadcrumb & New Product Button -->
        <div class="breadcrumb-section">
            <nav class="breadcrumb">
                <a href="${pageContext.request.contextPath}/admin/home"><i class="fas fa-home"></i> Home</a>
                <span>/</span>
                <a href="#">Ecommerce</a>
                <span>/</span>
                <span>Products</span>
            </nav>
            <button class="btn-new-product" onclick="window.location.href='${pageContext.request.contextPath}/admin/products/new'">
                <i class="fas fa-plus"></i> New Product
            </button>
        </div>

        <!-- Search & Filters -->
        <div class="filter-section">
            <div class="search-input">
                <i class="fas fa-search"></i>
                <input type="text" placeholder="Search products..." id="searchInput" onkeyup="filterTable()">
            </div>
            <div class="filters">
                <button class="btn-filter" onclick="toggleFilters()">More filter</button>
                <select id="categoryFilter" onchange="filterTable()">
                    <option value="">All Categories</option>
                    <option value="accessories">Accessories</option>
                    <option value="bags">Bags</option>
                    <option value="mens-fashion">Men's Fashion</option>
                    <option value="womens-fashion">Women's Fashion</option>
                </select>
                <button class="btn-export"><i class="fas fa-download"></i> Export</button>
            </div>
        </div>

        <!-- Products Table -->
        <div class="table-container">
            <table id="productsTable">
                <thead>
                <tr>
                    <th><input type="checkbox" id="selectAll" onclick="toggleSelectAll()"></th>
                    <th>Product</th>
                    <th>Category</th>
                    <th>Added Date</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <!-- Giả lập data mẫu trực tiếp trong JSP (không cần Controller) -->
                <c:forEach varStatus="status" begin="1" end="4" step="1">
                    <tr>
                        <td><input type="checkbox" class="row-checkbox"></td>
                        <td>
                            <div class="product-info">
                                <img src="/images/iphone.jpg" alt="Transparent Sunglasses" class="product-img">
                                <span>Transparent Sunglasses ${status.index}</span>
                            </div>
                        </td>
                        <td>
                           IPhone
                        </td>
                        <td>19 Jul, 2025</td>  <!-- Hardcode date string để tránh fmt error -->
                        <td>$65.29</td>
                        <td>235</td>
                        <td>
                            <c:choose>
                                <c:when test="${status.index % 2 == 0}">
                                    <span class="status active">Active</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="status inactive">Inactive</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td class="action-buttons">
                            <a href="#" title="View"><i class="fas fa-eye"></i></a>
                            <a href="#" title="Edit"><i class="fas fa-edit"></i></a>
                            <a href="#" title="Delete" onclick="return confirm('Xóa sản phẩm?')"><i class="fas fa-trash"></i></a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- Pagination -->
        <div class="pagination-section">
            <div class="pagination-info">
                Showing 1 to 4 of 4 entries  <!-- Hardcode cho test -->
            </div>
            <div class="pagination-buttons">
                <button class="btn-pag prev" onclick="changePage(-1)">Previous</button>
                <button class="btn-pag active" onclick="changePage(1)">1</button>
                <button class="btn-pag next" onclick="changePage(1)">Next</button>
            </div>
        </div>
    </main>
</div>

<!-- JS cho search, filter, pagination -->
<script src="${pageContext.request.contextPath}/js/admin-script.js"></script>
<script>
    // JS đơn giản cho test (filter/search work trên data giả lập)
    function filterTable() {
        const search = document.getElementById('searchInput').value.toLowerCase();
        const category = document.getElementById('categoryFilter').value;
        const rows = document.querySelectorAll('#productsTable tbody tr');
        let visible = 0;

        rows.forEach(row => {
            const productName = row.cells[1].textContent.toLowerCase();
            const cat = row.cells[2].textContent.toLowerCase();
            const show = productName.includes(search) && (category === '' || cat.includes(category));
            row.style.display = show ? '' : 'none';
            if (show) visible++;
        });

        document.querySelector('.pagination-info').textContent = `Showing 1 to ${visible} of ${visible} entries`;
    }

    function toggleSelectAll() {
        const checkboxes = document.querySelectorAll('.row-checkbox');
        checkboxes.forEach(cb => cb.checked = document.getElementById('selectAll').checked);
    }

    function changePage(direction) {
        console.log('Change page:', direction);  // Test log
    }

    function toggleFilters() {
        console.log('Toggle filters');  // Test log
    }
</script>
</body>
</html>