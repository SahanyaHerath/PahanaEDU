<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pahana Edu - Create Bill</title>
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
        
        .btn-secondary {
            background: #6c757d;
        }
        
        .btn-secondary:hover {
            background: #5a6268;
        }
        
        .form-container {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: 500;
            color: #333;
        }
        
        .form-group select,
        .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
        }
        
        .form-group select:focus,
        .form-group input:focus {
            outline: none;
            border-color: #667eea;
        }
        
        .items-section {
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid #eee;
        }
        
        .items-section h3 {
            margin-bottom: 20px;
            color: #333;
        }
        
        .item-row {
            display: grid;
            grid-template-columns: 2fr 1fr 1fr 1fr auto;
            gap: 10px;
            align-items: center;
            margin-bottom: 15px;
            padding: 15px;
            background: #f8f9fa;
            border-radius: 5px;
        }
        
        .item-row select,
        .item-row input {
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 3px;
        }
        
        .remove-btn {
            background: #dc3545;
            color: white;
            border: none;
            padding: 8px 12px;
            border-radius: 3px;
            cursor: pointer;
        }
        
        .remove-btn:hover {
            background: #c82333;
        }
        
        .add-item-btn {
            background: #28a745;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
        }
        
        .add-item-btn:hover {
            background: #218838;
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
        
        .alert {
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 5px;
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
            
            .item-row {
                grid-template-columns: 1fr;
                gap: 10px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Create New Bill</h1>
            <div>
                <a href="bill?action=list" class="btn btn-secondary">Back to Bills</a>
                <a href="dashboard" class="btn" style="margin-left: 10px;">Dashboard</a>
            </div>
        </div>
        
        <c:if test="${not empty error}">
            <div class="alert alert-error">${error}</div>
        </c:if>
        
        <div class="form-container">
            <form action="bill" method="post">
                <input type="hidden" name="action" value="create">
                
                <div class="form-group">
                    <label for="customerId">Select Customer:</label>
                    <select name="customerId" id="customerId" required>
                        <option value="">Choose a customer...</option>
                        <c:forEach var="customer" items="${customers}">
                            <option value="${customer.customerId}">
                                ${customer.name} (${customer.accountNumber})
                            </option>
                        </c:forEach>
                    </select>
                </div>
                
                <div class="items-section">
                    <h3>Bill Items</h3>
                    <div id="items-container">
                        <div class="item-row">
                            <select name="productId" required>
                                <option value="">Select Product...</option>
                                <c:forEach var="product" items="${products}">
                                    <option value="${product.productId}" data-price="${product.price}">
                                        ${product.name} - Rs. ${product.price}
                                    </option>
                                </c:forEach>
                            </select>
                            <input type="number" name="quantity" placeholder="Qty" min="1" value="1" required>
                            <input type="text" class="unit-price" placeholder="Unit Price" readonly>
                            <input type="text" class="subtotal" placeholder="Subtotal" readonly>
                            <button type="button" class="remove-btn" onclick="removeItem(this)">Remove</button>
                        </div>
                    </div>
                    
                    <button type="button" class="add-item-btn" onclick="addItem()">Add Another Item</button>
                </div>
                
                <div class="total-section">
                    <h3>Total Amount: <span class="total-amount" id="total-amount">Rs. 0.00</span></h3>
                </div>
                
                <div style="text-align: center; margin-top: 30px;">
                    <button type="submit" class="btn">Create Bill</button>
                </div>
            </form>
        </div>
    </div>
    
    <script>
        function addItem() {
            const container = document.getElementById('items-container');
            const newRow = container.children[0].cloneNode(true);
            
            // Clear the values
            newRow.querySelector('select').value = '';
            newRow.querySelector('input[name="quantity"]').value = '1';
            newRow.querySelector('.unit-price').value = '';
            newRow.querySelector('.subtotal').value = '';
            
            // Add event listeners
            addEventListeners(newRow);
            
            container.appendChild(newRow);
        }
        
        function removeItem(button) {
            const container = document.getElementById('items-container');
            if (container.children.length > 1) {
                button.closest('.item-row').remove();
                calculateTotal();
            }
        }
        
        function addEventListeners(row) {
            const select = row.querySelector('select');
            const quantityInput = row.querySelector('input[name="quantity"]');
            const unitPriceInput = row.querySelector('.unit-price');
            const subtotalInput = row.querySelector('.subtotal');
            
            select.addEventListener('change', function() {
                const selectedOption = this.options[this.selectedIndex];
                const price = selectedOption.getAttribute('data-price');
                unitPriceInput.value = price ? 'Rs. ' + price : '';
                calculateSubtotal(row);
            });
            
            quantityInput.addEventListener('input', function() {
                calculateSubtotal(row);
            });
        }
        
        function calculateSubtotal(row) {
            const select = row.querySelector('select');
            const quantityInput = row.querySelector('input[name="quantity"]');
            const unitPriceInput = row.querySelector('.unit-price');
            const subtotalInput = row.querySelector('.subtotal');
            
            const selectedOption = select.options[select.selectedIndex];
            const price = selectedOption.getAttribute('data-price');
            const quantity = quantityInput.value;
            
            if (price && quantity) {
                const subtotal = parseFloat(price) * parseInt(quantity);
                subtotalInput.value = 'Rs. ' + subtotal.toFixed(2);
            } else {
                subtotalInput.value = '';
            }
            
            calculateTotal();
        }
        
        function calculateTotal() {
            const subtotals = document.querySelectorAll('.subtotal');
            let total = 0;
            
            subtotals.forEach(subtotal => {
                const value = subtotal.value.replace('Rs. ', '');
                if (value) {
                    total += parseFloat(value);
                }
            });
            
            document.getElementById('total-amount').textContent = 'Rs. ' + total.toFixed(2);
        }
        
        // Add event listeners to initial row
        document.addEventListener('DOMContentLoaded', function() {
            const initialRow = document.querySelector('.item-row');
            addEventListeners(initialRow);
        });
    </script>
</body>
</html> 