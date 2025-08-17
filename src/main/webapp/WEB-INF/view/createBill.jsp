<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Bill - Pahana Edu</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        primary: {
                            50: '#f0f9ff',
                            100: '#e0f2fe',
                            200: '#bae6fd',
                            300: '#7dd3fc',
                            400: '#38bdf8',
                            500: '#0ea5e9',
                            600: '#0284c7',
                            700: '#0369a1',
                            800: '#075985',
                            900: '#0c4a6e'
                        }
                    }
                }
            }
        }
    </script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <script>function toggleSidebar(){document.getElementById('sidebar').classList.toggle('-translate-x-full');}</script>
    <style>
        .form-input:focus {
            box-shadow: 0 0 0 3px rgba(14, 165, 233, 0.1);
        }
        .form-input.error {
            border-color: #ef4444;
            box-shadow: 0 0 0 3px rgba(239, 68, 68, 0.1);
        }
        .form-input.success {
            border-color: #10b981;
            box-shadow: 0 0 0 3px rgba(16, 185, 129, 0.1);
        }
        .action-btn {
            transition: all 0.2s ease-in-out;
        }
        .action-btn:hover {
            transform: translateY(-2px);
        }
        .item-row {
            transition: all 0.2s ease-in-out;
        }
        .item-row:hover {
            transform: translateY(-1px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
        }
    </style>
</head>
<body class="bg-gradient-to-br from-gray-50 to-gray-100 min-h-screen">
    <div id="sidebar" class="fixed inset-y-0 left-0 z-50 w-64 bg-white shadow-xl transform -translate-x-full lg:translate-x-0 transition-transform duration-300 ease-in-out">
        <div class="flex items-center justify-center h-16 bg-gradient-to-r from-primary-600 to-primary-700">
            <div class="flex items-center space-x-3">
                <div class="w-8 h-8 bg-white rounded-full flex items-center justify-center">
                    <i class="fas fa-graduation-cap text-primary-600 text-sm"></i>
                </div>
                <span class="text-white font-bold text-lg">Pahana Edu</span>
            </div>
        </div>
        <nav class="mt-8 px-4">
            <div class="space-y-2">
                <a href="dashboard" class="flex items-center px-4 py-3 text-gray-600 hover:text-primary-600 hover:bg-primary-50 rounded-xl transition-all duration-200">
                    <i class="fas fa-tachometer-alt w-5 h-5 mr-3"></i>Dashboard
                </a>
                <a href="customer?action=list" class="flex items-center px-4 py-3 text-gray-600 hover:text-primary-600 hover:bg-primary-50 rounded-xl transition-all duration-200">
                    <i class="fas fa-users w-5 h-5 mr-3"></i>Customers
                </a>
                <a href="product?action=list" class="flex items-center px-4 py-3 text-gray-600 hover:text-primary-600 hover:bg-primary-50 rounded-xl transition-all duration-200">
                    <i class="fas fa-book w-5 h-5 mr-3"></i>Products
                </a>
                <a href="bill?action=list" class="flex items-center px-4 py-3 text-primary-600 bg-primary-50 rounded-xl font-medium shadow-sm">
                    <i class="fas fa-file-invoice-dollar w-5 h-5 mr-3"></i>Bills
                </a>
                <c:if test="${sessionScope.role == 'admin'}">
                    <a href="user-management?action=list" class="flex items-center px-4 py-3 text-gray-600 hover:text-primary-600 hover:bg-primary-50 rounded-xl transition-all duration-200">
                        <i class="fas fa-user-cog w-5 h-5 mr-3"></i>User Management
                    </a>
                </c:if>
                <a href="dashboard?action=help" class="flex items-center px-4 py-3 text-gray-600 hover:text-primary-600 hover:bg-primary-50 rounded-xl transition-all duration-200">
                    <i class="fas fa-question-circle w-5 h-5 mr-3"></i>Help
                </a>
            </div>
        </nav>
        <div class="absolute bottom-0 left-0 right-0 p-4 border-t border-gray-200">
            <div class="flex items-center space-x-3">
                <div class="w-10 h-10 bg-primary-100 rounded-full flex items-center justify-center">
                    <i class="fas fa-user text-primary-600"></i>
                </div>
                <div class="flex-1">
                    <p class="text-sm font-medium text-gray-900">${sessionScope.username}</p>
                    <p class="text-xs text-gray-500 capitalize">${sessionScope.role}</p>
                </div>
                <a href="dashboard?action=logout" class="text-gray-400 hover:text-red-500 transition-colors duration-200">
                    <i class="fas fa-sign-out-alt"></i>
                </a>
            </div>
        </div>
    </div>

    <div class="lg:ml-64">
        <div class="bg-white shadow-sm border-b border-gray-200">
            <div class="flex items-center justify-between px-6 py-4">
                <div class="flex items-center space-x-4">
                    <button onclick="toggleSidebar()" class="lg:hidden text-gray-500 hover:text-gray-700">
                        <i class="fas fa-bars text-xl"></i>
                    </button>
                    <div>
                        <h1 class="text-2xl font-bold text-gray-900">Create New Bill</h1>
                        <p class="text-sm text-gray-600">Generate a new invoice for your customer</p>
                    </div>
                </div>
                <div class="flex items-center space-x-4">
                    <a href="bill?action=list" class="bg-gray-100 text-gray-700 px-4 py-2 rounded-xl hover:bg-gray-200 transition-all duration-200 flex items-center">
                        <i class="fas fa-list mr-2"></i>Back to Bills
                    </a>
                </div>
            </div>
        </div>

        <div class="p-6">
            <c:if test="${not empty error}">
                <div class="mb-6 bg-red-50 border border-red-200 rounded-xl p-4 shadow-sm">
                    <div class="flex items-center">
                        <i class="fas fa-exclamation-circle text-red-500 mr-2"></i>
                        <span class="text-red-800 font-medium">${error}</span>
                    </div>
                </div>
            </c:if>

            <div class="max-w-4xl mx-auto">
                <div class="bg-white rounded-2xl shadow-lg border border-gray-200 p-8">
                    <!-- Form Header -->
                    <div class="mb-8">
                        <div class="flex items-center mb-6">
                            <div class="w-12 h-12 bg-gradient-to-br from-primary-100 to-primary-200 rounded-xl flex items-center justify-center mr-4">
                                <i class="fas fa-file-invoice-dollar text-primary-600 text-xl"></i>
                            </div>
                            <div>
                                <h2 class="text-2xl font-bold text-gray-900">Bill Information</h2>
                                <p class="text-gray-600">Select customer and add items to create the invoice</p>
                            </div>
                        </div>
                    </div>

                    <form action="bill" method="post" class="space-y-8">
                        <input type="hidden" name="action" value="create">

                        <!-- Customer Selection -->
                        <div class="bg-gradient-to-r from-blue-50 to-indigo-50 border border-blue-200 rounded-xl p-6">
                            <div class="flex items-center mb-4">
                                <div class="w-10 h-10 bg-blue-100 rounded-xl flex items-center justify-center mr-3">
                                    <i class="fas fa-user text-blue-600"></i>
                                </div>
                                <h3 class="text-lg font-semibold text-blue-900">Customer Selection</h3>
                            </div>
                            <div class="relative">
                                <label for="customerId" class="block text-sm font-semibold text-gray-700 mb-3">
                                    <i class="fas fa-users mr-2 text-blue-600"></i>Select Customer
                                </label>
                                <select name="customerId" id="customerId" required 
                                        class="form-input w-full px-4 py-4 border border-gray-300 rounded-xl focus:ring-2 focus:ring-primary-500 focus:border-primary-500 text-gray-700 bg-white">
                                    <option value="">Choose a customer...</option>
                                    <c:forEach var="customer" items="${customers}">
                                        <option value="${customer.customerId}">${customer.name} (${customer.accountNumber})</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                        <!-- Bill Items Section -->
                        <div class="bg-gradient-to-r from-green-50 to-emerald-50 border border-green-200 rounded-xl p-6">
                            <div class="flex items-center justify-between mb-6">
                                <div class="flex items-center">
                                    <div class="w-10 h-10 bg-green-100 rounded-xl flex items-center justify-center mr-3">
                                        <i class="fas fa-shopping-cart text-green-600"></i>
                                    </div>
                                    <h3 class="text-lg font-semibold text-green-900">Bill Items</h3>
                                </div>
                                <button type="button" class="action-btn bg-gradient-to-r from-green-600 to-green-700 text-white px-4 py-2 rounded-xl hover:from-green-700 hover:to-green-800 transition-all duration-200 flex items-center shadow-lg hover:shadow-xl" onclick="addItem()">
                                    <i class="fas fa-plus mr-2"></i>Add Item
                                </button>
                            </div>
                            
                            <div id="items-container" class="space-y-4">
                                <div class="item-row bg-white border border-gray-200 rounded-xl p-4 shadow-sm">
                                    <div class="grid grid-cols-1 lg:grid-cols-12 gap-4">
                                        <div class="lg:col-span-5">
                                            <label class="block text-sm font-medium text-gray-700 mb-2">Product</label>
                                            <select name="productId" required 
                                                    class="form-input w-full px-4 py-3 border border-gray-300 rounded-xl focus:ring-2 focus:ring-primary-500 focus:border-primary-500 text-gray-700 bg-white">
                                                <option value="">Select Product...</option>
                                                <c:forEach var="product" items="${products}">
                                                    <option value="${product.productId}" data-price="${product.price}" data-stock="${product.quantity}">
                                                        ${product.name} - Rs. ${product.price} (Stock: ${product.quantity})
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="lg:col-span-2">
                                            <label class="block text-sm font-medium text-gray-700 mb-2">Quantity</label>
                                            <input type="number" name="quantity" min="1" value="1" required 
                                                   class="form-input w-full px-4 py-3 border border-gray-300 rounded-xl focus:ring-2 focus:ring-primary-500 focus:border-primary-500 text-gray-700 bg-white" 
                                                   placeholder="Qty">
                                        </div>
                                        <div class="lg:col-span-2">
                                            <label class="block text-sm font-medium text-gray-700 mb-2">Unit Price</label>
                                            <input type="text" class="unit-price form-input w-full px-4 py-3 border border-gray-300 rounded-xl bg-gray-50 text-gray-700" 
                                                   placeholder="Unit Price" readonly>
                                        </div>
                                        <div class="lg:col-span-2">
                                            <label class="block text-sm font-medium text-gray-700 mb-2">Subtotal</label>
                                            <input type="text" class="subtotal form-input w-full px-4 py-3 border border-gray-300 rounded-xl bg-gray-50 text-gray-700 font-semibold" 
                                                   placeholder="Subtotal" readonly>
                                        </div>
                                        <div class="lg:col-span-1 flex items-end">
                                            <button type="button" class="action-btn bg-red-600 text-white px-4 py-3 rounded-xl hover:bg-red-700 transition-all duration-200 shadow-lg hover:shadow-xl" 
                                                    onclick="removeItem(this)">
                                                <i class="fas fa-times"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Total Amount Section -->
                        <div class="bg-gradient-to-r from-purple-50 to-pink-50 border border-purple-200 rounded-xl p-6">
                            <div class="flex items-center justify-between">
                                <div class="flex items-center">
                                    <div class="w-10 h-10 bg-purple-100 rounded-xl flex items-center justify-center mr-3">
                                        <i class="fas fa-calculator text-purple-600"></i>
                                    </div>
                                    <h3 class="text-lg font-semibold text-purple-900">Total Amount</h3>
                                </div>
                                <div class="text-right">
                                    <div class="text-3xl font-bold text-purple-600">
                                        <span id="total-amount">Rs. 0.00</span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Form Actions -->
                        <div class="flex items-center justify-center gap-4 pt-6 border-t border-gray-200">
                            <button type="submit" class="action-btn bg-gradient-to-r from-primary-600 to-primary-700 text-white px-8 py-4 rounded-xl hover:from-primary-700 hover:to-primary-800 transition-all duration-200 flex items-center shadow-lg hover:shadow-xl">
                                <i class="fas fa-file-invoice-dollar mr-2"></i>Create Bill
                            </button>
                            <a href="bill?action=list" class="action-btn bg-gray-100 text-gray-700 px-8 py-4 rounded-xl hover:bg-gray-200 transition-all duration-200 flex items-center">
                                <i class="fas fa-times mr-2"></i>Cancel
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script>
        function addItem() {
            const container = document.getElementById('items-container');
            const row = container.children[0].cloneNode(true);
            
            // Reset values
            row.querySelector('select').value = '';
            row.querySelector('input[name="quantity"]').value = '1';
            row.querySelector('.unit-price').value = '';
            row.querySelector('.subtotal').value = '';
            
            addEventListeners(row);
            container.appendChild(row);
        }
        
        function removeItem(btn) {
            const container = document.getElementById('items-container');
            if (container.children.length > 1) {
                btn.closest('.item-row').remove();
                calculateTotal();
            }
        }
        
        function addEventListeners(row) {
            const select = row.querySelector('select');
            const quantity = row.querySelector('input[name="quantity"]');
            const unitPrice = row.querySelector('.unit-price');
            const subtotal = row.querySelector('.subtotal');
            
            select.addEventListener('change', function() {
                const option = this.options[this.selectedIndex];
                const price = option.getAttribute('data-price');
                const stock = option.getAttribute('data-stock');
                
                unitPrice.value = price ? ('Rs. ' + price) : '';
                
                // Set max quantity based on stock
                if (stock) {
                    quantity.max = stock;
                    if (parseInt(quantity.value) > parseInt(stock)) {
                        quantity.value = stock;
                    }
                }
                
                calculateSubtotal(row);
            });
            
            quantity.addEventListener('input', function() {
                const select = row.querySelector('select');
                const option = select.options[select.selectedIndex];
                const stock = option.getAttribute('data-stock');
                
                // Validate quantity against stock
                if (stock && parseInt(this.value) > parseInt(stock)) {
                    this.value = stock;
                    alert('Quantity cannot exceed available stock (' + stock + ' units)');
                }
                
                calculateSubtotal(row);
            });
        }
        
        function calculateSubtotal(row) {
            const select = row.querySelector('select');
            const quantity = row.querySelector('input[name="quantity"]');
            const unitPrice = row.querySelector('.unit-price');
            const subtotal = row.querySelector('.subtotal');
            
            const option = select.options[select.selectedIndex];
            const price = option.getAttribute('data-price');
            const qty = quantity.value;
            
            if (price && qty) {
                const value = parseFloat(price) * parseInt(qty);
                subtotal.value = 'Rs. ' + value.toFixed(2);
            } else {
                subtotal.value = '';
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
        
        document.addEventListener('DOMContentLoaded', function() {
            addEventListeners(document.querySelector('.item-row'));
        });
    </script>
</body>
</html> 