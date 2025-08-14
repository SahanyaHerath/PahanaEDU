<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pahana Edu - View Bill</title>
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
                <div class="flex items-center space-x-4"><button onclick="toggleSidebar()" class="lg:hidden text-gray-500 hover:text-gray-700"><i class="fas fa-bars text-xl"></i></button><h1 class="text-2xl font-bold text-gray-900">Bill Details</h1></div>
                <div class="flex items-center space-x-4"><a href="bill?action=list" class="bg-gray-100 text-gray-700 px-4 py-2 rounded-lg hover:bg-gray-200 transition-colors duration-200"><i class="fas fa-list mr-2"></i>Back to Bills</a></div>
            </div>
        </div>

        <div class="p-6">
            <c:if test="${not empty success}"><div class="mb-6 bg-green-50 border border-green-200 rounded-lg p-4"><div class="flex items-center"><i class="fas fa-check-circle text-green-500 mr-2"></i><span class="text-green-800">${success}</span></div></div></c:if>
            <c:if test="${not empty error}"><div class="mb-6 bg-red-50 border border-red-200 rounded-lg p-4"><div class="flex items-center"><i class="fas fa-exclamation-circle text-red-500 mr-2"></i><span class="text-red-800">${error}</span></div></div></c:if>

            <div class="bg-white rounded-xl shadow-sm border border-gray-200 p-6">
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6 border-b pb-6 mb-6">
                    <div>
                        <h3 class="text-lg font-semibold text-gray-900 mb-2">Customer Information</h3>
                        <p class="text-gray-700"><strong>Name:</strong> ${bill.customerName}</p>
                        <p class="text-gray-700"><strong>Account Number:</strong> ${bill.accountNumber}</p>
                        <p class="text-gray-700"><strong>Bill ID:</strong> ${bill.billId}</p>
                        <p class="text-gray-700"><strong>Date:</strong> ${bill.billDate}</p>
                    </div>
                    <div class="text-right md:text-left">
                        <h3 class="text-lg font-semibold text-gray-900 mb-2">Bill Status</h3>
                        <span class="inline-flex items-center px-3 py-1 rounded-full text-sm capitalize
                            ${bill.status == 'paid' ? 'bg-green-100 text-green-700' : ''}
                            ${bill.status == 'pending' ? 'bg-yellow-100 text-yellow-700' : ''}
                            ${bill.status == 'cancelled' ? 'bg-red-100 text-red-700' : ''}">${bill.status}</span>

                        <form action="bill" method="post" class="mt-4 inline-flex items-center gap-2">
                            <input type="hidden" name="action" value="update">
                            <input type="hidden" name="billId" value="${bill.billId}">
                            <label for="status" class="text-sm text-gray-600">Update Status:</label>
                            <select name="status" id="status" class="px-3 py-2 border border-gray-300 rounded-lg">
                                <option value="pending" ${bill.status == 'pending' ? 'selected' : ''}>Pending</option>
                                <option value="paid" ${bill.status == 'paid' ? 'selected' : ''}>Paid</option>
                                <option value="cancelled" ${bill.status == 'cancelled' ? 'selected' : ''}>Cancelled</option>
                            </select>
                            <button type="submit" class="bg-primary-600 text-white px-4 py-2 rounded-lg hover:bg-primary-700 transition-colors duration-200">Update</button>
                        </form>
                    </div>
                </div>

                <h3 class="text-lg font-semibold text-gray-900 mb-3">Bill Items</h3>
                <c:choose>
                    <c:when test="${not empty bill.items}">
                        <div class="overflow-x-auto border border-gray-200 rounded-lg">
                            <table class="min-w-full divide-y divide-gray-200">
                                <thead class="bg-gray-50">
                                    <tr>
                                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Product</th>
                                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Quantity</th>
                                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Unit Price</th>
                                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Subtotal</th>
                                    </tr>
                                </thead>
                                <tbody class="bg-white divide-y divide-gray-200">
                                    <c:forEach var="item" items="${bill.items}">
                                        <tr>
                                            <td class="px-6 py-4">${item.productName}</td>
                                            <td class="px-6 py-4">${item.quantity}</td>
                                            <td class="px-6 py-4"><fmt:formatNumber value="${item.unitPrice}" type="currency" currencySymbol="Rs. "/></td>
                                            <td class="px-6 py-4"><fmt:formatNumber value="${item.subtotal}" type="currency" currencySymbol="Rs. "/></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <p class="text-center text-gray-600 py-6">No items found for this bill.</p>
                    </c:otherwise>
                </c:choose>

                <div class="bg-gray-50 border border-gray-200 rounded-lg p-4 text-right mt-6">
                    <h3 class="text-lg font-semibold text-gray-900">Total Amount: <span class="text-primary-600"><fmt:formatNumber value="${bill.totalAmount}" type="currency" currencySymbol="Rs. "/></span></h3>
                </div>

                <div class="flex items-center gap-3 mt-8 justify-center">
                    <a href="bill?action=print&id=${bill.billId}" class="bg-green-600 text-white px-6 py-3 rounded-lg hover:bg-green-700 transition-colors duration-200"><i class="fas fa-print mr-2"></i>Print Bill</a>
                    <a href="bill?action=list" class="bg-gray-100 text-gray-700 px-6 py-3 rounded-lg hover:bg-gray-200 transition-colors duration-200"><i class="fas fa-arrow-left mr-2"></i>Back</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html> 