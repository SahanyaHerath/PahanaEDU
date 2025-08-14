<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Product - Pahana Edu</title>
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
        input[type="number"], 
        textarea {
            width: 100%;
            padding: 15px;
            border: 2px solid #e9ecef;
            border-radius: 10px;
            font-size: 16px;
            transition: border-color 0.3s ease;
            background: #f8f9fa;
        }
        
        input[type="text"]:focus, 
        input[type="number"]:focus, 
        textarea:focus {
            outline: none;
            border-color: #667eea;
            background: white;
        }
        
        textarea {
            height: 120px;
            resize: vertical;
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
        
        .product-info {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 25px;
        }
        
        .product-info h3 {
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
            <h1>Edit Product</h1>
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
        
        <div class="form-container">
            <div class="product-info">
                <h3>Current Product Information</h3>
                <div class="info-row">
                    <span class="info-label">Product ID:</span>
                    <span class="info-value">${product.productId}</span>
                </div>
                <div class="info-row">
                    <span class="info-label">Current Name:</span>
                    <span class="info-value">${product.name}</span>
                </div>
                <div class="info-row">
                    <span class="info-label">Current Price:</span>
                    <span class="info-value">
                        <fmt:formatNumber value="${product.price}" type="currency" currencySymbol="Rs. "/>
                    </span>
                </div>
            </div>
            
            <form action="product?action=update" method="post">
                <input type="hidden" name="id" value="${product.productId}">
                
                <div class="form-group">
                    <label for="name">Product Name:</label>
                    <input type="text" id="name" name="name" value="${product.name}" required 
                           placeholder="Enter product name">
                </div>
                
                <div class="form-group">
                    <label for="price">Price (Rs.):</label>
                    <input type="number" step="0.01" id="price" name="price" value="${product.price}" required 
                           placeholder="0.00" min="0">
                </div>
                
                <div class="form-group">
                    <label for="description">Description:</label>
                    <textarea id="description" name="description" 
                              placeholder="Enter product description (optional)">${product.description}</textarea>
                </div>
                
                <div class="form-actions">
                    <button type="submit" class="btn">Update Product</button>
                    <a href="product?action=list" class="btn btn-secondary">Cancel</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>