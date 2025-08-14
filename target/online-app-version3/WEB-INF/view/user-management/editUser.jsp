<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit User - Pahana Edu</title>
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
            padding: 20px;
        }
        
        .container {
            max-width: 800px;
            margin: 0 auto;
            background: white;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
            overflow: hidden;
        }
        
        .header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .header h1 {
            font-size: 2.5em;
            font-weight: 300;
        }
        
        .btn {
            display: inline-block;
            padding: 12px 24px;
            background: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 25px;
            transition: all 0.3s ease;
            border: none;
            cursor: pointer;
            font-size: 14px;
            font-weight: 500;
        }
        
        .btn:hover {
            background: #45a049;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }
        
        .btn-secondary {
            background: #6c757d;
        }
        
        .btn-secondary:hover {
            background: #5a6268;
        }
        
        .form-container {
            padding: 40px;
        }
        
        .form-group {
            margin-bottom: 25px;
        }
        
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #333;
            font-size: 14px;
        }
        
        input[type="text"], 
        input[type="password"],
        select {
            width: 100%;
            padding: 15px;
            border: 2px solid #e9ecef;
            border-radius: 10px;
            font-size: 16px;
            transition: border-color 0.3s ease;
            background: #f8f9fa;
        }
        
        input[type="text"]:focus, 
        input[type="password"]:focus,
        select:focus {
            outline: none;
            border-color: #667eea;
            background: white;
        }
        
        .form-actions {
            display: flex;
            gap: 15px;
            margin-top: 30px;
        }
        
        .alert {
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 8px;
            font-weight: 500;
        }
        
        .alert-success {
            background: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }
        
        .alert-error {
            background: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }
        
        .user-info {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 25px;
        }
        
        .user-info h3 {
            color: #333;
            margin-bottom: 15px;
        }
        
        .info-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
        }
        
        .info-label {
            font-weight: 600;
            color: #666;
        }
        
        .info-value {
            color: #333;
        }
        
        .password-note {
            background: #fff3cd;
            color: #856404;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
            border: 1px solid #ffeaa7;
        }
        
        .password-requirements {
            background: #f8f9fa;
            padding: 15px;
            border-radius: 8px;
            margin-top: 10px;
            font-size: 12px;
            color: #666;
        }
        
        .password-requirements ul {
            margin: 10px 0 0 20px;
        }
        
        .password-requirements li {
            margin-bottom: 5px;
        }
        
        @media (max-width: 768px) {
            .header {
                flex-direction: column;
                gap: 15px;
            }
            
            .form-actions {
                flex-direction: column;
            }
            
            .info-row {
                flex-direction: column;
                gap: 5px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Edit User</h1>
            <div>
                <a href="user-management?action=list" class="btn btn-secondary">Back to Users</a>
            </div>
        </div>
        
        <c:if test="${not empty success}">
            <div class="alert alert-success">${success}</div>
        </c:if>
        
        <c:if test="${not empty error}">
            <div class="alert alert-error">${error}</div>
        </c:if>
        
        <div class="form-container">
            <div class="user-info">
                <h3>Current User Information</h3>
                <div class="info-row">
                    <span class="info-label">User ID:</span>
                    <span class="info-value">${user.userId}</span>
                </div>
                <div class="info-row">
                    <span class="info-label">Current Username:</span>
                    <span class="info-value">${user.username}</span>
                </div>
                <div class="info-row">
                    <span class="info-label">Current Role:</span>
                    <span class="info-value">${user.role}</span>
                </div>
                <div class="info-row">
                    <span class="info-label">Created At:</span>
                    <span class="info-value">
                        <fmt:formatDate value="${user.createdAt}" pattern="dd/MM/yyyy HH:mm"/>
                    </span>
                </div>
            </div>
            
            <div class="password-note">
                <strong>Note:</strong> Leave password fields empty if you don't want to change the password.
            </div>
            
            <form action="user-management?action=update" method="post">
                <input type="hidden" name="userId" value="${user.userId}">
                
                <div class="form-group">
                    <label for="username">Username:</label>
                    <input type="text" id="username" name="username" value="${user.username}" required 
                           placeholder="Enter username" minlength="3" maxlength="50">
                </div>
                
                <div class="form-group">
                    <label for="password">New Password (Optional):</label>
                    <input type="password" id="password" name="password" 
                           placeholder="Leave empty to keep current password" minlength="6">
                    <div class="password-requirements">
                        <strong>Password Requirements:</strong>
                        <ul>
                            <li>Minimum 6 characters</li>
                            <li>Should contain letters and numbers</li>
                            <li>Avoid common passwords</li>
                        </ul>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="confirmPassword">Confirm New Password:</label>
                    <input type="password" id="confirmPassword" name="confirmPassword" 
                           placeholder="Confirm new password">
                </div>
                
                <div class="form-group">
                    <label for="role">Role:</label>
                    <select id="role" name="role" required>
                        <option value="">Select Role</option>
                        <option value="user" ${user.role == 'user' ? 'selected' : ''}>User</option>
                        <option value="manager" ${user.role == 'manager' ? 'selected' : ''}>Manager</option>
                        <option value="admin" ${user.role == 'admin' ? 'selected' : ''}>Admin</option>
                    </select>
                </div>
                
                <div class="form-actions">
                    <button type="submit" class="btn">Update User</button>
                    <a href="user-management?action=list" class="btn btn-secondary">Cancel</a>
                </div>
            </form>
        </div>
    </div>
    
    <script>
        // Password confirmation validation
        document.getElementById('confirmPassword').addEventListener('input', function() {
            const password = document.getElementById('password').value;
            const confirmPassword = this.value;
            
            if (password && confirmPassword && password !== confirmPassword) {
                this.setCustomValidity('Passwords do not match');
            } else {
                this.setCustomValidity('');
            }
        });
        
        document.getElementById('password').addEventListener('input', function() {
            const confirmPassword = document.getElementById('confirmPassword');
            if (confirmPassword.value) {
                if (this.value !== confirmPassword.value) {
                    confirmPassword.setCustomValidity('Passwords do not match');
                } else {
                    confirmPassword.setCustomValidity('');
                }
            }
        });
    </script>
</body>
</html>
