<%-- 
    Document   : signup
    Created on : Jan 21, 2022, 11:51:00 AM
    Author     : giaki
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="https://unpkg.com/flowbite@1.3.3/dist/flowbite.min.css" />
        <title>Signup Calendar</title>
        <link rel="icon" id="favicon256" sizes="256x256" type="image/x-icon" href="/assets/images/icon.ico">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </head>
    <body>
        <div class="flex items-center justify-center min-h-screen bg-gray-5z0">
            <div class="px-10 py-10 mt-4 text-left bg-white shadow-lg rounded-lg">
                <div class="flex justify-center">
                    <svg xmlns="http://www.w3.org/2000/svg" class="w-20 h-20 text-blue-600" fill="none" viewBox="0 0 24 24"
                         stroke="currentColor">
                    <path d="M12 14l9-5-9-5-9 5 9 5z" />
                    <path
                        d="M12 14l6.16-3.422a12.083 12.083 0 01.665 6.479A11.952 11.952 0 0012 20.055a11.952 11.952 0 00-6.824-2.998 12.078 12.078 0 01.665-6.479L12 14z" />
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                          d="M12 14l9-5-9-5-9 5 9 5zm0 0l6.16-3.422a12.083 12.083 0 01.665 6.479A11.952 11.952 0 0012 20.055a11.952 11.952 0 00-6.824-2.998 12.078 12.078 0 01.665-6.479L12 14zm-4 6v-7.5l4-2.222" />
                    </svg>
                </div>
                <h3 class="text-4xl font-bold text-center mt-3">Signup</h3>
                <form action="/signup" autocomplete="off" method="POST" id="signup">
                    <div class="mt-6 w-96">
                        <div id="showErrorForm" class="hidden">
                            <div id="contentErrorForm" class="bg-red-100 rounded-lg py-5 px-6 mb-4 text-base text-red-700 mb-3" role="alert">
                            </div>
                        </div>
                        <div id="showSuccessForm" class="hidden p-4 mb-4 text-sm text-green-700 bg-green-100 rounded-lg" role="alert">
                            <span id="contentSuccessForm" class="font-medium"></span>
                        </div>
                        <div>
                            <label class="block" for="username">Username</label>
                            <input type="text" placeholder="Username" autocomplete="off" id="username" name="username" required
                                   class="w-full px-4 py-2 mt-2 border rounded-md focus:outline-none focus:ring-1 focus:ring-blue-600"/>
                        </div>
                        <div class="mt-4">
                            <label class="block" for="email">Email</label>
                            <input type="email" placeholder="Email" autocomplete="off" id="email" name="email" required
                                   class="w-full px-4 py-2 mt-2 border rounded-md focus:outline-none focus:ring-1 focus:ring-blue-600"/>
                        </div>
                        <div class="mt-4">
                            <label class="block" for="password">Password</label>
                            <input type="password" placeholder="Password" autocomplete="off" id="password" name="password" required
                                   class="w-full px-4 py-2 mt-2 border rounded-md focus:outline-none focus:ring-1 focus:ring-blue-600"/>
                        </div>
                        <div class="mt-4">
                            <label class="block" for="confirm_password">Confirm password</label>
                            <input type="password" placeholder="Confirm password" autocomplete="off" id="confirm_password" name="confirm_password" required
                                   class="w-full px-4 py-2 mt-2 border rounded-md focus:outline-none focus:ring-1 focus:ring-blue-600"/>
                        </div>
                        <div class="mt-4">
                            <label class="block" for="phone">Phone</label>
                            <input type="text" placeholder="Phone" autocomplete="off" id="phone" name="phone" required
                                   class="w-full px-4 py-2 mt-2 border rounded-md focus:outline-none focus:ring-1 focus:ring-blue-600"/>
                        </div>
                        <div class="mt-4">
                            <label class="block" for="first_name">First Name</label>
                            <input type="text" placeholder="First Name" autocomplete="off" id="first_name" name="first_name" required
                                   class="w-full px-4 py-2 mt-2 border rounded-md focus:outline-none focus:ring-1 focus:ring-blue-600"/>
                        </div>
                        <div class="mt-4">
                            <label class="block" for="last_name">Last Name</label>
                            <input type="text" placeholder="Last Name" autocomplete="off" id="last_name" name="last_name" required
                                   class="w-full px-4 py-2 mt-2 border rounded-md focus:outline-none focus:ring-1 focus:ring-blue-600"/>
                        </div >
                        <div class="flex mt-4">
                            <div class="form-check">
                                <input  class="form-check-input appearance-none rounded-full h-4 w-4 border border-gray-300 bg-white checked:bg-blue-600 checked:border-blue-600 focus:outline-none transition duration-200 mt-1 align-top bg-no-repeat bg-center bg-contain float-left mr-2 cursor-pointer" type="radio" name="gender" id="male" value="male" checked required>
                                <label class="form-check-label inline-block text-gray-800" for="male">
                                    Male
                                </label>
                            </div>
                            <div class="form-check ml-3">
                                <input class="form-check-input appearance-none rounded-full h-4 w-4 border border-gray-300 bg-white checked:bg-blue-600 checked:border-blue-600 focus:outline-none transition duration-200 mt-1 align-top bg-no-repeat bg-center bg-contain float-left mr-2 cursor-pointer" type="radio" name="gender" id="female"  value="female" required>
                                <label class="form-check-label inline-block text-gray-800" for="female">
                                    Female
                                </label>
                            </div>
                        </div>
                        <div class="mt-4">
                            <label class="block" for="birthday">Birthday</label>
                            <input type="date" placeholder="Birthday" autocomplete="off" id="birthday" name="birthday" required
                                   class="form-control w-full px-4 py-2 mt-2 border rounded-md focus:outline-none focus:ring-1 focus:ring-blue-600"/>
                        </div>
                        <div class="flex items-baseline justify-between mt-4">
                            <button class="px-6 py-2 mt-4 text-white bg-blue-600 rounded-lg hover:bg-blue-900">Signup</button>
                            <div>
                                <a href="/login" class="text-sm text-blue-600 hover:underline">Login</a>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <script>
            $("#signup").on("submit", function(e){
                e.preventDefault();
                const data = {
                    username: $("#username").val(),
                    email: $("#email").val(),
                    password: $("#password").val(),
                    confirm_password: $("#confirm_password").val(),
                    phone: $("#phone").val(),
                    first_name: $("#first_name").val(),
                    last_name: $("#last_name").val(),
                    gender: $("input[name='gender']:checked").val(),
                    birthday: $("#birthday").val(),
                }
                $.ajax({
                    method: "POST",
                    url: "/signup",
                    data: data,
                }).done(function(data){
                    console.log(data);
                    if (data?.detailMessage) {
                        $("#showSuccessForm").addClass("hidden")
                        $('#contentErrorForm').text(data?.detailMessage);
                        $("#showErrorForm").removeClass("hidden")
                    } else{
                        location.pathname = "/login";
                        $("#showErrorForm").addClass("hidden")
                        $('#contentSuccessForm').text("Signup success")
                        $("#showSuccessForm").removeClass("hidden")
                   }
                })
            })
        </script>
         <script src="https://unpkg.com/flowbite@1.3.3/dist/flowbite.js"></script>
    </body>
</html>
