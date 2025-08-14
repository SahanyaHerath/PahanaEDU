<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pahana Edu - Bill #${bill.billId}</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: white;
            color: #333;
            line-height: 1.6;
        }
        
        .print-header {
            text-align: center;
            margin-bottom: 30px;
            padding: 20px;
            border-bottom: 2px solid #333;
        }
        
        .company-name {
            font-size: 28px;
            font-weight: bold;
            color: #333;
            margin-bottom: 5px;
        }
        
        .company-tagline {
            font-size: 14px;
            color: #666;
            margin-bottom: 10px;
        }
        
        .company-info {
            font-size: 12px;
            color: #666;
        }
        
        .bill-header {
            display: flex;
            justify-content: space-between;
            margin-bottom: 30px;
            padding: 20px;
            background: #f8f9fa;
            border-radius: 5px;
        }
        
        .customer-info,
        .bill-info {
            flex: 1;
        }
        
        .customer-info h3,
        .bill-info h3 {
            color: #333;
            margin-bottom: 15px;
            font-size: 18px;
        }
        
        .customer-info p,
        .bill-info p {
            margin-bottom: 5px;
            font-size: 14px;
        }
        
        .items-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 30px;
        }
        
        .items-table th,
        .items-table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
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
            text-align: right;
            margin-top: 30px;
            padding: 20px;
            background: #f8f9fa;
            border-radius: 5px;
        }
        
        .total-amount {
            font-size: 24px;
            font-weight: bold;
            color: #333;
        }
        
        .footer {
            margin-top: 50px;
            padding: 20px;
            border-top: 1px solid #ddd;
            text-align: center;
            font-size: 12px;
            color: #666;
        }
        
        .status {
            padding: 5px 10px;
            border-radius: 15px;
            font-size: 12px;
            font-weight: 500;
            display: inline-block;
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
        
        .print-btn {
            position: fixed;
            top: 20px;
            right: 20px;
            background: #667eea;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            z-index: 1000;
        }
        
        .print-btn:hover {
            background: #5a6fd8;
        }
        
        .back-btn {
            position: fixed;
            top: 20px;
            left: 20px;
            background: #6c757d;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            text-decoration: none;
            z-index: 1000;
        }
        
        .back-btn:hover {
            background: #5a6268;
        }
        
        @media print {
            .print-btn,
            .back-btn {
                display: none;
            }
            
            body {
                background: white;
            }
            
            .print-header {
                border-bottom: 2px solid #333;
            }
        }
        
        @media (max-width: 768px) {
            .bill-header {
                flex-direction: column;
                gap: 20px;
            }
            
            .items-table {
                font-size: 12px;
            }
            
            .items-table th,
            .items-table td {
                padding: 8px;
            }
        }
    </style>
</head>
<body>
    <button onclick="window.print()" class="print-btn">Print Bill</button>
    <a href="bill?action=view&id=${bill.billId}" class="back-btn">Back to Bill</a>
    
    <div class="print-header">
        <div class="company-name">Pahana Edu Bookshop</div>
        <div class="company-tagline">Your Trusted Source for Quality Books</div>
        <div class="company-info">
            Colombo City, Sri Lanka<br>
            Phone: +94 11 2345678 | Email: info@pahanaedu.com
        </div>
    </div>
    
    <div class="bill-header">
        <div class="customer-info">
            <h3>Bill To:</h3>
            <p><strong>Name:</strong> ${bill.customerName}</p>
            <p><strong>Account Number:</strong> ${bill.accountNumber}</p>
            <p><strong>Date:</strong> ${bill.billDate}</p>
        </div>
        
        <div class="bill-info">
            <h3>Bill Information:</h3>
            <p><strong>Bill ID:</strong> ${bill.billId}</p>
            <p><strong>Status:</strong> <span class="status status-${bill.status}">${bill.status}</span></p>
            <p><strong>Generated:</strong> ${bill.billDate}</p>
        </div>
    </div>
    
    <table class="items-table">
        <thead>
            <tr>
                <th>#</th>
                <th>Product</th>
                <th>Quantity</th>
                <th>Unit Price</th>
                <th>Subtotal</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="item" items="${bill.items}" varStatus="status">
                <tr>
                    <td>${status.index + 1}</td>
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
    
    <div class="total-section">
        <h3>Total Amount: <span class="total-amount">
            <fmt:formatNumber value="${bill.totalAmount}" type="currency" currencySymbol="Rs. "/>
        </span></h3>
    </div>
    
    <div class="footer">
        <p><strong>Thank you for your business!</strong></p>
        <p>For any queries, please contact us at info@pahanaedu.com or call +94 11 2345678</p>
        <p>This is a computer generated bill. No signature required.</p>
    </div>
    
    <script>
        // Auto-print when page loads (optional)
        // window.onload = function() {
        //     window.print();
        // };
    </script>
</body>
</html> 