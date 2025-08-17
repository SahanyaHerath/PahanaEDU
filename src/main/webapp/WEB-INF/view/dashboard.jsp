<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Pahana Edu</title>
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
    <script>
        function toggleSidebar() {
            const sidebar = document.getElementById('sidebar');
            sidebar.classList.toggle('-translate-x-full');
        }
    </script>
    <style>
        .stat-card {
            transition: all 0.3s ease-in-out;
        }
        .stat-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.15);
        }
        .action-card {
            transition: all 0.3s ease-in-out;
        }
        .action-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.15);
        }
        .welcome-card {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }
    </style>
</head>
<body class="bg-gradient-to-br from-gray-50 to-gray-100 min-h-screen">
    <!-- Sidebar -->
    <div id="sidebar" class="fixed inset-y-0 left-0 z-50 w-64 bg-white shadow-xl transform -translate-x-full lg:translate-x-0 transition-transform duration-300 ease-in-out">
        <!-- Logo -->
        <div class="flex items-center justify-center h-16 bg-gradient-to-r from-primary-600 to-primary-700">
            <div class="flex items-center space-x-3">
                <div class="w-8 h-8 bg-white rounded-full flex items-center justify-center">
                    <i class="fas fa-graduation-cap text-primary-600 text-sm"></i>
                </div>
                <span class="text-white font-bold text-lg">Pahana Edu</span>
            </div>
        </div>
        
        <!-- Navigation Menu -->
        <nav class="mt-8 px-4">
            <div class="space-y-2">
                <a href="dashboard" class="flex items-center px-4 py-3 text-primary-600 bg-primary-50 rounded-xl font-medium shadow-sm">
                    <i class="fas fa-tachometer-alt w-5 h-5 mr-3"></i>
                    Dashboard
                </a>
                
                <a href="customer?action=list" class="flex items-center px-4 py-3 text-gray-600 hover:text-primary-600 hover:bg-primary-50 rounded-xl transition-all duration-200">
                    <i class="fas fa-users w-5 h-5 mr-3"></i>
                    Customers
                </a>
                
                <a href="product?action=list" class="flex items-center px-4 py-3 text-gray-600 hover:text-primary-600 hover:bg-primary-50 rounded-xl transition-all duration-200">
                    <i class="fas fa-book w-5 h-5 mr-3"></i>
                    Products
                </a>
                
                <a href="bill?action=list" class="flex items-center px-4 py-3 text-gray-600 hover:text-primary-600 hover:bg-primary-50 rounded-xl transition-all duration-200">
                    <i class="fas fa-file-invoice-dollar w-5 h-5 mr-3"></i>
                    Bills
                </a>
                
                <c:if test="${sessionScope.role == 'admin'}">
                    <a href="user-management?action=list" class="flex items-center px-4 py-3 text-gray-600 hover:text-primary-600 hover:bg-primary-50 rounded-xl transition-all duration-200">
                        <i class="fas fa-user-cog w-5 h-5 mr-3"></i>
                        User Management
                    </a>
                </c:if>
                
                <a href="dashboard?action=help" class="flex items-center px-4 py-3 text-gray-600 hover:text-primary-600 hover:bg-primary-50 rounded-xl transition-all duration-200">
                    <i class="fas fa-question-circle w-5 h-5 mr-3"></i>
                    Help
                </a>
            </div>
        </nav>
        
        <!-- User Profile Section -->
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
    
    <!-- Main Content -->
    <div class="lg:ml-64">
        <!-- Header -->
        <div class="bg-white shadow-sm border-b border-gray-200">
            <div class="flex items-center justify-between px-6 py-4">
                <div class="flex items-center space-x-4">
                    <button onclick="toggleSidebar()" class="lg:hidden text-gray-500 hover:text-gray-700">
                        <i class="fas fa-bars text-xl"></i>
                    </button>
                    <div>
                        <h1 class="text-2xl font-bold text-gray-900">Dashboard</h1>
                        <p class="text-sm text-gray-600">Welcome back, ${sessionScope.username}!</p>
                    </div>
                </div>
                <div class="flex items-center space-x-4">
                    <div class="bg-gradient-to-r from-primary-100 to-primary-200 rounded-xl px-4 py-2">
                        <div class="text-sm text-primary-700 font-medium">
                            <i class="fas fa-clock mr-2"></i>
                            <span id="current-time"></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Main Content Area -->
        <div class="p-6">
            <!-- Alerts -->
            <c:if test="${not empty success}">
                <div class="mb-6 bg-green-50 border border-green-200 rounded-xl p-4 shadow-sm">
                    <div class="flex items-center">
                        <i class="fas fa-check-circle text-green-500 mr-3 text-lg"></i>
                        <span class="text-green-800 font-medium">${success}</span>
                    </div>
                </div>
            </c:if>
            
            <c:if test="${not empty error}">
                <div class="mb-6 bg-red-50 border border-red-200 rounded-xl p-4 shadow-sm">
                    <div class="flex items-center">
                        <i class="fas fa-exclamation-circle text-red-500 mr-3 text-lg"></i>
                        <span class="text-red-800 font-medium">${error}</span>
                    </div>
                </div>
            </c:if>
            
            <!-- Welcome Section -->
            <div class="welcome-card rounded-2xl p-8 mb-8 text-white shadow-xl">
                <div class="flex items-center justify-between">
                    <div class="flex items-center space-x-4">
                        <div class="w-16 h-16 bg-white bg-opacity-20 rounded-2xl flex items-center justify-center">
                            <i class="fas fa-graduation-cap text-white text-3xl"></i>
                        </div>
                        <div>
                            <h2 class="text-3xl font-bold mb-2">Welcome to Pahana Edu</h2>
                            <p class="text-white text-opacity-90 text-lg">Manage your educational institution with ease</p>
                        </div>
                    </div>
                    <div class="hidden lg:block">
                        <div class="text-right">
                            <p class="text-white text-opacity-80 text-sm">Current User</p>
                            <p class="text-xl font-bold">${sessionScope.username}</p>
                            <p class="text-white text-opacity-80 text-sm capitalize">${sessionScope.role}</p>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Statistics Cards -->
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
                <div class="stat-card bg-gradient-to-br from-blue-50 to-blue-100 border border-blue-200 rounded-2xl p-6 shadow-lg">
                    <div class="flex items-center justify-between">
                        <div>
                            <p class="text-blue-600 text-sm font-semibold mb-1">Total Customers</p>
                            <p class="text-3xl font-bold text-blue-800">${totalCustomers}</p>
                            <p class="text-blue-600 text-xs mt-1">Active accounts</p>
                        </div>
                        <div class="w-14 h-14 bg-blue-200 rounded-xl flex items-center justify-center">
                            <i class="fas fa-users text-blue-600 text-2xl"></i>
                        </div>
                    </div>
                </div>
                
                <div class="stat-card bg-gradient-to-br from-green-50 to-green-100 border border-green-200 rounded-2xl p-6 shadow-lg">
                    <div class="flex items-center justify-between">
                        <div>
                            <p class="text-green-600 text-sm font-semibold mb-1">Total Products</p>
                            <p class="text-3xl font-bold text-green-800">${totalProducts}</p>
                            <p class="text-green-600 text-xs mt-1">In inventory</p>
                        </div>
                        <div class="w-14 h-14 bg-green-200 rounded-xl flex items-center justify-center">
                            <i class="fas fa-book text-green-600 text-2xl"></i>
                        </div>
                    </div>
                </div>
                
                <div class="stat-card bg-gradient-to-br from-purple-50 to-purple-100 border border-purple-200 rounded-2xl p-6 shadow-lg">
                    <div class="flex items-center justify-between">
                        <div>
                            <p class="text-purple-600 text-sm font-semibold mb-1">Total Bills</p>
                            <p class="text-3xl font-bold text-purple-800">${totalBills}</p>
                            <p class="text-purple-600 text-xs mt-1">Generated</p>
                        </div>
                        <div class="w-14 h-14 bg-purple-200 rounded-xl flex items-center justify-center">
                            <i class="fas fa-file-invoice-dollar text-purple-600 text-2xl"></i>
                        </div>
                    </div>
                </div>
                
                <div class="stat-card bg-gradient-to-br from-orange-50 to-orange-100 border border-orange-200 rounded-2xl p-6 shadow-lg">
                    <div class="flex items-center justify-between">
                        <div>
                            <p class="text-orange-600 text-sm font-semibold mb-1">System Status</p>
                            <p class="text-3xl font-bold text-orange-800">Online</p>
                            <p class="text-orange-600 text-xs mt-1">All systems operational</p>
                        </div>
                        <div class="w-14 h-14 bg-orange-200 rounded-xl flex items-center justify-center">
                            <i class="fas fa-server text-orange-600 text-2xl"></i>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Quick Actions -->
            <div class="mb-8">
                <div class="flex items-center mb-6">
                    <div class="w-12 h-12 bg-gradient-to-br from-primary-100 to-primary-200 rounded-xl flex items-center justify-center mr-4">
                        <i class="fas fa-bolt text-primary-600 text-xl"></i>
                    </div>
                    <div>
                        <h3 class="text-2xl font-bold text-gray-900">Quick Actions</h3>
                        <p class="text-gray-600">Access the most commonly used features</p>
                    </div>
                </div>
                
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
                    <a href="customer?action=list" class="group">
                        <div class="action-card bg-white rounded-2xl shadow-lg border border-gray-200 p-6 hover:border-blue-300 transition-all duration-200">
                            <div class="flex items-center justify-between mb-4">
                                <div class="w-12 h-12 bg-gradient-to-br from-blue-100 to-blue-200 rounded-xl flex items-center justify-center">
                                    <i class="fas fa-users text-blue-600 text-xl"></i>
                                </div>
                                <i class="fas fa-arrow-right text-gray-400 group-hover:text-blue-500 transition-colors duration-200"></i>
                            </div>
                            <h3 class="text-lg font-semibold text-gray-900 mb-2">Customer Management</h3>
                            <p class="text-gray-600 text-sm">Add, edit, and manage customer accounts</p>
                        </div>
                    </a>
                    
                    <a href="product?action=list" class="group">
                        <div class="action-card bg-white rounded-2xl shadow-lg border border-gray-200 p-6 hover:border-green-300 transition-all duration-200">
                            <div class="flex items-center justify-between mb-4">
                                <div class="w-12 h-12 bg-gradient-to-br from-green-100 to-green-200 rounded-xl flex items-center justify-center">
                                    <i class="fas fa-book text-green-600 text-xl"></i>
                                </div>
                                <i class="fas fa-arrow-right text-gray-400 group-hover:text-green-500 transition-colors duration-200"></i>
                            </div>
                            <h3 class="text-lg font-semibold text-gray-900 mb-2">Product Management</h3>
                            <p class="text-gray-600 text-sm">Manage books and other products</p>
                        </div>
                    </a>
                    
                    <a href="bill?action=list" class="group">
                        <div class="action-card bg-white rounded-2xl shadow-lg border border-gray-200 p-6 hover:border-purple-300 transition-all duration-200">
                            <div class="flex items-center justify-between mb-4">
                                <div class="w-12 h-12 bg-gradient-to-br from-purple-100 to-purple-200 rounded-xl flex items-center justify-center">
                                    <i class="fas fa-file-invoice-dollar text-purple-600 text-xl"></i>
                                </div>
                                <i class="fas fa-arrow-right text-gray-400 group-hover:text-purple-500 transition-colors duration-200"></i>
                            </div>
                            <h3 class="text-lg font-semibold text-gray-900 mb-2">Billing System</h3>
                            <p class="text-gray-600 text-sm">Create and manage customer bills</p>
                        </div>
                    </a>
                    
                    <c:if test="${sessionScope.role == 'admin'}">
                        <a href="user-management?action=list" class="group">
                            <div class="action-card bg-white rounded-2xl shadow-lg border border-gray-200 p-6 hover:border-orange-300 transition-all duration-200">
                                <div class="flex items-center justify-between mb-4">
                                    <div class="w-12 h-12 bg-gradient-to-br from-orange-100 to-orange-200 rounded-xl flex items-center justify-center">
                                        <i class="fas fa-user-cog text-orange-600 text-xl"></i>
                                    </div>
                                    <i class="fas fa-arrow-right text-gray-400 group-hover:text-orange-500 transition-colors duration-200"></i>
                                </div>
                                <h3 class="text-lg font-semibold text-gray-900 mb-2">User Management</h3>
                                <p class="text-gray-600 text-sm">Manage system users and permissions</p>
                            </div>
                        </a>
                    </c:if>
                    
                    <a href="dashboard?action=help" class="group">
                        <div class="action-card bg-white rounded-2xl shadow-lg border border-gray-200 p-6 hover:border-gray-300 transition-all duration-200">
                            <div class="flex items-center justify-between mb-4">
                                <div class="w-12 h-12 bg-gradient-to-br from-gray-100 to-gray-200 rounded-xl flex items-center justify-center">
                                    <i class="fas fa-question-circle text-gray-600 text-xl"></i>
                                </div>
                                <i class="fas fa-arrow-right text-gray-400 group-hover:text-gray-500 transition-colors duration-200"></i>
                            </div>
                            <h3 class="text-lg font-semibold text-gray-900 mb-2">Help & Support</h3>
                            <p class="text-gray-600 text-sm">System usage guidelines and support</p>
                        </div>
                    </a>
                </div>
            </div>
            
            <!-- Recent Activity Section -->
            <div class="bg-white rounded-2xl shadow-lg border border-gray-200 p-8">
                <div class="flex items-center mb-6">
                    <div class="w-12 h-12 bg-gradient-to-br from-indigo-100 to-indigo-200 rounded-xl flex items-center justify-center mr-4">
                        <i class="fas fa-chart-line text-indigo-600 text-xl"></i>
                    </div>
                    <div>
                        <h3 class="text-2xl font-bold text-gray-900">System Overview</h3>
                        <p class="text-gray-600">Current system status and performance</p>
                    </div>
                </div>
                
                <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                    <div class="bg-gradient-to-br from-blue-50 to-blue-100 border border-blue-200 rounded-xl p-6">
                        <div class="flex items-center justify-between mb-4">
                            <h4 class="text-lg font-semibold text-blue-900">Database Status</h4>
                            <div class="w-3 h-3 bg-green-500 rounded-full"></div>
                        </div>
                        <p class="text-blue-700 text-sm">All database connections are healthy and operational.</p>
                    </div>
                    
                    <div class="bg-gradient-to-br from-green-50 to-green-100 border border-green-200 rounded-xl p-6">
                        <div class="flex items-center justify-between mb-4">
                            <h4 class="text-lg font-semibold text-green-900">Security Status</h4>
                            <div class="w-3 h-3 bg-green-500 rounded-full"></div>
                        </div>
                        <p class="text-green-700 text-sm">System security is up to date and all checks passed.</p>
                    </div>
                    
                    <div class="bg-gradient-to-br from-purple-50 to-purple-100 border border-purple-200 rounded-xl p-6">
                        <div class="flex items-center justify-between mb-4">
                            <h4 class="text-lg font-semibold text-purple-900">Performance</h4>
                            <div class="w-3 h-3 bg-green-500 rounded-full"></div>
                        </div>
                        <p class="text-purple-700 text-sm">System performance is optimal with fast response times.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script>
        // Update current time
        function updateTime() {
            const now = new Date();
            const timeString = now.toLocaleTimeString();
            document.getElementById('current-time').textContent = timeString;
        }
        
        updateTime();
        setInterval(updateTime, 1000);
        
        // Add some interactive effects
        document.addEventListener('DOMContentLoaded', function() {
            // Add staggered animation to stat cards
            const statCards = document.querySelectorAll('.stat-card');
            statCards.forEach((card, index) => {
                card.style.animationDelay = `${index * 0.1}s`;
                card.classList.add('animate-fade-in-up');
            });
        });
    </script>
</body>
</html> 