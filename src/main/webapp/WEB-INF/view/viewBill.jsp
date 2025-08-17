<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Bill - Pahana Edu</title>
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
        .action-btn {
            transition: all 0.2s ease-in-out;
        }
        .action-btn:hover {
            transform: translateY(-2px);
        }
        .info-card {
            transition: all 0.2s ease-in-out;
        }
        .info-card:hover {
            transform: translateY(-1px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
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
                        <h1 class="text-2xl font-bold text-gray-900">Bill Details</h1>
                        <p class="text-sm text-gray-600">View comprehensive information about this invoice</p>
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
            <c:if test="${not empty success}">
                <div class="mb-6 bg-green-50 border border-green-200 rounded-xl p-4 shadow-sm">
                    <div class="flex items-center">
                        <i class="fas fa-check-circle text-green-500 mr-2"></i>
                        <span class="text-green-800 font-medium">${success}</span>
                    </div>
                </div>
            </c:if>
            <c:if test="${not empty error}">
                <div class="mb-6 bg-red-50 border border-red-200 rounded-xl p-4 shadow-sm">
                    <div class="flex items-center">
                        <i class="fas fa-exclamation-circle text-red-500 mr-2"></i>
                        <span class="text-red-800 font-medium">${error}</span>
                    </div>
                </div>
            </c:if>

            <div class="max-w-6xl mx-auto">
                <div class="bg-white rounded-2xl shadow-lg border border-gray-200 overflow-hidden">
                    <!-- Header Section -->
                    <div class="bg-gradient-to-r from-primary-600 to-primary-700 px-8 py-6">
                        <div class="flex items-center justify-between">
                            <div class="flex items-center space-x-4">
                                <div class="w-16 h-16 bg-white rounded-xl flex items-center justify-center shadow-lg">
                                    <i class="fas fa-file-invoice-dollar text-primary-600 text-2xl"></i>
                                </div>
                                <div>
                                    <h2 class="text-3xl font-bold text-white">Bill #${bill.billId}</h2>
                                    <p class="text-primary-100">Generated on ${bill.billDate}</p>
                                </div>
                            </div>
                            <div class="text-right">
                                <div class="bg-white bg-opacity-20 rounded-xl px-4 py-2">
                                    <span class="text-white text-sm font-medium capitalize">${bill.status}</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Content Section -->
                    <div class="p-8">
                        <!-- Customer and Bill Information -->
                        <div class="grid grid-cols-1 lg:grid-cols-2 gap-8 mb-8">
                            <!-- Customer Information -->
                            <div class="info-card bg-gradient-to-br from-blue-50 to-blue-100 border border-blue-200 rounded-xl p-6">
                                <div class="flex items-center justify-between mb-4">
                                    <div class="flex items-center">
                                        <div class="w-10 h-10 bg-blue-200 rounded-xl flex items-center justify-center mr-3">
                                            <i class="fas fa-user text-blue-600 text-xl"></i>
                                        </div>
                                        <h3 class="text-xl font-semibold text-blue-900">Customer Information</h3>
                                    </div>
                                </div>
                                <div class="space-y-3">
                                    <div class="flex items-center justify-between">
                                        <span class="text-blue-700 font-medium">Name:</span>
                                        <span class="text-blue-900 font-semibold">${bill.customerName}</span>
                                    </div>
                                    <div class="flex items-center justify-between">
                                        <span class="text-blue-700 font-medium">Account Number:</span>
                                        <span class="text-blue-900 font-semibold">${bill.accountNumber}</span>
                                    </div>
                                    <div class="flex items-center justify-between">
                                        <span class="text-blue-700 font-medium">Bill ID:</span>
                                        <span class="text-blue-900 font-semibold">${bill.billId}</span>
                                    </div>
                                    <div class="flex items-center justify-between">
                                        <span class="text-blue-700 font-medium">Date:</span>
                                        <span class="text-blue-900 font-semibold">${bill.billDate}</span>
                                    </div>
                                </div>
                            </div>

                            <!-- Bill Status -->
                            <div class="info-card bg-gradient-to-br from-purple-50 to-purple-100 border border-purple-200 rounded-xl p-6">
                                <div class="flex items-center justify-between mb-4">
                                    <div class="flex items-center">
                                        <div class="w-10 h-10 bg-purple-200 rounded-xl flex items-center justify-center mr-3">
                                            <i class="fas fa-chart-line text-purple-600 text-xl"></i>
                                        </div>
                                        <h3 class="text-xl font-semibold text-purple-900">Bill Status</h3>
                                    </div>
                                    <span class="inline-flex items-center px-3 py-1 rounded-full text-sm font-medium capitalize
                                        ${bill.status == 'paid' ? 'bg-green-100 text-green-800' : ''}
                                        ${bill.status == 'pending' ? 'bg-yellow-100 text-yellow-800' : ''}
                                        ${bill.status == 'cancelled' ? 'bg-red-100 text-red-800' : ''}">
                                        <i class="fas fa-circle mr-1 text-xs"></i>${bill.status}
                                    </span>
                                </div>
                                
                                <form action="bill" method="post" class="space-y-4">
                                    <input type="hidden" name="action" value="update">
                                    <input type="hidden" name="billId" value="${bill.billId}">
                                    <div>
                                        <label for="status" class="block text-sm font-medium text-purple-700 mb-2">
                                            <i class="fas fa-edit mr-1"></i>Update Status
                                        </label>
                                        <div class="flex items-center space-x-3">
                                            <select name="status" id="status" 
                                                    class="flex-1 px-4 py-3 border border-purple-300 rounded-xl focus:ring-2 focus:ring-purple-500 focus:border-purple-500 text-purple-700 bg-white">
                                                <option value="pending" ${bill.status == 'pending' ? 'selected' : ''}>Pending</option>
                                                <option value="paid" ${bill.status == 'paid' ? 'selected' : ''}>Paid</option>
                                                <option value="cancelled" ${bill.status == 'cancelled' ? 'selected' : ''}>Cancelled</option>
                                            </select>
                                            <button type="submit" class="action-btn bg-gradient-to-r from-purple-600 to-purple-700 text-white px-6 py-3 rounded-xl hover:from-purple-700 hover:to-purple-800 transition-all duration-200 flex items-center shadow-lg hover:shadow-xl">
                                                <i class="fas fa-save mr-2"></i>Update
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>

                        <!-- Bill Items Section -->
                        <div class="bg-gradient-to-r from-gray-50 to-gray-100 border border-gray-200 rounded-xl p-6 mb-8">
                            <div class="flex items-center mb-6">
                                <div class="w-10 h-10 bg-gray-200 rounded-xl flex items-center justify-center mr-3">
                                    <i class="fas fa-shopping-cart text-gray-600 text-xl"></i>
                                </div>
                                <h3 class="text-xl font-semibold text-gray-900">Bill Items</h3>
                            </div>
                            
                            <c:choose>
                                <c:when test="${not empty bill.items}">
                                    <div class="overflow-x-auto border border-gray-200 rounded-xl bg-white">
                                        <table class="min-w-full divide-y divide-gray-200">
                                            <thead class="bg-gradient-to-r from-gray-50 to-gray-100">
                                                <tr>
                                                    <th class="px-8 py-4 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">
                                                        <i class="fas fa-box mr-2"></i>Product
                                                    </th>
                                                    <th class="px-8 py-4 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">
                                                        <i class="fas fa-hashtag mr-2"></i>Quantity
                                                    </th>
                                                    <th class="px-8 py-4 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">
                                                        <i class="fas fa-tag mr-2"></i>Unit Price
                                                    </th>
                                                    <th class="px-8 py-4 text-left text-xs font-semibold text-gray-700 uppercase tracking-wider">
                                                        <i class="fas fa-calculator mr-2"></i>Subtotal
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody class="bg-white divide-y divide-gray-200">
                                                <c:forEach var="item" items="${bill.items}">
                                                    <tr class="hover:bg-gray-50 transition-colors duration-200">
                                                        <td class="px-8 py-6">
                                                            <div class="text-sm font-semibold text-gray-900">${item.productName}</div>
                                                        </td>
                                                        <td class="px-8 py-6">
                                                            <div class="text-sm text-gray-900">${item.quantity}</div>
                                                        </td>
                                                        <td class="px-8 py-6">
                                                            <div class="text-sm font-medium text-gray-900">
                                                                <fmt:formatNumber value="${item.unitPrice}" type="currency" currencySymbol="Rs. "/>
                                                            </div>
                                                        </td>
                                                        <td class="px-8 py-6">
                                                            <div class="text-sm font-bold text-green-600">
                                                                <fmt:formatNumber value="${item.subtotal}" type="currency" currencySymbol="Rs. "/>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="text-center py-12">
                                        <div class="w-16 h-16 bg-gray-200 rounded-full flex items-center justify-center mx-auto mb-4">
                                            <i class="fas fa-shopping-cart text-gray-400 text-2xl"></i>
                                        </div>
                                        <h3 class="text-lg font-medium text-gray-900 mb-2">No items found</h3>
                                        <p class="text-gray-500">This bill doesn't have any items.</p>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>

                        <!-- Total Amount Section -->
                        <div class="bg-gradient-to-r from-green-50 to-emerald-50 border border-green-200 rounded-xl p-6 mb-8">
                            <div class="flex items-center justify-between">
                                <div class="flex items-center">
                                    <div class="w-12 h-12 bg-green-200 rounded-xl flex items-center justify-center mr-4">
                                        <i class="fas fa-calculator text-green-600 text-xl"></i>
                                    </div>
                                    <div>
                                        <h3 class="text-xl font-semibold text-green-900">Total Amount</h3>
                                        <p class="text-green-700">Final invoice total</p>
                                    </div>
                                </div>
                                <div class="text-right">
                                    <div class="text-3xl font-bold text-green-600">
                                        <fmt:formatNumber value="${bill.totalAmount}" type="currency" currencySymbol="Rs. "/>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Action Buttons -->
                        <div class="flex flex-col sm:flex-row items-center gap-4 justify-center pt-6 border-t border-gray-200">
                            <a href="bill?action=print&id=${bill.billId}" 
                               class="action-btn bg-gradient-to-r from-green-600 to-green-700 text-white px-8 py-4 rounded-xl hover:from-green-700 hover:to-green-800 transition-all duration-200 flex items-center shadow-lg hover:shadow-xl">
                                <i class="fas fa-print mr-2"></i>Print Bill
                            </a>
                            <a href="bill?action=list" 
                               class="action-btn bg-gray-100 text-gray-700 px-8 py-4 rounded-xl hover:bg-gray-200 transition-all duration-200 flex items-center">
                                <i class="fas fa-arrow-left mr-2"></i>Back to Bills
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html> 