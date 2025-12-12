<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Change Password - Phone Market</title>
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

        <!-- Change Password Form -->
        <section class="form-section" style="max-width:600px;margin:0 auto;padding:2rem 0;">
            <div class="form-card">
                <h2 style="margin:0 0 1rem;">Change Password</h2>
                <p style="margin:0 0 1.25rem;color:#64748b;">Choose a new password for your account.</p>

                <form id="changePasswordForm" action="${pageContext.request.contextPath}/profile/changePassword" method="post" novalidate>
                    <div class="form-group">
                        <label for="currentPassword">Current Password <span class="required">*</span></label>
                        <input type="password" id="currentPassword" name="currentPassword" required class="form-control">
                    </div>

                    <div class="form-group">
                        <label for="newPassword">New Password <span class="required">*</span></label>
                        <input type="password" id="newPassword" name="newPassword" required minlength="6" class="form-control">
                        <small class="help-text">Minimum 6 characters</small>
                    </div>

                    <div class="form-group">
                        <label for="confirmPassword">Confirm New Password <span class="required">*</span></label>
                        <input type="password" id="confirmPassword" name="confirmPassword" required minlength="6" class="form-control">
                    </div>

                    <div class="form-actions" style="margin-top:1.5rem;">
                        <button type="submit" class="btn btn-primary">Change Password</button>
                        <button type="button" class="btn btn-secondary" onclick="window.location.href='${pageContext.request.contextPath}/profile'">Cancel</button>
                    </div>
                </form>
            </div>
        </section>
    </main>
</div>

<%@ include file="../component/Footer.jsp" %>

<script>
    // client-side validation: match + length
    document.getElementById('changePasswordForm').addEventListener('submit', function(e) {
        const current = document.getElementById('currentPassword').value || '';
        const nw = document.getElementById('newPassword').value || '';
        const conf = document.getElementById('confirmPassword').value || '';

        if (nw.length < 6) {
            e.preventDefault();
            alert('Password must be at least 6 characters long.');
            return;
        }
        if (nw !== conf) {
            e.preventDefault();
            alert('New password and confirm password do not match.');
            return;
        }
        if (current.trim() === '') {
            e.preventDefault();
            alert('Please enter your current password.');
            return;
        }
    });

    // auto-dismiss alerts after 4s
    setTimeout(function(){
        document.querySelectorAll('.alert').forEach(function(el){
            if (!el) return;
            el.style.transition = 'opacity 0.25s ease';
            el.style.opacity = '0';
            setTimeout(function(){ el.remove(); }, 300);
        });
    }, 4000);
</script>
</body>
</html>
