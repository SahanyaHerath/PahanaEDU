<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile - Pahana Edu</title>
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
    <style>
        .profile-card {
            transition: all 0.2s ease-in-out;
        }
        .profile-card:hover {
            transform: translateY(-1px);
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
<body class="bg-gradient-to-br from-primary-600 via-primary-700 to-primary-800 min-h-screen flex items-center justify-center p-4">
    <div class="bg-white rounded-3xl shadow-2xl p-8 max-w-xl w-full mx-4">
        <!-- Logo and Header -->
        <div class="text-center mb-8">
            <div class="w-24 h-24 bg-gradient-to-br from-primary-500 to-primary-600 rounded-2xl flex items-center justify-center mx-auto mb-6 shadow-xl">
                <i class="fas fa-user text-white text-4xl"></i>
            </div>
            <h1 class="text-3xl font-bold text-gray-800 mb-3">User Profile</h1>
            <p class="text-gray-600 text-lg">Your account information</p>
        </div>

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

        <c:if test="${not empty user}">
            <!-- Profile Information Cards -->
            <div class="space-y-4 mb-8">
                <!-- Username Card -->
                <div class="profile-card bg-gradient-to-br from-blue-50 to-blue-100 border border-blue-200 rounded-xl p-6">
                    <div class="flex items-center justify-between">
                        <div>
                            <div class="text-blue-600 text-sm font-semibold mb-1">
                                <i class="fas fa-user mr-2"></i>Username
                            </div>
                            <div class="text-xl font-bold text-blue-700">${user.username}</div>
                        </div>
                        <div class="w-12 h-12 bg-blue-200 rounded-xl flex items-center justify-center">
                            <i class="fas fa-user text-blue-600 text-xl"></i>
                        </div>
                    </div>
                </div>

                <!-- Role Card -->
                <div class="profile-card bg-gradient-to-br from-green-50 to-green-100 border border-green-200 rounded-xl p-6">
                    <div class="flex items-center justify-between">
                        <div>
                            <div class="text-green-600 text-sm font-semibold mb-1">
                                <i class="fas fa-user-shield mr-2"></i>Role
                            </div>
                            <div class="text-xl font-bold text-green-700 capitalize">${user.role}</div>
                        </div>
                        <div class="w-12 h-12 bg-green-200 rounded-xl flex items-center justify-center">
                            <i class="fas fa-user-shield text-green-600 text-xl"></i>
                        </div>
                    </div>
                </div>

                <!-- Login Time Card -->
                <div class="profile-card bg-gradient-to-br from-purple-50 to-purple-100 border border-purple-200 rounded-xl p-6">
                    <div class="flex items-center justify-between">
                        <div>
                            <div class="text-purple-600 text-sm font-semibold mb-1">
                                <i class="fas fa-clock mr-2"></i>Login Time
                            </div>
                            <div class="text-xl font-bold text-purple-700">${sessionScope.loginTime}</div>
                        </div>
                        <div class="w-12 h-12 bg-purple-200 rounded-xl flex items-center justify-center">
                            <i class="fas fa-clock text-purple-600 text-xl"></i>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>

        <!-- Action Buttons -->
        <div class="flex flex-col sm:flex-row items-center justify-center gap-4 mb-6">
            <a href="dashboard" 
               class="action-btn bg-gradient-to-r from-gray-100 to-gray-200 text-gray-700 px-6 py-3 rounded-xl hover:from-gray-200 hover:to-gray-300 transition-all duration-200 flex items-center shadow-lg hover:shadow-xl">
                <i class="fas fa-home mr-2"></i>Dashboard
            </a>
            <a href="auth?action=logout" 
               class="action-btn bg-gradient-to-r from-red-600 to-red-700 text-white px-6 py-3 rounded-xl hover:from-red-700 hover:to-red-800 transition-all duration-200 flex items-center shadow-lg hover:shadow-xl">
                <i class="fas fa-sign-out-alt mr-2"></i>Logout
            </a>
        </div>

        <!-- Help Link -->
        <div class="text-center pt-4 border-t border-gray-200">
            <a href="dashboard?action=help" 
               class="text-gray-500 hover:text-gray-700 text-sm flex items-center justify-center transition-colors duration-200">
                <i class="fas fa-question-circle mr-2"></i>Help
            </a>
        </div>
    </div>
</body>
</html> 