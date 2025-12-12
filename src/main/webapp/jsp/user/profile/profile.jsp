<!-- File: `src/main/webapp/jsp/user/profile/profile.jsp` -->
<%@ page contentType="text/html;charset=UTF-8" language="java" import="com.phonemarket.model.bean.Users" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>User Profile - Phone Market</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/profile.css">
</head>
<body>
<div class="admin-wrapper">
    <%@ include file="../component/Header.jsp" %>

    <main class="user-profile-page">
        <!-- Notifications -->
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

        <section class="profile-content">
            <c:if test="${not empty currentUser}">
                <div class="profile-card">
                    <header class="profile-card__header">
                        <h1>Account Details</h1>
                        <span class="badge">${currentUser.role ? 'Admin' : 'User'}</span>
                    </header>
                    <div class="profile-details">
                        <div class="detail-row">
                            <span class="label">User ID</span>
                            <span class="value">${currentUser.userId}</span>
                        </div>
                        <div class="detail-row">
                            <span class="label">Username</span>
                            <span class="value">${currentUser.username}</span>
                        </div>
                        <div class="detail-row">
                            <span class="label">Full Name</span>
                            <span class="value">${currentUser.fullName}</span>
                        </div>
                        <div class="detail-row">
                            <span class="label">Email</span>
                            <span class="value">${currentUser.email}</span>
                        </div>
                        <div class="detail-row">
                            <span class="label">Phone</span>
                            <span class="value">${currentUser.phone}</span>
                        </div>
                        <div class="detail-row">
                            <span class="label">Address</span>
                            <span class="value">${currentUser.address}</span>
                        </div>
                    </div>
                    <div class="profile-actions">
                        <a class="btn btn-primary" href="${pageContext.request.contextPath}/profile/edit">Edit Profile</a>
                        <a class="btn btn-secondary" href="${pageContext.request.contextPath}/profile/changePassword">Change Password</a>
                        <a class="btn btn-secondary" href="${pageContext.request.contextPath}/logout">Logout</a>
                    </div>
                </div>
            </c:if>
            <c:if test="${empty currentUser}">
                <div class="no-data">
                    <p>Unable to find user information.</p>
                    <a class="btn btn-primary" href="${pageContext.request.contextPath}/login">Go to Login</a>
                </div>
            </c:if>
        </section>
    </main>
</div>
    <%@ include file="../component/Footer.jsp" %>
</body>
</html>
