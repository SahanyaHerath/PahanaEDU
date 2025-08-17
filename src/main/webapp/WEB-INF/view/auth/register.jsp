<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - Pahana Edu</title>
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
        .register-btn {
            transition: all 0.3s ease-in-out;
        }
        .register-btn:hover {
            transform: translateY(-2px);
        }
    </style>
</head>
<body class="bg-gradient-to-br from-primary-600 via-primary-700 to-primary-800 min-h-screen flex items-center justify-center p-4">
    <div class="bg-white rounded-3xl shadow-2xl p-8 max-w-xl w-full mx-4">
        <!-- Logo and Header -->
        <div class="text-center mb-8">
            <div class="w-24 h-24 bg-gradient-to-br from-primary-500 to-primary-600 rounded-2xl flex items-center justify-center mx-auto mb-6 shadow-xl">
                <i class="fas fa-user-plus text-white text-4xl"></i>
            </div>
            <h1 class="text-3xl font-bold text-gray-800 mb-3">Create Account</h1>
            <p class="text-gray-600 text-lg">Sign up to start using Pahana Edu</p>
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

        <!-- Registration Form -->
        <form action="auth" method="post" class="space-y-6">
            <input type="hidden" name="action" value="register">

            <!-- Name Fields -->
            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                <div class="relative">
                    <label for="firstName" class="block text-sm font-semibold text-gray-700 mb-3">
                        <i class="fas fa-id-card mr-2 text-primary-600"></i>First Name
                    </label>
                    <div class="relative">
                        <input type="text" id="firstName" name="firstName" required placeholder="Enter first name" value="${param.firstName}" 
                               class="form-input w-full px-4 py-4 border border-gray-300 rounded-xl focus:ring-2 focus:ring-primary-500 focus:border-primary-500 transition-all duration-200 text-gray-700 placeholder-gray-500">
                        <div class="absolute inset-y-0 right-0 pr-3 flex items-center pointer-events-none">
                            <i class="fas fa-user text-gray-400"></i>
                        </div>
                    </div>
                </div>
                <div class="relative">
                    <label for="lastName" class="block text-sm font-semibold text-gray-700 mb-3">
                        <i class="fas fa-id-card mr-2 text-primary-600"></i>Last Name
                    </label>
                    <div class="relative">
                        <input type="text" id="lastName" name="lastName" required placeholder="Enter last name" value="${param.lastName}" 
                               class="form-input w-full px-4 py-4 border border-gray-300 rounded-xl focus:ring-2 focus:ring-primary-500 focus:border-primary-500 transition-all duration-200 text-gray-700 placeholder-gray-500">
                        <div class="absolute inset-y-0 right-0 pr-3 flex items-center pointer-events-none">
                            <i class="fas fa-user text-gray-400"></i>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Username Field -->
            <div class="relative">
                <label for="username" class="block text-sm font-semibold text-gray-700 mb-3">
                    <i class="fas fa-user mr-2 text-primary-600"></i>Username
                </label>
                <div class="relative">
                    <input type="text" id="username" name="username" required placeholder="Choose a username" value="${param.username}" 
                           class="form-input w-full px-4 py-4 border border-gray-300 rounded-xl focus:ring-2 focus:ring-primary-500 focus:border-primary-500 transition-all duration-200 text-gray-700 placeholder-gray-500">
                    <div class="absolute inset-y-0 right-0 pr-3 flex items-center pointer-events-none">
                        <i class="fas fa-at text-gray-400"></i>
                    </div>
                </div>
            </div>

            <!-- Email Field -->
            <div class="relative">
                <label for="email" class="block text-sm font-semibold text-gray-700 mb-3">
                    <i class="fas fa-envelope mr-2 text-primary-600"></i>Email
                </label>
                <div class="relative">
                    <input type="email" id="email" name="email" required placeholder="Enter your email" value="${param.email}" 
                           class="form-input w-full px-4 py-4 border border-gray-300 rounded-xl focus:ring-2 focus:ring-primary-500 focus:border-primary-500 transition-all duration-200 text-gray-700 placeholder-gray-500">
                    <div class="absolute inset-y-0 right-0 pr-3 flex items-center pointer-events-none">
                        <i class="fas fa-envelope text-gray-400"></i>
                    </div>
                </div>
            </div>

            <!-- Password Fields -->
            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                <div class="relative">
                    <label for="password" class="block text-sm font-semibold text-gray-700 mb-3">
                        <i class="fas fa-lock mr-2 text-primary-600"></i>Password
                    </label>
                    <div class="relative">
                        <input type="password" id="password" name="password" required placeholder="Choose a password" 
                               class="form-input w-full px-4 py-4 border border-gray-300 rounded-xl focus:ring-2 focus:ring-primary-500 focus:border-primary-500 transition-all duration-200 text-gray-700 placeholder-gray-500">
                        <div class="absolute inset-y-0 right-0 pr-3 flex items-center pointer-events-none">
                            <i class="fas fa-lock text-gray-400"></i>
                        </div>
                    </div>
                </div>
                <div class="relative">
                    <label for="confirmPassword" class="block text-sm font-semibold text-gray-700 mb-3">
                        <i class="fas fa-shield-alt mr-2 text-primary-600"></i>Confirm Password
                    </label>
                    <div class="relative">
                        <input type="password" id="confirmPassword" name="confirmPassword" required placeholder="Confirm your password" 
                               class="form-input w-full px-4 py-4 border border-gray-300 rounded-xl focus:ring-2 focus:ring-primary-500 focus:border-primary-500 transition-all duration-200 text-gray-700 placeholder-gray-500">
                        <div class="absolute inset-y-0 right-0 pr-3 flex items-center pointer-events-none">
                            <i class="fas fa-shield-alt text-gray-400"></i>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Register Button -->
            <button type="submit" 
                    class="register-btn w-full bg-gradient-to-r from-primary-500 to-primary-600 text-white font-semibold py-4 px-6 rounded-xl shadow-lg hover:shadow-xl transition-all duration-200 flex items-center justify-center text-lg">
                <i class="fas fa-user-plus mr-3 text-xl"></i>Create Account
            </button>
        </form>

        <!-- Additional Links -->
        <div class="mt-8 text-center space-y-4">
            <p class="text-gray-600 text-base">
                Already have an account? 
                <a href="auth?action=login" class="text-primary-600 hover:text-primary-700 font-semibold transition-colors duration-200">
                    Login here
                </a>
            </p>
            
            <!-- Back to Home -->
            <div class="pt-4 border-t border-gray-200">
                <a href="index.jsp" class="text-gray-500 hover:text-gray-700 text-sm flex items-center justify-center transition-colors duration-200">
                    <i class="fas fa-arrow-left mr-2"></i>
                    Back to Home
                </a>
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
            const inputs = form.querySelectorAll('input');
            
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