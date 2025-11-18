<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header class="header">
    <div class="container">
        <div class="header-left">
            <a href="${pageContext.request.contextPath}/" class="logo">
                <span class="logo-text">CellphoneS</span>
            </a>

            <div class="catalog-group">
                <div class="category-dropdown">
                    <button class="btn-category">
                        <i class="fas fa-bars"></i> Danh mục
                    </button>
                    <div class="dropdown-menu">
                        <a href="#">Điện thoại</a>
                        <a href="#">Laptop</a>
                        <a href="#">Tablet</a>
                        <a href="#">Phụ kiện</a>
                    </div>
                </div>

                <div class="location-select">
                    <i class="fas fa-map-marker-alt"></i>
                    <select>
                        <option>Hà Nội</option>
                        <option>TP. HCM</option>
                    </select>
                </div>
            </div>
        </div>

        <div class="search-bar">
            <input type="text" placeholder="Bạn muốn mua gì hôm nay?" />
            <button><i class="fas fa-search"></i></button>
        </div>

        <div class="header-actions">
            <a href="#" class="cart-icon">
                <i class="fas fa-shopping-cart"></i>
                <span class="badge">3</span>
            </a>
            <a href="${pageContext.request.contextPath}/login" class="login-btn">Đăng nhập</a>
        </div>
    </div>
</header>