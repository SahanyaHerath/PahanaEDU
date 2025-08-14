<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile - Pahana Edu Billing System</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 1rem;
        }
        
        .profile-container {
            background: white;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 500px;
            text-align: center;
        }
        
        .logo {
            margin-bottom: 2rem;
        }
        
        .logo h1 {
            color: #333;
            font-size: 2rem;
            margin-bottom: 0.5rem;
        }
        
        .logo p {
            color: #666;
            font-size: 0.9rem;
        }
        
        .profile-info {
            text-align: left;
            margin-bottom: 2rem;
        }
        
        .info-group {
            margin-bottom: 1.5rem;
        }
        
        .info-group label {
            display: block;
            margin-bottom: 0.5rem;
            color: #333;
            font-weight: 500;
        }
        
        .info-group .value {
            padding: 0.75rem;
            background: #f8f9fa;
            border: 2px solid #e1e5e9;
            border-radius: 5px;
            font-size: 1rem;
            color: #333;
        }
        
        .btn {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 0.75rem 2rem;
            border: none;
            border-radius: 5px;
            font-size: 1rem;
            cursor: pointer;
            transition: transform 0.2s ease;
            text-decoration: none;
            display: inline-block;
            margin: 0.5rem;
        }
        
        .btn:hover {
            transform: translateY(-2px);
        }
        
        .btn-secondary {
            background: #6c757d;
        }
        
        .btn-danger {
            background: #dc3545;
        }
        
        .alert {
            padding: 0.75rem;
            border-radius: 5px;
            margin-bottom: 1rem;
            font-size: 0.9rem;
        }
        
        .alert-success {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }
        
        .alert-error {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }
        
        .links {
            margin-top: 1.5rem;
            padding-top: 1.5rem;
            border-top: 1px solid #e1e5e9;
        }
        
        .links a {
            color: #667eea;
            text-decoration: none;
            margin: 0 0.5rem;
            font-size: 0.9rem;
        }
        
        .links a:hover {
            text-decoration: underline;
        }
        
        .footer {
            margin-top: 2rem;
            color: #666;
            font-size: 0.8rem;
        }
    </style>
</head>
<body>
    <div class="profile-container">
        <div class="logo">
            <h1>Pahana Edu</h1>
            <p>User Profile</p>
        </div>
        
        <c:if test="${not empty success}">
            <div class="alert alert-success">
                ${success}
            </div>
        </c:if>
        
        <c:if test="${not empty error}">
            <div class="alert alert-error">
                ${error}
            </div>
        </c:if>
        
        <c:if test="${not empty user}">
            <div class="profile-info">
                <div class="info-group">
                    <label>Username</label>
                    <div class="value">${user.username}</div>
                </div>
                
                <div class="info-group">
                    <label>Role</label>
                    <div class="value">${user.role}</div>
                </div>
                
                <div class="info-group">
                    <label>Login Time</label>
                    <div class="value">${sessionScope.loginTime}</div>
                </div>
            </div>
        </c:if>
        
        <div class="actions">
            <a href="dashboard" class="btn">Dashboard</a>
            <a href="auth?action=logout" class="btn btn-danger">Logout</a>
        </div>
        
        <div class="links">
            <a href="dashboard">Back to Dashboard</a>
            <a href="dashboard?action=help">Help</a>
        </div>
        
        <div class="footer">
            <p>&copy; 2024 Pahana Edu. All rights reserved.</p>
            <p>Colombo City, Sri Lanka</p>
        </div>
    </div>
</body>
</html> 