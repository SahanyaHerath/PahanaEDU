<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pahana Edu - Help & Support</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        primary: {
                            50: '#eff6ff',
                            100: '#dbeafe',
                            200: '#bfdbfe',
                            300: '#93c5fd',
                            400: '#60a5fa',
                            500: '#3b82f6',
                            600: '#2563eb',
                            700: '#1d4ed8',
                            800: '#1e40af',
                            900: '#1e3a8a',
                        }
                    }
                }
            }
        }
    </script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <script>
        function toggleSidebar() {
            const sidebar = document.getElementById('sidebar');
            sidebar.classList.toggle('-translate-x-full');
        }
    </script>
</head>
<body class="bg-gray-50">
    <!-- Sidebar -->
    <div id="sidebar" class="fixed inset-y-0 left-0 z-50 w-64 bg-white shadow-lg transform -translate-x-full lg:translate-x-0 transition-transform duration-300 ease-in-out">
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
                <a href="dashboard" class="flex items-center px-4 py-3 text-gray-600 hover:text-primary-600 hover:bg-primary-50 rounded-lg transition-colors duration-200">
                    <i class="fas fa-tachometer-alt w-5 h-5 mr-3"></i>
                    Dashboard
                </a>
                
                <a href="customer?action=list" class="flex items-center px-4 py-3 text-gray-600 hover:text-primary-600 hover:bg-primary-50 rounded-lg transition-colors duration-200">
                    <i class="fas fa-users w-5 h-5 mr-3"></i>
                    Customers
                </a>
                
                <a href="product?action=list" class="flex items-center px-4 py-3 text-gray-600 hover:text-primary-600 hover:bg-primary-50 rounded-lg transition-colors duration-200">
                    <i class="fas fa-book w-5 h-5 mr-3"></i>
                    Products
                </a>
                
                <a href="bill?action=list" class="flex items-center px-4 py-3 text-gray-600 hover:text-primary-600 hover:bg-primary-50 rounded-lg transition-colors duration-200">
                    <i class="fas fa-file-invoice-dollar w-5 h-5 mr-3"></i>
                    Bills
                </a>
                
                <c:if test="${sessionScope.role == 'admin'}">
                    <a href="user-management?action=list" class="flex items-center px-4 py-3 text-gray-600 hover:text-primary-600 hover:bg-primary-50 rounded-lg transition-colors duration-200">
                        <i class="fas fa-user-cog w-5 h-5 mr-3"></i>
                        User Management
                    </a>
                </c:if>
                
                <a href="dashboard?action=help" class="flex items-center px-4 py-3 text-primary-600 bg-primary-50 rounded-lg font-medium">
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
        <!-- Top Bar -->
        <div class="bg-white shadow-sm border-b border-gray-200">
            <div class="flex items-center justify-between px-6 py-4">
                <div class="flex items-center space-x-4">
                    <button onclick="toggleSidebar()" class="lg:hidden text-gray-500 hover:text-gray-700">
                        <i class="fas fa-bars text-xl"></i>
                    </button>
                    <h1 class="text-2xl font-bold text-gray-900">Help & Support</h1>
                </div>
                <div class="flex items-center space-x-4">
                    <div class="text-sm text-gray-500">
                        <i class="fas fa-clock mr-1"></i>
                        <span id="current-time"></span>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Main Content Area -->
        <div class="p-6">
            <!-- Welcome Section -->
            <div class="bg-gradient-to-r from-primary-600 to-primary-700 rounded-xl p-8 mb-8 text-white">
                <div class="flex items-center mb-4">
                    <div class="w-12 h-12 bg-white bg-opacity-20 rounded-lg flex items-center justify-center mr-4">
                        <i class="fas fa-question-circle text-white text-2xl"></i>
                    </div>
                    <div>
                        <h1 class="text-3xl font-bold">Help & Support Center</h1>
                        <p class="text-primary-100">Everything you need to know about using Pahana Edu Billing System</p>
                    </div>
                </div>
            </div>
            
            <!-- Quick Navigation -->
            <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
                <a href="#getting-started" class="bg-white rounded-lg shadow-sm border border-gray-200 p-6 hover:shadow-md transition-shadow duration-200">
                    <div class="flex items-center mb-4">
                        <div class="w-10 h-10 bg-blue-100 rounded-lg flex items-center justify-center mr-3">
                            <i class="fas fa-rocket text-blue-600"></i>
                        </div>
                        <h3 class="text-lg font-semibold text-gray-900">Getting Started</h3>
                    </div>
                    <p class="text-gray-600">Learn the basics of using the system</p>
                </a>
                
                <a href="#customer-management" class="bg-white rounded-lg shadow-sm border border-gray-200 p-6 hover:shadow-md transition-shadow duration-200">
                    <div class="flex items-center mb-4">
                        <div class="w-10 h-10 bg-green-100 rounded-lg flex items-center justify-center mr-3">
                            <i class="fas fa-users text-green-600"></i>
                        </div>
                        <h3 class="text-lg font-semibold text-gray-900">Customer Management</h3>
                    </div>
                    <p class="text-gray-600">Manage customer information and accounts</p>
                </a>
                
                <a href="#billing-system" class="bg-white rounded-lg shadow-sm border border-gray-200 p-6 hover:shadow-md transition-shadow duration-200">
                    <div class="flex items-center mb-4">
                        <div class="w-10 h-10 bg-purple-100 rounded-lg flex items-center justify-center mr-3">
                            <i class="fas fa-file-invoice-dollar text-purple-600"></i>
                        </div>
                        <h3 class="text-lg font-semibold text-gray-900">Billing System</h3>
                    </div>
                    <p class="text-gray-600">Create and manage customer bills</p>
                </a>
            </div>
            
            <!-- Help Content -->
            <div class="space-y-8">
                <!-- Getting Started Section -->
                <div id="getting-started" class="bg-white rounded-lg shadow-sm border border-gray-200 p-8">
                    <div class="flex items-center mb-6">
                        <div class="w-12 h-12 bg-blue-100 rounded-lg flex items-center justify-center mr-4">
                            <i class="fas fa-rocket text-blue-600 text-xl"></i>
                        </div>
                        <h2 class="text-2xl font-bold text-gray-900">Getting Started</h2>
                    </div>
                    
                    <div class="prose max-w-none">
                        <p class="text-gray-600 mb-4">
                            Welcome to Pahana Edu Billing System! This comprehensive system helps you manage customers, 
                            products, and billing information efficiently. Here's how to get started:
                        </p>
                        
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mt-6">
                            <div class="bg-gray-50 rounded-lg p-6">
                                <h3 class="text-lg font-semibold text-gray-900 mb-3">1. Add Customers</h3>
                                <p class="text-gray-600 mb-3">Start by adding your customers to the system:</p>
                                <ul class="list-disc list-inside text-gray-600 space-y-1">
                                    <li>Go to Customer Management</li>
                                    <li>Click "Add Customer"</li>
                                    <li>Fill in customer details</li>
                                    <li>Save the customer information</li>
                                </ul>
                            </div>
                            
                            <div class="bg-gray-50 rounded-lg p-6">
                                <h3 class="text-lg font-semibold text-gray-900 mb-3">2. Add Products</h3>
                                <p class="text-gray-600 mb-3">Add your products to the inventory:</p>
                                <ul class="list-disc list-inside text-gray-600 space-y-1">
                                    <li>Go to Product Management</li>
                                    <li>Click "Add Product"</li>
                                    <li>Enter product details and price</li>
                                    <li>Set stock quantity</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Customer Management Section -->
                <div id="customer-management" class="bg-white rounded-lg shadow-sm border border-gray-200 p-8">
                    <div class="flex items-center mb-6">
                        <div class="w-12 h-12 bg-green-100 rounded-lg flex items-center justify-center mr-4">
                            <i class="fas fa-users text-green-600 text-xl"></i>
                        </div>
                        <h2 class="text-2xl font-bold text-gray-900">Customer Management</h2>
                    </div>
                    
                    <div class="prose max-w-none">
                        <p class="text-gray-600 mb-4">
                            Manage your customer database efficiently with our comprehensive customer management features.
                        </p>
                        
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mt-6">
                            <div>
                                <h3 class="text-lg font-semibold text-gray-900 mb-3">Adding Customers</h3>
                                <ul class="list-disc list-inside text-gray-600 space-y-2">
                                    <li>Navigate to Customer Management</li>
                                    <li>Click the "Add Customer" button</li>
                                    <li>Fill in all required fields</li>
                                    <li>Include contact information</li>
                                    <li>Add billing address</li>
                                </ul>
                            </div>
                            
                            <div>
                                <h3 class="text-lg font-semibold text-gray-900 mb-3">Managing Customers</h3>
                                <ul class="list-disc list-inside text-gray-600 space-y-2">
                                    <li>View all customers in the list</li>
                                    <li>Search for specific customers</li>
                                    <li>Edit customer information</li>
                                    <li>View customer billing history</li>
                                    <li>Delete customers if needed</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Billing System Section -->
                <div id="billing-system" class="bg-white rounded-lg shadow-sm border border-gray-200 p-8">
                    <div class="flex items-center mb-6">
                        <div class="w-12 h-12 bg-purple-100 rounded-lg flex items-center justify-center mr-4">
                            <i class="fas fa-file-invoice-dollar text-purple-600 text-xl"></i>
                        </div>
                        <h2 class="text-2xl font-bold text-gray-900">Billing System</h2>
                    </div>
                    
                    <div class="prose max-w-none">
                        <p class="text-gray-600 mb-4">
                            Create and manage customer bills with our intuitive billing system.
                        </p>
                        
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mt-6">
                            <div>
                                <h3 class="text-lg font-semibold text-gray-900 mb-3">Creating Bills</h3>
                                <ul class="list-disc list-inside text-gray-600 space-y-2">
                                    <li>Go to Bill Management</li>
                                    <li>Click "Create Bill"</li>
                                    <li>Select a customer</li>
                                    <li>Add products to the bill</li>
                                    <li>Set quantities and prices</li>
                                    <li>Generate the final bill</li>
                                </ul>
                            </div>
                            
                            <div>
                                <h3 class="text-lg font-semibold text-gray-900 mb-3">Managing Bills</h3>
                                <ul class="list-disc list-inside text-gray-600 space-y-2">
                                    <li>View all bills in the system</li>
                                    <li>Search and filter bills</li>
                                    <li>Print bills for customers</li>
                                    <li>View bill details</li>
                                    <li>Delete bills if necessary</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Support Contact -->
                <div class="bg-gradient-to-r from-gray-50 to-gray-100 rounded-lg p-8">
                    <div class="text-center">
                        <div class="w-16 h-16 bg-primary-100 rounded-full flex items-center justify-center mx-auto mb-4">
                            <i class="fas fa-headset text-primary-600 text-2xl"></i>
                        </div>
                        <h2 class="text-2xl font-bold text-gray-900 mb-4">Need More Help?</h2>
                        <p class="text-gray-600 mb-6">
                            If you need additional support or have questions not covered here, 
                            please contact our support team.
                        </p>
                        <div class="flex flex-col sm:flex-row gap-4 justify-center">
                            <div class="flex items-center justify-center">
                                <i class="fas fa-envelope text-primary-600 mr-2"></i>
                                <span class="text-gray-700">support@pahanaedu.com</span>
                            </div>
                            <div class="flex items-center justify-center">
                                <i class="fas fa-phone text-primary-600 mr-2"></i>
                                <span class="text-gray-700">+94 11 234 5678</span>
                            </div>
                        </div>
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
        
        // Smooth scrolling for anchor links
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                e.preventDefault();
                const target = document.querySelector(this.getAttribute('href'));
                if (target) {
                    target.scrollIntoView({
                        behavior: 'smooth',
                        block: 'start'
                    });
                }
            });
        });
    </script>
</body>
</html> 