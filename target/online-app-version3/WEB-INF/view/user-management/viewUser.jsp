<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Details - Pahana Edu</title>
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
        
        .btn-warning {
            background: #ffc107;
            color: #212529;
        }
        
        .btn-warning:hover {
            background: #e0a800;
        }
        
        .btn-danger {
            background: #dc3545;
        }
        
        .btn-danger:hover {
            background: #c82333;
        }
        
        .btn-secondary {
            background: #6c757d;
        }
        
        .btn-secondary:hover {
            background: #5a6268;
        }
        
        .user-details {
            padding: 40px;
        }
        
        .user-card {
            background: #f8f9fa;
            border-radius: 15px;
            padding: 30px;
            margin-bottom: 30px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        
        .user-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
            padding-bottom: 20px;
            border-bottom: 2px solid #e9ecef;
        }
        
        .user-title {
            font-size: 2em;
            color: #333;
            font-weight: 600;
        }
        
        .user-id {
            background: #667eea;
            color: white;
            padding: 8px 16px;
            border-radius: 20px;
            font-size: 14px;
            font-weight: 500;
        }
        
        .user-info {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 30px;
            margin-bottom: 30px;
        }
        
        .info-section {
            background: white;
            padding: 20px;
            border-radius: 10px;
            border: 1px solid #e9ecef;
        }
        
        .info-section h3 {
            color: #333;
            margin-bottom: 15px;
            font-size: 18px;
            font-weight: 600;
        }
        
        .info-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 15px;
            padding-bottom: 10px;
            border-bottom: 1px solid #f1f3f4;
        }
        
        .info-row:last-child {
            border-bottom: none;
            margin-bottom: 0;
        }
        
        .info-label {
            font-weight: 600;
            color: #666;
            font-size: 14px;
        }
        
        .info-value {
            color: #333;
            font-weight: 500;
        }
        
        .role-badge {
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
            text-transform: uppercase;
        }
        
        .role-admin {
            background: #dc3545;
            color: white;
        }
        
        .role-user {
            background: #28a745;
            color: white;
        }
        
        .role-manager {
            background: #ffc107;
            color: #212529;
        }
        
        .action-buttons {
            display: flex;
            gap: 15px;
            justify-content: center;
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
        
        @media (max-width: 768px) {
            .header {
                flex-direction: column;
                gap: 15px;
            }
            
            .user-header {
                flex-direction: column;
                gap: 15px;
                text-align: center;
            }
            
            .user-info {
                grid-template-columns: 1fr;
                gap: 20px;
            }
            
            .action-buttons {
                flex-direction: column;
                align-items: center;
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
            <h1>User Details</h1>
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
        
        <div class="user-details">
            <div class="user-card">
                <div class="user-header">
                    <h2 class="user-title">${user.username}</h2>
                    <span class="user-id">ID: ${user.userId}</span>
                </div>
                
                <div class="user-info">
                    <div class="info-section">
                        <h3>Basic Information</h3>
                        <div class="info-row">
                            <span class="info-label">User ID:</span>
                            <span class="info-value">${user.userId}</span>
                        </div>
                        <div class="info-row">
                            <span class="info-label">Username:</span>
                            <span class="info-value">${user.username}</span>
                        </div>
                        <div class="info-row">
                            <span class="info-label">Role:</span>
                            <span class="info-value">
                                <span class="role-badge role-${user.role}">${user.role}</span>
                            </span>
                        </div>
                    </div>
                    
                    <div class="info-section">
                        <h3>Account Details</h3>
                        <div class="info-row">
                            <span class="info-label">Status:</span>
                            <span class="info-value">Active</span>
                        </div>
                        <div class="info-row">
                            <span class="info-label">Created At:</span>
                            <span class="info-value">
                                <fmt:formatDate value="${user.createdAt}" pattern="dd/MM/yyyy HH:mm"/>
                            </span>
                        </div>
                        <div class="info-row">
                            <span class="info-label">Last Login:</span>
                            <span class="info-value">N/A</span>
                        </div>
                    </div>
                </div>
                
                <div class="info-section">
                    <h3>Role Permissions</h3>
                    <c:choose>
                        <c:when test="${user.role == 'admin'}">
                            <div class="info-row">
                                <span class="info-label">Permissions:</span>
                                <span class="info-value">Full system access, user management, all operations</span>
                            </div>
                        </c:when>
                        <c:when test="${user.role == 'manager'}">
                            <div class="info-row">
                                <span class="info-label">Permissions:</span>
                                <span class="info-value">Customer management, billing, product management</span>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="info-row">
                                <span class="info-label">Permissions:</span>
                                <span class="info-value">Basic operations, view customers and bills</span>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            
            <div class="action-buttons">
                <a href="user-management?action=edit&id=${user.userId}" class="btn btn-warning">Edit User</a>
                <a href="user-management?action=delete&id=${user.userId}" class="btn btn-danger" 
                   onclick="return confirm('Are you sure you want to delete this user?')">Delete User</a>
                <a href="user-management?action=list" class="btn btn-secondary">Back to Users</a>
            </div>
        </div>
    </div>
</body>
</html>
