<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%-- Đảm bảo EL được bật, mặc dù đã có trong khai báo taglib/Servlet 5+ --%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Add Product - PhoneMarket Admin</title>

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">

  <style>
    .form-section { background-color: white; padding: 20px; border-radius: 8px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
    .form-grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 20px; }
    .form-group.full-width { grid-column: 1 / -1; } /* Kéo dài qua 3 cột */
    .form-group label { display: block; margin-bottom: 5px; font-weight: 600; color: #555; }
    .form-group input:not([type="checkbox"]), .form-group textarea { width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box; }
    .checkbox-group { display: flex; align-items: center; }
    .checkbox-group input[type="checkbox"] { margin-right: 10px; width: auto; }
    .form-actions { margin-top: 20px; text-align: right; }
    .btn-primary { background-color: #007bff; color: white; padding: 10px 20px; border: none; border-radius: 4px; cursor: pointer; }
    .btn-outline { background-color: transparent; color: #6c757d; padding: 10px 20px; border: 1px solid #6c757d; border-radius: 4px; margin-right: 10px; cursor: pointer; }
  </style>

</head>
<body>
<div class="admin-wrapper">

  <aside class="sidebar">
    <div class="sidebar-header">
      <h2><i class="fas fa-mobile-alt"></i> PhoneMarket Admin</h2>
    </div>
    <nav class="sidebar-nav">
      <ul>
        <li><a href="${pageContext.request.contextPath}/admin/products"><i class="fas fa-list"></i> Products List</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/products/add" class="active"><i class="fas fa-box"></i> Add Product</a></li>
      </ul>
    </nav>
  </aside>

  <main class="main-content">
    <header class="header">
      <h1>Add New Product</h1>
      <p>Fill in the product details to insert into the catalog.</p>

      <c:if test="${not empty errorMessage}">
          <div style="color: #dc3545; background-color: #f8d7da; border: 1px solid #f5c6cb; padding: 10px; margin-bottom: 15px; border-radius: 4px;">
              ${errorMessage}
          </div>
      </c:if>
    </header>

    <section class="form-section">
      <form action="${pageContext.request.contextPath}/admin/products/add" method="post" class="product-form">
        <div class="form-grid">

          <div class="form-group">
            <label for="name">Product Name</label>
            <input type="text" id="name" name="name" value="${param.name}" required>
          </div>

          <div class="form-group">
            <label for="price">Price (USD)</label>
            <input type="number" step="0.01" id="price" name="price" value="${param.price}" required>
          </div>

          <div class="form-group">
            <label for="stock">Stock Quantity</label>
            <input type="number" id="stock" name="stockQuantity" min="0" value="${param.stockQuantity != null ? param.stockQuantity : 0}" required>
          </div>

          <div class="form-group full-width">
            <label for="description">Description</label>
            <textarea id="description" name="description" rows="3">${param.description}</textarea>
          </div>

          <div class="form-group">
            <label for="imageURL">Image URL</label>
            <input type="url" id="imageURL" name="imageUrl" value="${param.imageUrl}">
          </div>

          <div class="form-group checkbox-group">
            <input type="hidden" name="active" value="false">
            <input type="checkbox" id="active" name="active" value="true" checked>
            <label for="active">Active</label>
          </div>

        </div>

        <div class="form-actions">
          <button type="reset" class="btn-outline">Reset</button>
          <button type="submit" class="btn-primary">Create Product</button>
        </div>
      </form>
    </section>
  </main>
</div>
</body>
</html>