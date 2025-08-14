<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pahana Edu - View Bill</title>
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
        }
        
        .container {
            max-width: 1000px;
            margin: 0 auto;
            padding: 20px;
        }
        
        .header {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .header h1 {
            color: #333;
        }
        
        .btn {
            background: #667eea;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            transition: background 0.3s ease;
        }
        
        .btn:hover {
            background: #5a6fd8;
        }
        
        .btn-success {
            background: #28a745;
        }
        
        .btn-success:hover {
            background: #218838;
        }
        
        .btn-secondary {
            background: #6c757d;
        }
        
        .btn-secondary:hover {
            background: #5a6268;
        }
        
        .bill-details {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }
        
        .bill-header {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 30px;
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 1px solid #eee;
        }
        
        .bill-info h3 {
            color: #333;
            margin-bottom: 15px;
        }
        
        .bill-info p {
            color: #666;
            margin-bottom: 8px;
        }
        
        .status-section {
            text-align: right;
        }
        
        .status {
            padding: 8px 16px;
            border-radius: 20px;
            font-weight: 500;
            display: inline-block;
            margin-bottom: 15px;
        }
        
        .status-pending {
            background: #fff3cd;
            color: #856404;
        }
        
        .status-paid {
            background: #d4edda;
            color: #155724;
        }
        
        .status-cancelled {
            background: #f8d7da;
            color: #721c24;
        }
        
        .items-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        
        .items-table th,
        .items-table td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #eee;
        }
        
        .items-table th {
            background: #f8f9fa;
            font-weight: 600;
            color: #333;
        }
        
        .items-table tr:hover {
            background: #f8f9fa;
        }
        
        .total-section {
            margin-top: 30px;
            padding: 20px;
            background: #f8f9fa;
            border-radius: 5px;
            text-align: right;
        }
        
        .total-section h3 {
            color: #333;
            margin-bottom: 10px;
        }
        
        .total-amount {
            font-size: 24px;
            font-weight: bold;
            color: #667eea;
        }
        
        .status-form {
            margin-top: 20px;
            padding-top: 20px;
            border-top: 1px solid #eee;
        }
        
        .status-form select {
            padding: 8px 12px;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-right: 10px;
        }
        
        .alert {
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 5px;
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
            
            .bill-header {
                grid-template-columns: 1fr;
                gap: 20px;
            }
            
            .status-section {
                text-align: left;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Bill Details</h1>
            <div>
                <a href="bill?action=print&id=${bill.billId}" class="btn btn-success">Print Bill</a>
                <a href="bill?action=list" class="btn btn-secondary" style="margin-left: 10px;">Back to Bills</a>
                <a href="dashboard" class="btn" style="margin-left: 10px;">Dashboard</a>
            </div>
        </div>
        
        <c:if test="${not empty success}">
            <div class="alert alert-success">${success}</div>
        </c:if>
        
        <c:if test="${not empty error}">
            <div class="alert alert-error">${error}</div>
        </c:if>
        
        <div class="bill-details">
            <div class="bill-header">
                <div class="bill-info">
                    <h3>Customer Information</h3>
                    <p><strong>Name:</strong> ${bill.customerName}</p>
                    <p><strong>Account Number:</strong> ${bill.accountNumber}</p>
                    <p><strong>Bill ID:</strong> ${bill.billId}</p>
                    <p><strong>Date:</strong> ${bill.billDate}</p>
                </div>
                
                <div class="status-section">
                    <h3>Bill Status</h3>
                    <span class="status status-${bill.status}">${bill.status}</span>
                    
                    <form action="bill" method="post" class="status-form">
                        <input type="hidden" name="action" value="update">
                        <input type="hidden" name="billId" value="${bill.billId}">
                        
                        <label for="status">Update Status:</label>
                        <select name="status" id="status">
                            <option value="pending" ${bill.status == 'pending' ? 'selected' : ''}>Pending</option>
                            <option value="paid" ${bill.status == 'paid' ? 'selected' : ''}>Paid</option>
                            <option value="cancelled" ${bill.status == 'cancelled' ? 'selected' : ''}>Cancelled</option>
                        </select>
                        
                        <button type="submit" class="btn">Update Status</button>
                    </form>
                </div>
            </div>
            
            <h3>Bill Items</h3>
            <c:choose>
                <c:when test="${not empty bill.items}">
                    <table class="items-table">
                        <thead>
                            <tr>
                                <th>Product</th>
                                <th>Quantity</th>
                                <th>Unit Price</th>
                                <th>Subtotal</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="item" items="${bill.items}">
                                <tr>
                                    <td>${item.productName}</td>
                                    <td>${item.quantity}</td>
                                    <td>
                                        <fmt:formatNumber value="${item.unitPrice}" type="currency" currencySymbol="Rs. "/>
                                    </td>
                                    <td>
                                        <fmt:formatNumber value="${item.subtotal}" type="currency" currencySymbol="Rs. "/>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    <p style="text-align: center; color: #666; padding: 20px;">No items found for this bill.</p>
                </c:otherwise>
            </c:choose>
            
            <div class="total-section">
                <h3>Total Amount: <span class="total-amount">
                    <fmt:formatNumber value="${bill.totalAmount}" type="currency" currencySymbol="Rs. "/>
                </span></h3>
            </div>
        </div>
    </div>
</body>
</html> 