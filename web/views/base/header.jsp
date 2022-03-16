<%-- 
    Document   : base
    Created on : Jan 21, 2022, 11:49:21 AM
    Author     : giaki
--%>

<%@page import="model.auth.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Calendar</title>
        <link rel="stylesheet" href="https://unpkg.com/flowbite@1.3.3/dist/flowbite.min.css" />
        <script src="https://unpkg.com/flowbite@1.3.3/dist/flowbite.js"></script>
        <script src="https://cdn.tailwindcss.com"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </head>
    <%
        User user = (User) request.getSession().getAttribute("user");
    %>
    <body>
        <nav class="bg-white border-gray-200 px-2 sm:px py-2.5 rounded">
            <div class="flex flex-wrap items-center  px-3">
                <div class="flex items-center justify-start">
                    <button type="button" id="buttonMenuNavBarCalendar" class="hidden text-gray-400 mx-3 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center">
                        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"></path></svg>
                    </button>
                    <a href="/" class="flex">
                        <svg class="mr-3 h-10" viewBox="0 0 52 72" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M1.87695 53H28.7791C41.5357 53 51.877 42.7025 51.877 30H24.9748C12.2182 30 1.87695 40.2975 1.87695 53Z" fill="#76A9FA"/><path d="M0.000409561 32.1646L0.000409561 66.4111C12.8618 66.4111 23.2881 55.9849 23.2881 43.1235L23.2881 8.87689C10.9966 8.98066 1.39567 19.5573 0.000409561 32.1646Z" fill="#A4CAFE"/><path d="M50.877 5H23.9748C11.2182 5 0.876953 15.2975 0.876953 28H27.7791C40.5357 28 50.877 17.7025 50.877 5Z" fill="#1C64F2"/></svg>
                        <span class="self-center text-lg font-semibold whitespace-nowrap">Calendar</span>
                    </a>
                </div>
                <div class="flex items-center ml-auto md:ml-4 md:order-2">
                    <c:if test="${user!=null}">
                        <button type="button" class="flex mr-3 text-sm bg-gray-800 rounded-full md:mr-0 focus:ring-4 focus:ring-gray-300" id="user-menu-button" aria-expanded="false" type="button" data-dropdown-toggle="dropdown">
                            <span class="sr-only">Open user menu</span>
                            <img class="w-8 h-8 rounded-full" src='<%=user.getAvatar() != null ? "assets/images/user/"+user.getAvatar() : "/assets/images/default.png"%>' alt="user photo" id="headerAvatar">
                        </button>
                        <!-- Dropdown menu -->
                        <div class="hidden z-50 my-4 text-base list-none bg-white rounded divide-y divide-gray-100 shadow" id="dropdown">
                            <div class="py-3 px-4">
                                <span class="block text-sm text-gray-900"><%=user.getUsername()%></span>
                                <span class="block text-sm font-medium text-gray-500 truncate"><%=user.getEmail()%></span>
                            </div>
                            <ul class="py-1" aria-labelledby="dropdown">
                                <li>
                                    <a href="/profile" class="block py-2 px-4 text-md hover:bg-gray-100">Profile</a>
                                </li>
                                <li>
                                    <a href="/logout" class="block py-2 px-4 text-md hover:bg-gray-100">Sign out</a>
                                </li>
                            </ul>
                        </div>
                    </c:if>
                    <button data-collapse-toggle="mobile-menu-2" type="button" class="inline-flex items-center p-2 ml-1 text-sm text-gray-500 rounded-lg md:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200" aria-controls="mobile-menu-2" aria-expanded="false">
                        <span class="sr-only">Open main menu</span>
                        <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z" clip-rule="evenodd"></path></svg>
                        <svg class="hidden w-6 h-6" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>
                    </button>
                </div>
                <div class="hidden justify-between items-center w-full md:ml-auto md:flex md:w-auto md:order-1" id="mobile-menu-2">
                    <ul class="flex flex-col mt-4 md:flex-row md:space-x-8 md:mt-0 md:text-md md:font-medium">
                        <li>
                            <a href="/" class="item-header-link block py-2 pr-4 pl-3 rounded md:p-0" aria-current="page">Home</a>
                        </li>
                        <li>
                            <a href="/calendar" class="item-header-link block py-2 pr-4 pl-3 rounded md:p-0">Calendar</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <script src="https://unpkg.com/flowbite@1.3.3/dist/flowbite.js"></script>
        <script>
            $(".item-header-link").each(function (index) {
                if ($(this).attr('href') == location.pathname) {
                    $(this).addClass("md:bg-transparent text-blue-700");
                } else {
                    $(this).addClass("hover:bg-gray-50 md:hover:bg-transparent md:border-0 md:hover:text-blue-700");
                }
            })
            if(location.pathname=="/calendar"){
                $("#buttonMenuNavBarCalendar").removeClass("hidden")
            }
        </script>
    </body>
</html>
