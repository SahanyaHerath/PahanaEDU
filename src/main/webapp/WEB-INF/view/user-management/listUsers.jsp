<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Management - Pahana Edu</title>
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
            max-width: 1200px;
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
        
        .btn-success {
            background: #28a745;
        }
        
        .btn-success:hover {
            background: #218838;
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
        
        .users-table {
            padding: 30px;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        
        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #eee;
        }
        
        th {
            background: #f8f9fa;
            font-weight: 600;
            color: #495057;
            text-transform: uppercase;
            font-size: 12px;
            letter-spacing: 1px;
        }
        
        tr:hover {
            background: #f8f9fa;
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
        
        .alert {
            padding: 15px;
            margin: 20px 30px;
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
        
        .empty-state {
            text-align: center;
            padding: 50px;
            color: #666;
        }
        
        .empty-state h3 {
            margin-bottom: 10px;
            color: #333;
        }
        
        .user-actions {
            display: flex;
            gap: 8px;
            flex-wrap: wrap;
        }
        
        .user-actions .btn {
            padding: 8px 16px;
            font-size: 12px;
        }
        
        @media (max-width: 768px) {
            .header {
                flex-direction: column;
                gap: 15px;
            }
            
            .users-table {
                overflow-x: auto;
            }
            
            .user-actions {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>User Management</h1>
            <div>
                <a href="user-management?action=add" class="btn">Add New User</a>
                <a href="dashboard" class="btn btn-secondary" style="margin-left: 10px;">Back to Dashboard</a>
            </div>
        </div>
        
        <c:if test="${not empty success}">
            <div class="alert alert-success">${success}</div>
        </c:if>
        
        <c:if test="${not empty error}">
            <div class="alert alert-error">${error}</div>
        </c:if>
        
        <div class="users-table">
            <c:choose>
                <c:when test="${not empty users}">
                    <table>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Username</th>
                                <th>Role</th>
                                <th>Created At</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="user" items="${users}">
                                <tr>
                                    <td>${user.userId}</td>
                                    <td>${user.username}</td>
                                    <td>
                                        <span class="role-badge role-${user.role}">${user.role}</span>
                                    </td>
                                    <td>
                                        <fmt:formatDate value="${user.createdAt}" pattern="dd/MM/yyyy HH:mm"/>
                                    </td>
                                    <td>
                                        <div class="user-actions">
                                            <a href="user-management?action=view&id=${user.userId}" class="btn">View</a>
                                            <a href="user-management?action=edit&id=${user.userId}" class="btn btn-warning">Edit</a>
                                            <a href="user-management?action=delete&id=${user.userId}" class="btn btn-danger" 
                                               onclick="return confirm('Are you sure you want to delete this user?')">Delete</a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    <div class="empty-state">
                        <h3>No Users Found</h3>
                        <p>There are no users in the system yet. Add your first user to get started.</p>
                        <a href="user-management?action=add" class="btn">Add First User</a>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</body>
</html>
