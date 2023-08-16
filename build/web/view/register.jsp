<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="src.java.lib.utils.Config.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,700,0,200" />
        <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
        <link rel="stylesheet" href="./asset/css/style.css">
        <link rel="icon" href="./asset/images/brand/logo.jpg">
        <title>Register</title>
    </head>
    <body>        
        <div class="w-full flex flex-wrap">
            <!-- Register Section -->
            <div class="w-full md:w-1/2 flex flex-col">

                <div class="flex justify-center md:justify-start pt-12 md:pl-12 md:-mb-24 z-10">
                    <jsp:include page="/component/logo.jsp"/>
                </div>

                <div class="flex flex-col justify-center md:justify-start my-auto pt-8 md:pt-0 px-8 md:px-24 lg:px-32">
                    <p class="text-center text-3xl">Register.</p>
                    <form action="<%=Url.REGISTER%>" method="post" class="flex flex-col pt-3 md:pt-8">
                        <div class="flex flex-col pt-4 rounded-lg">
                            <label for="name" class="text-lg">Full Name*</label>
                            <input type="text" 
                                   name="<%=Param.NAME%>" 
                                   placeholder="full name" required 
                                   class="rounded-lg shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 mt-1 leading-tight focus:outline-none focus:shadow-outline">
                        </div>
                        
                        <div class="flex flex-col pt-4 rounded-lg">
                            <label for="email" class="text-lg">Email*</label>
                            <input type="email" 
                                   name="<%=Param.EMAIL%>" 
                                   placeholder="your@email.com" required 
                                   class="rounded-lg shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 mt-1 leading-tight focus:outline-none focus:shadow-outline">
                        </div>
                        
                        <div class="flex flex-col pt-4 rounded-lg">
                            <label for="phone" id="phone-label" class="text-lg">Phone*</label>
                            <input type="tel" name="<%=Param.PHONE%>" id="phone" onkeyup="phoneCheck(this)" placeholder="phone" required class="rounded-lg shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 mt-1 leading-tight focus:outline-none focus:shadow-outline">
                        </div>

                        <div class="flex pt-4 items-center justify-center rounded-lg">
                            <label for="password" id="password-label" class="text-lg">Password*</label>
                            <input type="password" name="<%=Param.PASSWORD%>" id="password"  placeholder="Password" required class="rounded-lg ml-4 shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 mt-1 leading-tight focus:outline-none focus:shadow-outline">
                        </div>
<!--onkeyup="passwordCheck(this)"-->
<!--                        <div class="flex pt-4 items-center justify-center rounded-lg">
                            <label for="password" id="confirm-label" class="text-lg">Password<br>Confirm*</label>
                            <input type="password" name="<%=Param.PASSWORD_CONFIRM%>" id="password-confirm" onkeyup="confirmCheck(this)" placeholder="Password confirm"required class="rounded-lg ml-4 shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 mt-1 leading-tight focus:outline-none focus:shadow-outline">
                        </div>-->
                        <jsp:include page="/component/message.jsp"/>
                        <input type="submit" value="Register" id="submit-box" class="rounded-lg bg-green-500 text-white font-bold text-lg hover:bg-green-700 p-2 mt-8">
                    </form>
                    <div class="text-center pt-12 pb-12">
                        <p>
                            Already have an account? 
                            <a href="<%=Url.LOGIN%>" class="underline font-semibold text-green-700">Login here.</a>
                        </p>
                    </div>
                </div>

            </div>

            <!-- Image Section -->
            <div class="w-1/2 shadow-2xl">
                <img class="object-cover w-full h-screen hidden md:block" src="./asset/images/plant/login-cover.png">
            </div>
        </div>
                        
        <!--<script src="./asset/js/registerCheck.js"></script>-->
    </body>
</html>
