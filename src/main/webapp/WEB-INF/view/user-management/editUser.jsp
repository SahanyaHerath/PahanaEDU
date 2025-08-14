<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit User - Pahana Edu</title>
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
                <a href="bill?action=list" class="flex items-center px-4 py-3 text-gray-600 hover:text-primary-600 hover:bg-primary-50 rounded-lg transition-colors duration-200"><i class="fas fa-file-invoice-dollar w-5 h-5 mr-3"></i>Bills</a>
                <a href="user-management?action=list" class="flex items-center px-4 py-3 text-primary-600 bg-primary-50 rounded-lg font-medium"><i class="fas fa-user-cog w-5 h-5 mr-3"></i>User Management</a>
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
                <div class="flex items-center space-x-4"><button onclick="toggleSidebar()" class="lg:hidden text-gray-500 hover:text-gray-700"><i class="fas fa-bars text-xl"></i></button><h1 class="text-2xl font-bold text-gray-900">Edit User</h1></div>
                <div class="flex items-center space-x-4"><a href="user-management?action=list" class="bg-gray-100 text-gray-700 px-4 py-2 rounded-lg hover:bg-gray-200 transition-colors duration-200"><i class="fas fa-list mr-2"></i>Back to Users</a></div>
            </div>
        </div>

        <div class="p-6">
            <c:if test="${not empty success}"><div class="mb-6 bg-green-50 border border-green-200 rounded-lg p-4"><div class="flex items-center"><i class="fas fa-check-circle text-green-500 mr-2"></i><span class="text-green-800">${success}</span></div></div></c:if>
            <c:if test="${not empty error}"><div class="mb-6 bg-red-50 border border-red-200 rounded-lg p-4"><div class="flex items-center"><i class="fas fa-exclamation-circle text-red-500 mr-2"></i><span class="text-red-800">${error}</span></div></div></c:if>

            <div class="bg-white rounded-xl shadow-sm border border-gray-200 p-6">
                <div class="mb-6 bg-gray-50 border border-gray-200 rounded-lg p-4">
                    <div class="flex items-center justify-between text-gray-700">
                        <div><strong>User ID:</strong> ${user.userId}</div>
                        <div><strong>Current Role:</strong> ${user.role}</div>
                    </div>
                </div>

                <form action="user-management?action=update" method="post" class="space-y-5">
                    <input type="hidden" name="userId" value="${user.userId}">
                    <div>
                        <label for="username" class="block text-sm font-medium text-gray-700 mb-2">Username</label>
                        <input type="text" id="username" name="username" required minlength="3" maxlength="50" value="${user.username}" class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-primary-500">
                    </div>
                    <div>
                        <label for="password" class="block text-sm font-medium text-gray-700 mb-2">New Password (Optional)</label>
                        <input type="password" id="password" name="password" placeholder="Leave empty to keep current password" minlength="6" class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-primary-500">
                        <div class="mt-2 text-xs text-gray-500">Minimum 6 characters, include letters and numbers.</div>
                    </div>
                    <div>
                        <label for="confirmPassword" class="block text-sm font-medium text-gray-700 mb-2">Confirm New Password</label>
                        <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm new password" class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-primary-500">
                    </div>
                    <div>
                        <label for="role" class="block text-sm font-medium text-gray-700 mb-2">Role</label>
                        <select id="role" name="role" required class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary-500 focus:border-primary-500">
                            <option value="user" ${user.role == 'user' ? 'selected' : ''}>User</option>
                            <option value="manager" ${user.role == 'manager' ? 'selected' : ''}>Manager</option>
                            <option value="admin" ${user.role == 'admin' ? 'selected' : ''}>Admin</option>
                        </select>
                    </div>

                    <div class="flex items-center gap-3 pt-2">
                        <button type="submit" class="bg-primary-600 text-white px-6 py-3 rounded-lg hover:bg-primary-700 transition-colors duration-200 flex items-center"><i class="fas fa-save mr-2"></i>Update User</button>
                        <a href="user-management?action=list" class="bg-gray-100 text-gray-700 px-6 py-3 rounded-lg hover:bg-gray-200 transition-colors duration-200"><i class="fas fa-times mr-2"></i>Cancel</a>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script>
        const password=document.getElementById('password');
        const confirmPassword=document.getElementById('confirmPassword');
        function validate(){if(password.value && confirmPassword.value && password.value!==confirmPassword.value){confirmPassword.setCustomValidity('Passwords do not match');}else{confirmPassword.setCustomValidity('');}}
        password.addEventListener('input',validate);confirmPassword.addEventListener('input',validate);
    </script>
</body>
</html>
