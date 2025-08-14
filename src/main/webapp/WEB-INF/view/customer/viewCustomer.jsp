<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Customer - Pahana Edu Billing System</title>
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
                <a href="customer?action=list" class="flex items-center px-4 py-3 text-primary-600 bg-primary-50 rounded-lg font-medium"><i class="fas fa-users w-5 h-5 mr-3"></i>Customers</a>
                <a href="product?action=list" class="flex items-center px-4 py-3 text-gray-600 hover:text-primary-600 hover:bg-primary-50 rounded-lg transition-colors duration-200"><i class="fas fa-book w-5 h-5 mr-3"></i>Products</a>
                <a href="bill?action=list" class="flex items-center px-4 py-3 text-gray-600 hover:text-primary-600 hover:bg-primary-50 rounded-lg transition-colors duration-200"><i class="fas fa-file-invoice-dollar w-5 h-5 mr-3"></i>Bills</a>
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
                <div class="flex items-center space-x-4"><button onclick="toggleSidebar()" class="lg:hidden text-gray-500 hover:text-gray-700"><i class="fas fa-bars text-xl"></i></button><h1 class="text-2xl font-bold text-gray-900">Customer Details</h1></div>
                <div class="flex items-center space-x-4"></div>
            </div>
        </div>

        <div class="p-6">
            <c:if test="${not empty success}"><div class="mb-6 bg-green-50 border border-green-200 rounded-lg p-4"><div class="flex items-center"><i class="fas fa-check-circle text-green-500 mr-2"></i><span class="text-green-800">${success}</span></div></div></c:if>
            <c:if test="${not empty error}"><div class="mb-6 bg-red-50 border border-red-200 rounded-lg p-4"><div class="flex items-center"><i class="fas fa-exclamation-circle text-red-500 mr-2"></i><span class="text-red-800">${error}</span></div></div></c:if>

            <c:if test="${not empty customer}">
                <div class="bg-white rounded-xl shadow-sm border border-gray-200 p-6">
                    <div class="bg-gradient-to-r from-primary-600 to-primary-700 text-white rounded-lg p-6 mb-6 text-center">
                        <h2 class="text-2xl font-semibold">${customer.name}</h2>
                        <p class="text-primary-100">Account Number: ${customer.accountNumber}</p>
                    </div>

                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Customer ID</label>
                            <div class="w-full px-4 py-3 bg-gray-50 border border-gray-200 rounded-lg">${customer.customerId}</div>
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Telephone</label>
                            <div class="w-full px-4 py-3 bg-gray-50 border border-gray-200 rounded-lg">${customer.telephone}</div>
                        </div>
                        <div class="md:col-span-2">
                            <label class="block text-sm font-medium text-gray-700 mb-2">Address</label>
                            <div class="w-full px-4 py-3 bg-gray-50 border border-gray-200 rounded-lg">${customer.address}</div>
                        </div>
                    </div>

                    <div class="flex items-center gap-3 mt-8 border-t pt-6">
                        <a href="customer?action=edit&id=${customer.customerId}" class="bg-blue-600 text-white px-6 py-3 rounded-lg hover:bg-blue-700 transition-colors duration-200"><i class="fas fa-edit mr-2"></i>Edit Customer</a>
                        <a href="bill?action=create&customerId=${customer.customerId}" class="bg-green-600 text-white px-6 py-3 rounded-lg hover:bg-green-700 transition-colors duration-200"><i class="fas fa-file-invoice-dollar mr-2"></i>Create Bill</a>
                        <a href="customer?action=delete&id=${customer.customerId}" onclick="return confirm('Are you sure you want to delete this customer?')" class="bg-red-600 text-white px-6 py-3 rounded-lg hover:bg-red-700 transition-colors duration-200"><i class="fas fa-trash mr-2"></i>Delete</a>
                        <a href="customer?action=list" class="bg-gray-100 text-gray-700 px-6 py-3 rounded-lg hover:bg-gray-200 transition-colors duration-200"><i class="fas fa-arrow-left mr-2"></i>Back</a>
                    </div>
                </div>
            </c:if>
        </div>
    </div>
</body>
</html> 