// File: 'src/main/webapp/jsp/user/profile/editProfile.jsp'
<%@ page contentType="text/html;charset=UTF-8" language="java" import="com.phonemarket.model.bean.Users" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Edit Profile - Phone Market</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/profile.css">
</head>
<body>
<div class="admin-wrapper">
    <%@ include file="../component/Header.jsp" %>

    <main class="user-profile-page">
        <!-- Notifications (flash, one-time) -->
        <c:if test="${not empty sessionScope.success}">
            <div class="alert alert-success">
                <span class="alert-icon">✓</span>
                <span><c:out value="${sessionScope.success}" escapeXml="true"/></span>
                <button class="alert-close" onclick="this.parentElement.remove()">×</button>
            </div>
            <c:remove var="success" scope="session"/>
        </c:if>
        <c:if test="${not empty sessionScope.error}">
            <div class="alert alert-error">
                <span class="alert-icon">✗</span>
                <span><c:out value="${sessionScope.error}" escapeXml="true"/></span>
                <button class="alert-close" onclick="this.parentElement.remove()">×</button>
            </div>
            <c:remove var="error" scope="session"/>
        </c:if>

        <!-- Edit Profile Form -->
        <section class="edit-profile-section">
            <div class="edit-card">
                <header class="edit-card__header">
                    <h1>Edit your information</h1>
                    <p>Update your account details below</p>
                </header>

                <form action="${pageContext.request.contextPath}/profile/edit" method="post" id="userEditProfileForm" class="form">
                    <div class="form-grid">
                        <div class="form-group full-width">
                            <label for="username">Username <span class="required">*</span></label>
                            <input type="text" id="username" name="username"
                                   value="${currentUser.username}" required class="form-control"
                                   placeholder="Your username">
                        </div>

                        <div class="form-group">
                            <label for="fullName">Full Name <span class="required">*</span></label>
                            <input type="text" id="fullName" name="fullName"
                                   value="${currentUser.fullName}" required class="form-control"
                                   placeholder="Nguyễn Văn A">
                            <small class="form-text">Enter your full name</small>
                        </div>

                        <div class="form-group">
                            <label for="email">Email <span class="required">*</span></label>
                            <input type="email" id="email" name="email"
                                   value="${currentUser.email}" required class="form-control"
                                   placeholder="you@example.com">
                            <small class="form-text">Valid email required</small>
                        </div>

                        <div class="form-group">
                            <label for="phone">Phone Number <span class="required">*</span></label>
                            <input type="tel" id="phone" name="phone_number"
                                   value="${currentUser.phone}" required pattern="[0-9]{10}" class="form-control"
                                   placeholder="0123456789">
                            <small class="form-text">10 digit phone number</small>
                        </div>

                        <div class="form-group full-width">
                            <label for="address">Address</label>
                            <textarea id="address" name="address" rows="3" class="form-control"
                                      placeholder="House number, street, ward, district, city">${currentUser.address}</textarea>
                            <small class="form-text">Your current address</small>
                        </div>
                    </div>

                    <div class="form-actions">
                        <button type="submit" class="btn btn-primary">
                            <span class="btn-icon">💾</span> Save Changes
                        </button>
                        <button type="reset" class="btn btn-secondary">
                            <span class="btn-icon">↻</span> Reset
                        </button>
                        <a href="${pageContext.request.contextPath}/profile" class="btn btn-cancel">
                            <span class="btn-icon">✕</span> Cancel
                        </a>
                    </div>
                </form>
            </div>
        </section>
    </main>
</div>

<%@ include file="../component/Footer.jsp" %>

<script>
    // basic validation: phone & email
    document.getElementById('userEditProfileForm').addEventListener('submit', function(e) {
        const phone = document.getElementById('phone').value.trim();
        const email = document.getElementById('email').value.trim();
        if (!/^[0-9]{10}$/.test(phone)) { e.preventDefault(); alert('Please enter a valid 10-digit phone number'); return; }
        if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) { e.preventDefault(); alert('Please enter a valid email address'); return; }
    });

    // auto-dismiss alerts
    setTimeout(function() {
        document.querySelectorAll('.alert').forEach(function(el){ el.remove(); });
    }, 4000);
</script>
</body>
</html>
