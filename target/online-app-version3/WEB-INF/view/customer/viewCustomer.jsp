<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Customer - Pahana Edu Billing System</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f8f9fa;
            min-height: 100vh;
        }
        
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 2rem;
        }
        
        .header {
            background: white;
            padding: 1.5rem;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 2rem;
        }
        
        .header h1 {
            color: #333;
            font-size: 2rem;
            margin-bottom: 0.5rem;
        }
        
        .header p {
            color: #666;
        }
        
        .customer-details {
            background: white;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 2rem;
        }
        
        .detail-group {
            margin-bottom: 1.5rem;
        }
        
        .detail-group label {
            display: block;
            margin-bottom: 0.5rem;
            color: #333;
            font-weight: 600;
            font-size: 0.9rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        
        .detail-group .value {
            padding: 0.75rem;
            background: #f8f9fa;
            border: 2px solid #e1e5e9;
            border-radius: 5px;
            font-size: 1rem;
            color: #333;
            min-height: 2.5rem;
            display: flex;
            align-items: center;
        }
        
        .btn {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 0.75rem 1.5rem;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            display: inline-block;
            font-size: 0.9rem;
            cursor: pointer;
            transition: transform 0.2s ease;
            margin-right: 1rem;
            margin-bottom: 1rem;
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
        
        .btn-success {
            background: #28a745;
        }
        
        .alert {
            padding: 1rem;
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
        
        .nav-links {
            margin-top: 1rem;
        }
        
        .nav-links a {
            color: #667eea;
            text-decoration: none;
            margin-right: 1rem;
            font-size: 0.9rem;
        }
        
        .nav-links a:hover {
            text-decoration: underline;
        }
        
        .customer-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 1.5rem;
            border-radius: 10px;
            margin-bottom: 2rem;
            text-align: center;
        }
        
        .customer-header h2 {
            font-size: 1.8rem;
            margin-bottom: 0.5rem;
        }
        
        .customer-header p {
            opacity: 0.9;
            font-size: 1.1rem;
        }
        
        .actions {
            margin-top: 2rem;
            padding-top: 2rem;
            border-top: 1px solid #e1e5e9;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Customer Details</h1>
            <p>View customer information and manage their account</p>
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
        
        <c:if test="${not empty customer}">
            <div class="customer-header">
                <h2>${customer.name}</h2>
                <p>Account Number: ${customer.accountNumber}</p>
            </div>
            
            <div class="customer-details">
                <div class="detail-group">
                    <label>Account Number</label>
                    <div class="value">${customer.accountNumber}</div>
                </div>
                
                <div class="detail-group">
                    <label>Customer Name</label>
                    <div class="value">${customer.name}</div>
                </div>
                
                <div class="detail-group">
                    <label>Address</label>
                    <div class="value">${customer.address}</div>
                </div>
                
                <div class="detail-group">
                    <label>Telephone Number</label>
                    <div class="value">${customer.telephone}</div>
                </div>
                
                <div class="detail-group">
                    <label>Customer ID</label>
                    <div class="value">${customer.customerId}</div>
                </div>
            </div>
            
            <div class="actions">
                <a href="customer?action=edit&id=${customer.customerId}" class="btn">Edit Customer</a>
                <a href="bill?action=create&customerId=${customer.customerId}" class="btn btn-success">Create Bill</a>
                <a href="bill?action=list&customerId=${customer.customerId}" class="btn btn-secondary">View Bills</a>
                <a href="customer?action=delete&id=${customer.customerId}" class="btn btn-danger" 
                   onclick="return confirm('Are you sure you want to delete this customer?')">Delete Customer</a>
            </div>
        </c:if>
        
        <div class="nav-links">
            <a href="customer">Back to Customer List</a>
            <a href="dashboard">Dashboard</a>
            <a href="product">Product Management</a>
            <a href="bill">Billing Management</a>
            <a href="dashboard?action=help">Help</a>
            <a href="auth?action=logout">Logout</a>
        </div>
    </div>
</body>
</html> 