<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pahana Edu - Create Bill</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>tailwind.config={theme:{extend:{colors:{primary:{50:'#eff6ff',100:'#dbeafe',200:'#bfdbfe',300:'#93c5fd',400:'#60a5fa',500:'#3b82f6',600:'#2563eb',700:'#1d4ed8',800:'#1e40af',900:'#1e3a8a'}}}}}</script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <script>function toggleSidebar(){document.getElementById('sidebar').classList.toggle('-translate-x-full');}</script>
</head>
<body class="bg-gray-50">
    <div id="sidebar" class="fixed inset-y-0 left-0 z-50 w-64 bg-white shadow-lg transform -translate-x-full lg:translate-x-0 transition-transform duration-300 ease-in-out">
        <div class="flex items-center justify-center h-16 bg-gradient-to-r from-primary-600 to-primary-700">
            <div class="flex items-center space-x-3"><div class="w-8 h-8 bg-white rounded-full flex items-center justify-center"><i class="fas fa-graduation-cap text-primary-600 text-sm"></i></div><span class="text-white font-bold text-lg">Pahana Edu</span></div>
        </div>
        <nav class="mt-8 px-4">
            <div class="space-y-2">
                <a href="dashboard" class="flex items-center px-4 py-3 text-gray-600 hover:text-primary-600 hover:bg-primary-50 rounded-lg transition-colors duration-200"><i class="fas fa-tachometer-alt w-5 h-5 mr-3"></i>Dashboard</a>
                <a href="customer?action=list" class="flex items-center px-4 py-3 text-gray-600 hover:text-primary-600 hover:bg-primary-50 rounded-lg transition-colors duration-200"><i class="fas fa-users w-5 h-5 mr-3"></i>Customers</a>
                <a href="product?action=list" class="flex items-center px-4 py-3 text-gray-600 hover:text-primary-600 hover:bg-primary-50 rounded-lg transition-colors duration-200"><i class="fas fa-book w-5 h-5 mr-3"></i>Products</a>
                <a href="bill?action=list" class="flex items-center px-4 py-3 text-primary-600 bg-primary-50 rounded-lg font-medium"><i class="fas fa-file-invoice-dollar w-5 h-5 mr-3"></i>Bills</a>
                <c:if test="${sessionScope.role == 'admin'}"><a href="user-management?action=list" class="flex items-center px-4 py-3 text-gray-600 hover:text-primary-600 hover:bg-primary-50 rounded-lg transition-colors duration-200"><i class="fas fa-user-cog w-5 h-5 mr-3"></i>User Management</a></c:if>
                <a href="dashboard?action=help" class="flex items-center px-4 py-3 text-gray-600 hover:text-primary-600 hover:bg-primary-50 rounded-lg transition-colors duration-200"><i class="fas fa-question-circle w-5 h-5 mr-3"></i>Help</a>
            </div>
        </nav>
        <div class="absolute bottom-0 left-0 right-0 p-4 border-t border-gray-200">
            <div class="flex items-center space-x-3"><div class="w-10 h-10 bg-primary-100 rounded-full flex items-center justify-center"><i class="fas fa-user text-primary-600"></i></div><div class="flex-1"><p class="text-sm font-medium text-gray-900">${sessionScope.username}</p><p class="text-xs text-gray-500 capitalize">${sessionScope.role}</p></div><a href="dashboard?action=logout" class="text-gray-400 hover:text-red-500 transition-colors duration-200"><i class="fas fa-sign-out-alt"></i></a></div>
        </div>
    </div>

    <div class="lg:ml-64">
        <div class="bg-white shadow-sm border-b border-gray-200">
            <div class="flex items-center justify-between px-6 py-4">
                <div class="flex items-center space-x-4"><button onclick="toggleSidebar()" class="lg:hidden text-gray-500 hover:text-gray-700"><i class="fas fa-bars text-xl"></i></button><h1 class="text-2xl font-bold text-gray-900">Create New Bill</h1></div>
                <div class="flex items-center space-x-4"><a href="bill?action=list" class="bg-gray-100 text-gray-700 px-4 py-2 rounded-lg hover:bg-gray-200 transition-colors duration-200"><i class="fas fa-list mr-2"></i>Back to Bills</a></div>
            </div>
        </div>

        <div class="p-6">
            <c:if test="${not empty error}"><div class="mb-6 bg-red-50 border border-red-200 rounded-lg p-4"><div class="flex items-center"><i class="fas fa-exclamation-circle text-red-500 mr-2"></i><span class="text-red-800">${error}</span></div></div></c:if>

            <div class="bg-white rounded-xl shadow-sm border border-gray-200 p-6">
                <form action="bill" method="post" class="space-y-6">
                    <input type="hidden" name="action" value="create">

                    <div>
                        <label for="customerId" class="block text-sm font-medium text-gray-700 mb-2">Select Customer</label>
                        <select name="customerId" id="customerId" required class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-primary-500">
                            <option value="">Choose a customer...</option>
                            <c:forEach var="customer" items="${customers}">
                                <option value="${customer.customerId}">${customer.name} (${customer.accountNumber})</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="pt-2">
                        <h3 class="text-lg font-semibold text-gray-900 mb-4">Bill Items</h3>
                        <div id="items-container" class="space-y-3">
                            <div class="grid grid-cols-12 gap-3 item-row bg-gray-50 border border-gray-200 rounded-lg p-3">
                                <div class="col-span-12 md:col-span-5">
                                    <select name="productId" required class="w-full px-3 py-2 border border-gray-300 rounded-lg">
                                        <option value="">Select Product...</option>
                                        <c:forEach var="product" items="${products}">
                                            <option value="${product.productId}" data-price="${product.price}">${product.name} - Rs. ${product.price}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="col-span-6 md:col-span-2"><input type="number" name="quantity" min="1" value="1" required class="w-full px-3 py-2 border border-gray-300 rounded-lg" placeholder="Qty"></div>
                                <div class="col-span-6 md:col-span-2"><input type="text" class="unit-price w-full px-3 py-2 border border-gray-300 rounded-lg" placeholder="Unit Price" readonly></div>
                                <div class="col-span-6 md:col-span-2"><input type="text" class="subtotal w-full px-3 py-2 border border-gray-300 rounded-lg" placeholder="Subtotal" readonly></div>
                                <div class="col-span-6 md:col-span-1 flex items-center justify-end"><button type="button" class="remove-btn bg-red-600 text-white px-3 py-2 rounded hover:bg-red-700" onclick="removeItem(this)"><i class="fas fa-times"></i></button></div>
                            </div>
                        </div>
                        <button type="button" class="mt-3 bg-green-600 text-white px-4 py-2 rounded-lg hover:bg-green-700" onclick="addItem()"><i class="fas fa-plus mr-2"></i>Add Item</button>
                    </div>

                    <div class="bg-gray-50 border border-gray-200 rounded-lg p-4 text-right">
                        <h3 class="text-lg font-semibold text-gray-900">Total Amount: <span id="total-amount" class="text-primary-600">Rs. 0.00</span></h3>
                    </div>

                    <div class="text-center">
                        <button type="submit" class="bg-primary-600 text-white px-6 py-3 rounded-lg hover:bg-primary-700 transition-colors duration-200"><i class="fas fa-file-invoice-dollar mr-2"></i>Create Bill</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script>
        function addItem(){const c=document.getElementById('items-container');const r=c.children[0].cloneNode(true);r.querySelector('select').value='';r.querySelector('input[name="quantity"]').value='1';r.querySelector('.unit-price').value='';r.querySelector('.subtotal').value='';addEventListeners(r);c.appendChild(r);} 
        function removeItem(btn){const c=document.getElementById('items-container');if(c.children.length>1){btn.closest('.item-row').remove();calculateTotal();}}
        function addEventListeners(row){const s=row.querySelector('select');const q=row.querySelector('input[name="quantity"]');const u=row.querySelector('.unit-price');const sub=row.querySelector('.subtotal');s.addEventListener('change',function(){const op=this.options[this.selectedIndex];const p=op.getAttribute('data-price');u.value=p?('Rs. '+p):'';calculateSubtotal(row);});q.addEventListener('input',function(){calculateSubtotal(row);});}
        function calculateSubtotal(row){const s=row.querySelector('select');const q=row.querySelector('input[name="quantity"]');const u=row.querySelector('.unit-price');const sub=row.querySelector('.subtotal');const op=s.options[s.selectedIndex];const p=op.getAttribute('data-price');const qty=q.value;if(p&&qty){const v=parseFloat(p)*parseInt(qty);sub.value='Rs. '+v.toFixed(2);}else{sub.value='';}calculateTotal();}
        function calculateTotal(){const subs=document.querySelectorAll('.subtotal');let t=0;subs.forEach(x=>{const v=x.value.replace('Rs. ','');if(v){t+=parseFloat(v);}});document.getElementById('total-amount').textContent='Rs. '+t.toFixed(2);} 
        document.addEventListener('DOMContentLoaded',function(){addEventListeners(document.querySelector('.item-row'));});
    </script>
</body>
</html> 