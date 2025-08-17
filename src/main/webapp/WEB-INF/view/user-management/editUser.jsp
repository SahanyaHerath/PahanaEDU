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
                <a href="bill?action=list" class="flex items-center px-4 py-3 text-gray-600 hover:text-primary-600 hover:bg-primary-50 rounded-xl transition-all duration-200">
                    <i class="fas fa-file-invoice-dollar w-5 h-5 mr-3"></i>Bills
                </a>
                <a href="user-management?action=list" class="flex items-center px-4 py-3 text-primary-600 bg-primary-50 rounded-xl font-medium shadow-sm">
                    <i class="fas fa-user-cog w-5 h-5 mr-3"></i>User Management
                </a>
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
                        <h1 class="text-2xl font-bold text-gray-900">Edit User</h1>
                        <p class="text-sm text-gray-600">Update user information and permissions</p>
                    </div>
                </div>
                <div class="flex items-center space-x-4">
                    <a href="user-management?action=list" class="bg-gray-100 text-gray-700 px-4 py-2 rounded-xl hover:bg-gray-200 transition-all duration-200 flex items-center">
                        <i class="fas fa-list mr-2"></i>Back to Users
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

            <div class="max-w-2xl mx-auto">
                <div class="bg-white rounded-2xl shadow-lg border border-gray-200 p-8">
                    <!-- Form Header -->
                    <div class="mb-8">
                        <div class="flex items-center mb-6">
                            <div class="w-12 h-12 bg-gradient-to-br from-primary-100 to-primary-200 rounded-xl flex items-center justify-center mr-4">
                                <i class="fas fa-user-edit text-primary-600 text-xl"></i>
                            </div>
                            <div>
                                <h2 class="text-2xl font-bold text-gray-900">Edit User Information</h2>
                                <p class="text-gray-600">Update the user's details below</p>
                            </div>
                        </div>
                        
                        <!-- Current User Info -->
                        <div class="bg-gradient-to-r from-blue-50 to-indigo-50 border border-blue-200 rounded-xl p-6 mb-6">
                            <div class="flex items-center justify-between">
                                <div class="flex items-center space-x-3">
                                    <div class="w-10 h-10 bg-blue-100 rounded-xl flex items-center justify-center">
                                        <i class="fas fa-user text-blue-600"></i>
                                    </div>
                                    <div>
                                        <p class="text-sm font-semibold text-blue-700">Currently Editing</p>
                                        <p class="text-lg font-bold text-blue-800">${user.username}</p>
                                        <p class="text-sm text-blue-600">User ID: ${user.userId}</p>
                                    </div>
                                </div>
                                <div class="bg-blue-100 rounded-lg px-3 py-1">
                                    <span class="text-blue-700 text-sm font-medium capitalize">${user.role}</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <form action="user-management?action=update" method="post" class="space-y-6">
                        <input type="hidden" name="userId" value="${user.userId}">
                        
                        <!-- Username Field -->
                        <div class="relative">
                            <label for="username" class="block text-sm font-semibold text-gray-700 mb-3">
                                <i class="fas fa-user mr-2 text-primary-600"></i>Username
                            </label>
                            <div class="relative">
                                <input type="text" id="username" name="username" required minlength="3" maxlength="50" value="${user.username}" 
                                       class="form-input w-full px-4 py-4 border border-gray-300 rounded-xl focus:ring-2 focus:ring-primary-500 focus:border-primary-500 text-gray-700 placeholder-gray-500 transition-all duration-200 bg-white">
                                <div class="absolute inset-y-0 right-0 pr-3 flex items-center pointer-events-none">
                                    <i class="fas fa-user text-gray-400"></i>
                                </div>
                            </div>
                            <p class="mt-2 text-sm text-gray-500">Username must be between 3-50 characters</p>
                        </div>

                        <!-- Password Field -->
                        <div class="relative">
                            <label for="password" class="block text-sm font-semibold text-gray-700 mb-3">
                                <i class="fas fa-lock mr-2 text-primary-600"></i>New Password (Optional)
                            </label>
                            <div class="relative">
                                <input type="password" id="password" name="password" placeholder="Leave empty to keep current password" minlength="6" 
                                       class="form-input w-full px-4 py-4 border border-gray-300 rounded-xl focus:ring-2 focus:ring-primary-500 focus:border-primary-500 text-gray-700 placeholder-gray-500 transition-all duration-200 bg-white">
                                <div class="absolute inset-y-0 right-0 pr-3 flex items-center pointer-events-none">
                                    <i class="fas fa-lock text-gray-400"></i>
                                </div>
                            </div>
                            <p class="mt-2 text-sm text-gray-500">Minimum 6 characters, include letters and numbers</p>
                        </div>

                        <!-- Confirm Password Field -->
                        <div class="relative">
                            <label for="confirmPassword" class="block text-sm font-semibold text-gray-700 mb-3">
                                <i class="fas fa-shield-alt mr-2 text-primary-600"></i>Confirm New Password
                            </label>
                            <div class="relative">
                                <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm new password" 
                                       class="form-input w-full px-4 py-4 border border-gray-300 rounded-xl focus:ring-2 focus:ring-primary-500 focus:border-primary-500 text-gray-700 placeholder-gray-500 transition-all duration-200 bg-white">
                                <div class="absolute inset-y-0 right-0 pr-3 flex items-center pointer-events-none">
                                    <i class="fas fa-shield-alt text-gray-400"></i>
                                </div>
                            </div>
                            <p class="mt-2 text-sm text-gray-500">Re-enter your new password to confirm</p>
                        </div>

                        <!-- Role Field -->
                        <div class="relative">
                            <label for="role" class="block text-sm font-semibold text-gray-700 mb-3">
                                <i class="fas fa-user-shield mr-2 text-primary-600"></i>Role
                            </label>
                            <div class="relative">
                                <select id="role" name="role" required 
                                        class="form-input w-full px-4 py-4 border border-gray-300 rounded-xl focus:ring-2 focus:ring-primary-500 focus:border-primary-500 text-gray-700 bg-white">
                                    <option value="user" ${user.role == 'user' ? 'selected' : ''}>User</option>
                                    <option value="manager" ${user.role == 'manager' ? 'selected' : ''}>Manager</option>
                                    <option value="admin" ${user.role == 'admin' ? 'selected' : ''}>Admin</option>
                                </select>
                                <div class="absolute inset-y-0 right-0 pr-3 flex items-center pointer-events-none">
                                    <i class="fas fa-user-shield text-gray-400"></i>
                                </div>
                            </div>
                            <p class="mt-2 text-sm text-gray-500">Choose the appropriate role for this user</p>
                        </div>

                        <!-- Form Actions -->
                        <div class="flex items-center gap-4 pt-6 border-t border-gray-200">
                            <button type="submit" class="action-btn bg-gradient-to-r from-primary-600 to-primary-700 text-white px-8 py-4 rounded-xl hover:from-primary-700 hover:to-primary-800 transition-all duration-200 flex items-center shadow-lg hover:shadow-xl">
                                <i class="fas fa-save mr-2"></i>Update User
                            </button>
                            <a href="user-management?action=view&id=${user.userId}" class="action-btn bg-blue-100 text-blue-700 px-8 py-4 rounded-xl hover:bg-blue-200 transition-all duration-200 flex items-center">
                                <i class="fas fa-eye mr-2"></i>View User
                            </a>
                            <a href="user-management?action=list" class="action-btn bg-gray-100 text-gray-700 px-8 py-4 rounded-xl hover:bg-gray-200 transition-all duration-200 flex items-center">
                                <i class="fas fa-times mr-2"></i>Cancel
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script>
        const password = document.getElementById('password');
        const confirmPassword = document.getElementById('confirmPassword');
        
        function validate() {
            if (password.value && confirmPassword.value && password.value !== confirmPassword.value) {
                confirmPassword.setCustomValidity('Passwords do not match');
            } else {
                confirmPassword.setCustomValidity('');
            }
        }
        
        password.addEventListener('input', validate);
        confirmPassword.addEventListener('input', validate);
        
        // Form validation and enhancement
        document.addEventListener('DOMContentLoaded', function() {
            const form = document.querySelector('form');
            const inputs = form.querySelectorAll('input, select');
            
            inputs.forEach(input => {
                input.addEventListener('blur', function() {
                    if (this.value.trim() !== '') {
                        this.classList.add('success');
                        this.classList.remove('error');
                    } else if (this.hasAttribute('required')) {
                        this.classList.add('error');
                        this.classList.remove('success');
                    }
                });
                
                input.addEventListener('input', function() {
                    if (this.classList.contains('error')) {
                        this.classList.remove('error');
                    }
                });
            });
        });
    </script>
</body>
</html>
