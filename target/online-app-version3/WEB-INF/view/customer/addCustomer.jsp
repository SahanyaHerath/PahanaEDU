<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Customer - Pahana Edu Billing System</title>
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
        
        .form-container {
            background: white;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        
        .form-group {
            margin-bottom: 1.5rem;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            color: #333;
            font-weight: 500;
        }
        
        .form-group input,
        .form-group textarea {
            width: 100%;
            padding: 0.75rem;
            border: 2px solid #e1e5e9;
            border-radius: 5px;
            font-size: 1rem;
            transition: border-color 0.3s ease;
        }
        
        .form-group input:focus,
        .form-group textarea:focus {
            outline: none;
            border-color: #667eea;
        }
        
        .form-group textarea {
            resize: vertical;
            min-height: 100px;
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
            margin-right: 1rem;
        }
        
        .btn:hover {
            transform: translateY(-2px);
        }
        
        .btn-secondary {
            background: #6c757d;
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
        
        .account-number-display {
            background: #f8f9fa;
            padding: 1rem;
            border-radius: 5px;
            margin-bottom: 1.5rem;
            border: 2px solid #e1e5e9;
        }
        
        .account-number-display strong {
            color: #667eea;
            font-size: 1.1rem;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Add New Customer</h1>
            <p>Enter customer details to create a new account</p>
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
        
        <div class="form-container">
            <c:if test="${not empty accountNumber}">
                <div class="account-number-display">
                    <strong>Generated Account Number: ${accountNumber}</strong>
                </div>
            </c:if>
            
            <form action="customer" method="post">
                <input type="hidden" name="action" value="add">
                
                <div class="form-group">
                    <label for="accountNumber">Account Number</label>
                    <input type="text" id="accountNumber" name="accountNumber" required 
                           value="${accountNumber}" readonly>
                </div>
                
                <div class="form-group">
                    <label for="name">Customer Name</label>
                    <input type="text" id="name" name="name" required 
                           placeholder="Enter customer name" value="${param.name}">
                </div>
                
                <div class="form-group">
                    <label for="address">Address</label>
                    <textarea id="address" name="address" required 
                              placeholder="Enter customer address">${param.address}</textarea>
                </div>
                
                <div class="form-group">
                    <label for="telephone">Telephone Number</label>
                    <input type="tel" id="telephone" name="telephone" required 
                           placeholder="Enter telephone number" value="${param.telephone}">
                </div>
                
                <div class="form-actions">
                    <button type="submit" class="btn">Add Customer</button>
                    <a href="customer" class="btn btn-secondary">Cancel</a>
                </div>
            </form>
        </div>
        
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