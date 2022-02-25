<%-- 
    Document   : manageCategory
    Created on : Feb 25, 2022, 8:59:54 AM
    Author     : giaki
--%>

<%@page import="model.calendar.StatusCalendar"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Status Admin</title>
        <%
            ArrayList<StatusCalendar> listStatus = (ArrayList<StatusCalendar>) request.getAttribute("listStatus");
        %>
    </head>
    <jsp:include page="../base/header.jsp" />
    <body>
        <div class="flex">
            <div class="w-64  bg-gray-50">
                <jsp:include page="../base/navbar.jsp" />
            </div>
            <div class="w-full px-20 py-5">
                <div class="mb-6">
                    <nav class="flex" aria-label="Breadcrumb">
                        <ol class="inline-flex items-center space-x-1 md:space-x-3">
                            <li class="inline-flex items-center text-xl">
                                <a href="/admin" class="inline-flex items-center text-sm font-medium text-gray-700 hover:text-gray-900">
                                    <svg class="mr-2 w-4 h-4" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z"></path></svg>
                                    Admin
                                </a>
                            </li>
                            <li aria-current="page">
                                <div class="flex items-center">
                                    <svg class="w-6 h-6 text-gray-400 text-xl" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd"></path></svg>
                                    <span class="ml-1 text-sm font-medium text-gray-400 md:ml-2 dark:text-gray-500">Status</span>
                                </div>
                            </li>
                        </ol>
                    </nav>
                </div>
                <div class="mb-6">
                    <a href="/admin/status/add" class="inline-flex items-center py-2 px-4 text-sm font-medium text-center text-gray-900 bg-white rounded-lg border border-gray-300 hover:bg-gray-100 focus:ring-4 focus:ring-blue-300">Add status</a>
                </div>
                <div class="flex w-full flex-wrap  space-x-6">
                    <c:forEach items="${listStatus}" var="status">
                        <div class="min-w-md bg-white rounded-lg border border-gray-200 shadow-md py-8 px-6">
                            <div class="flex flex-col items-center pb-5">
                                <h3 class="mb-1 text-xl font-medium text-gray-900">${status.getName()}</h3>
                                <span class="text-sm text-gray-500">id - ${status.getId()}</span>
                                <div class="flex mt-4 space-x-3">
                                    <a href="/admin/status/edit?id=${status.getId()}" class="inline-flex items-center py-2 px-4 text-sm font-medium text-center text-gray-900 bg-white rounded-lg border border-gray-300 hover:bg-gray-100 focus:ring-4 focus:ring-blue-300">Edit</a>
                                    <a href="/admin/status/delete?id=${status.getId()}" class="inline-flex items-center py-2 px-4 text-sm font-medium text-center text-white bg-blue-700 rounded-lg hover:bg-blue-800 focus:ring-4 focus:ring-blue-300">Delete</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <jsp:include page="../base/footer.jsp" />
    </body>
</html>
