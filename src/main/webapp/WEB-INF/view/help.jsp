<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Help & Support - Pahana Edu</title>
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
        .help-card {
            transition: all 0.2s ease-in-out;
        }
        .help-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
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
                <a href="dashboard" class="flex items-center px-4 py-3 text-gray-600 hover:text-primary-600 hover:bg-primary-50 rounded-xl transition-all duration-200">
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
                
                <a href="dashboard?action=help" class="flex items-center px-4 py-3 text-primary-600 bg-primary-50 rounded-xl font-medium shadow-sm">
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
                        <h1 class="text-2xl font-bold text-gray-900">Help & Support</h1>
                        <p class="text-sm text-gray-600">Get help with using the Pahana Edu system</p>
                    </div>
                </div>
                <div class="flex items-center space-x-4">
                    <a href="dashboard" class="bg-gray-100 text-gray-700 px-4 py-2 rounded-xl hover:bg-gray-200 transition-all duration-200 flex items-center">
                        <i class="fas fa-home mr-2"></i>Back to Dashboard
                    </a>
                </div>
            </div>
        </div>

        <!-- Content -->
        <div class="p-6">
            <div class="max-w-6xl mx-auto">
                <!-- Welcome Section -->
                <div class="bg-gradient-to-r from-primary-600 to-primary-700 rounded-2xl p-8 mb-8 text-white">
                    <div class="flex items-center space-x-4">
                        <div class="w-16 h-16 bg-white bg-opacity-20 rounded-xl flex items-center justify-center">
                            <i class="fas fa-question-circle text-white text-2xl"></i>
                        </div>
                        <div>
                            <h2 class="text-3xl font-bold mb-2">Welcome to Help & Support</h2>
                            <p class="text-primary-100 text-lg">Find answers to common questions and learn how to use the system effectively.</p>
                        </div>
                    </div>
                </div>

                <!-- Quick Start Guide -->
                <div class="help-card bg-white rounded-2xl shadow-lg border border-gray-200 p-8 mb-8">
                    <div class="flex items-center mb-6">
                        <div class="w-12 h-12 bg-gradient-to-br from-green-100 to-green-200 rounded-xl flex items-center justify-center mr-4">
                            <i class="fas fa-rocket text-green-600 text-xl"></i>
                        </div>
                        <h3 class="text-2xl font-bold text-gray-900">Quick Start Guide</h3>
                    </div>
                    
                    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                        <div class="bg-gradient-to-br from-blue-50 to-blue-100 border border-blue-200 rounded-xl p-6">
                            <div class="flex items-center mb-4">
                                <div class="w-10 h-10 bg-blue-200 rounded-xl flex items-center justify-center mr-3">
                                    <i class="fas fa-users text-blue-600"></i>
                                </div>
                                <h4 class="text-lg font-semibold text-blue-900">Manage Customers</h4>
                            </div>
                            <p class="text-blue-700 text-sm">Add, edit, and manage customer information. Track customer accounts and contact details.</p>
                        </div>
                        
                        <div class="bg-gradient-to-br from-green-50 to-green-100 border border-green-200 rounded-xl p-6">
                            <div class="flex items-center mb-4">
                                <div class="w-10 h-10 bg-green-200 rounded-xl flex items-center justify-center mr-3">
                                    <i class="fas fa-book text-green-600"></i>
                                </div>
                                <h4 class="text-lg font-semibold text-green-900">Manage Products</h4>
                            </div>
                            <p class="text-green-700 text-sm">Create and manage product catalog. Set prices and track inventory.</p>
                        </div>
                        
                        <div class="bg-gradient-to-br from-purple-50 to-purple-100 border border-purple-200 rounded-xl p-6">
                            <div class="flex items-center mb-4">
                                <div class="w-10 h-10 bg-purple-200 rounded-xl flex items-center justify-center mr-3">
                                    <i class="fas fa-file-invoice-dollar text-purple-600"></i>
                                </div>
                                <h4 class="text-lg font-semibold text-purple-900">Create Bills</h4>
                            </div>
                            <p class="text-purple-700 text-sm">Generate invoices for customers. Add products and calculate totals.</p>
                        </div>
                    </div>
                </div>

                <!-- FAQ Section -->
                <div class="help-card bg-white rounded-2xl shadow-lg border border-gray-200 p-8 mb-8">
                    <div class="flex items-center mb-6">
                        <div class="w-12 h-12 bg-gradient-to-br from-yellow-100 to-yellow-200 rounded-xl flex items-center justify-center mr-4">
                            <i class="fas fa-question text-yellow-600 text-xl"></i>
                        </div>
                        <h3 class="text-2xl font-bold text-gray-900">Frequently Asked Questions</h3>
                    </div>
                    
                    <div class="space-y-4">
                        <div class="bg-gray-50 border border-gray-200 rounded-xl p-6">
                            <h4 class="text-lg font-semibold text-gray-900 mb-2">How do I add a new customer?</h4>
                            <p class="text-gray-700">Go to Customers → Add Customer. Fill in the required information including name, address, and telephone number.</p>
                        </div>
                        
                        <div class="bg-gray-50 border border-gray-200 rounded-xl p-6">
                            <h4 class="text-lg font-semibold text-gray-900 mb-2">How do I create a bill?</h4>
                            <p class="text-gray-700">Go to Bills → Create Bill. Select a customer, add products, and the system will calculate the total automatically.</p>
                        </div>
                        
                        <div class="bg-gray-50 border border-gray-200 rounded-xl p-6">
                            <h4 class="text-lg font-semibold text-gray-900 mb-2">Can I edit customer information?</h4>
                            <p class="text-gray-700">Yes, go to Customers → List Customers, then click the edit button next to any customer to modify their information.</p>
                        </div>
                        
                        <div class="bg-gray-50 border border-gray-200 rounded-xl p-6">
                            <h4 class="text-lg font-semibold text-gray-900 mb-2">How do I print a bill?</h4>
                            <p class="text-gray-700">View any bill and click the "Print Bill" button. The system will generate a printable version of the invoice.</p>
                        </div>
                    </div>
                </div>

                <!-- Contact Support -->
                <div class="help-card bg-white rounded-2xl shadow-lg border border-gray-200 p-8">
                    <div class="flex items-center mb-6">
                        <div class="w-12 h-12 bg-gradient-to-br from-red-100 to-red-200 rounded-xl flex items-center justify-center mr-4">
                            <i class="fas fa-headset text-red-600 text-xl"></i>
                        </div>
                        <h3 class="text-2xl font-bold text-gray-900">Need More Help?</h3>
                    </div>
                    
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <div class="bg-gradient-to-br from-blue-50 to-blue-100 border border-blue-200 rounded-xl p-6">
                            <div class="flex items-center mb-4">
                                <div class="w-10 h-10 bg-blue-200 rounded-xl flex items-center justify-center mr-3">
                                    <i class="fas fa-envelope text-blue-600"></i>
                                </div>
                                <h4 class="text-lg font-semibold text-blue-900">Email Support</h4>
                            </div>
                            <p class="text-blue-700 text-sm mb-4">Send us an email for technical support and assistance.</p>
                            <a href="mailto:support@pahanaedu.com" class="action-btn bg-blue-600 text-white px-4 py-2 rounded-xl hover:bg-blue-700 transition-all duration-200 flex items-center">
                                <i class="fas fa-paper-plane mr-2"></i>Send Email
                            </a>
                        </div>
                        
                        <div class="bg-gradient-to-br from-green-50 to-green-100 border border-green-200 rounded-xl p-6">
                            <div class="flex items-center mb-4">
                                <div class="w-10 h-10 bg-green-200 rounded-xl flex items-center justify-center mr-3">
                                    <i class="fas fa-phone text-green-600"></i>
                                </div>
                                <h4 class="text-lg font-semibold text-green-900">Phone Support</h4>
                            </div>
                            <p class="text-green-700 text-sm mb-4">Call us for immediate assistance during business hours.</p>
                            <a href="tel:+1234567890" class="action-btn bg-green-600 text-white px-4 py-2 rounded-xl hover:bg-green-700 transition-all duration-200 flex items-center">
                                <i class="fas fa-phone mr-2"></i>Call Now
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html> 