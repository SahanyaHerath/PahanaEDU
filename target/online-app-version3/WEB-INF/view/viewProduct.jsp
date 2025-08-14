<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Details - Pahana Edu</title>
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
        
        .product-details {
            padding: 40px;
        }
        
        .product-card {
            background: #f8f9fa;
            border-radius: 15px;
            padding: 30px;
            margin-bottom: 30px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        
        .product-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
            padding-bottom: 20px;
            border-bottom: 2px solid #e9ecef;
        }
        
        .product-title {
            font-size: 2em;
            color: #333;
            font-weight: 600;
        }
        
        .product-id {
            background: #667eea;
            color: white;
            padding: 8px 16px;
            border-radius: 20px;
            font-size: 14px;
            font-weight: 500;
        }
        
        .product-info {
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
        
        .price-value {
            color: #28a745;
            font-weight: 700;
            font-size: 18px;
        }
        
        .description-section {
            background: white;
            padding: 20px;
            border-radius: 10px;
            border: 1px solid #e9ecef;
        }
        
        .description-content {
            background: #f8f9fa;
            padding: 15px;
            border-radius: 8px;
            color: #666;
            line-height: 1.6;
            min-height: 80px;
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
            
            .product-header {
                flex-direction: column;
                gap: 15px;
                text-align: center;
            }
            
            .product-info {
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
            <h1>Product Details</h1>
            <div>
                <a href="product?action=list" class="btn btn-secondary">Back to Products</a>
            </div>
        </div>
        
        <c:if test="${not empty success}">
            <div class="alert alert-success">${success}</div>
        </c:if>
        
        <c:if test="${not empty error}">
            <div class="alert alert-error">${error}</div>
        </c:if>
        
        <div class="product-details">
            <div class="product-card">
                <div class="product-header">
                    <h2 class="product-title">${product.name}</h2>
                    <span class="product-id">ID: ${product.productId}</span>
                </div>
                
                <div class="product-info">
                    <div class="info-section">
                        <h3>Basic Information</h3>
                        <div class="info-row">
                            <span class="info-label">Product ID:</span>
                            <span class="info-value">${product.productId}</span>
                        </div>
                        <div class="info-row">
                            <span class="info-label">Product Name:</span>
                            <span class="info-value">${product.name}</span>
                        </div>
                        <div class="info-row">
                            <span class="info-label">Price:</span>
                            <span class="info-value price-value">
                                <fmt:formatNumber value="${product.price}" type="currency" currencySymbol="Rs. "/>
                            </span>
                        </div>
                    </div>
                    
                    <div class="info-section">
                        <h3>Product Details</h3>
                        <div class="info-row">
                            <span class="info-label">Status:</span>
                            <span class="info-value">Active</span>
                        </div>
                        <div class="info-row">
                            <span class="info-label">Category:</span>
                            <span class="info-value">Books</span>
                        </div>
                        <div class="info-row">
                            <span class="info-label">Available:</span>
                            <span class="info-value">Yes</span>
                        </div>
                    </div>
                </div>
                
                <div class="description-section">
                    <h3>Description</h3>
                    <div class="description-content">
                        <c:choose>
                            <c:when test="${not empty product.description}">
                                ${product.description}
                            </c:when>
                            <c:otherwise>
                                <em>No description available for this product.</em>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
            
            <div class="action-buttons">
                <a href="product?action=edit&id=${product.productId}" class="btn btn-warning">Edit Product</a>
                <a href="product?action=delete&id=${product.productId}" class="btn btn-danger" 
                   onclick="return confirm('Are you sure you want to delete this product?')">Delete Product</a>
                <a href="product?action=list" class="btn btn-secondary">Back to Products</a>
            </div>
        </div>
    </div>
</body>
</html>