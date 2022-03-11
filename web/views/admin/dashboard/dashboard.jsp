<%-- 
    Document   : dashboard
    Created on : Feb 23, 2022, 8:23:46 PM
    Author     : giaki
--%>

<%@page import="model.auth.User"%>
<%@page import="model.calendar.CategoryCalendar"%>
<%@page import="model.calendar.Calendar"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.calendar.EventCalendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin dashboard</title>
        <%
            Integer userSize = (Integer) request.getAttribute("userSize");
            Integer calendarSize = (Integer) request.getAttribute("calendarSize");
            Integer eventSize = (Integer) request.getAttribute("eventSize");
            ArrayList<EventCalendar> events = (ArrayList<EventCalendar>) request.getAttribute("events");
            ArrayList<Calendar> calendars = (ArrayList<Calendar>) request.getAttribute("calendars");
            ArrayList<CategoryCalendar> listCategory = (ArrayList<CategoryCalendar>) request.getAttribute("listCategory");
            ArrayList<User> users = (ArrayList<User>) request.getAttribute("users");
        %>
        <script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.2/main.min.css">
    </head>
    <jsp:include page="../base/header.jsp" />
    <body>
        <div class="flex">
            <div class="w-64  bg-gray-50" style="min-width: 250px">
                <jsp:include page="../base/navbar.jsp" />
            </div>
            <div class="w-full p-5">
                <div class="flex justify-between">
                    <div class="p-8 m-2 text-lg text-blue-700 bg-blue-100 rounded-lg flex-1 shadow-sm" role="alert">
                        <div class="flex flex-col items-center">
                            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path></svg>
                            <span class="font-medium mt-3"><%=userSize%></span> 
                        </div>
                    </div>
                    <div class="p-8 m-2 text-lg text-red-700 bg-red-100 rounded-lg flex-1 shadow-sm" role="alert">
                        <div class="flex flex-col items-center">    
                            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 19a2 2 0 01-2-2V7a2 2 0 012-2h4l2 2h4a2 2 0 012 2v1M5 19h14a2 2 0 002-2v-5a2 2 0 00-2-2H9a2 2 0 00-2 2v5a2 2 0 01-2 2z"></path></svg>
                            <span class="font-medium mt-3"><%=calendarSize%></span> 
                        </div>
                    </div>
                    <div class="p-8 m-2 text-lg text-green-700 bg-green-100 rounded-lg flex-1 shadow-sm" role="alert">
                        <div class="flex flex-col items-center">
                            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14 10l-2 1m0 0l-2-1m2 1v2.5M20 7l-2 1m2-1l-2-1m2 1v2.5M14 4l-2-1-2 1M4 7l2-1M4 7l2 1M4 7v2.5M12 21l-2-1m2 1l2-1m-2 1v-2.5M6 18l-2-1v-2.5M18 18l2-1v-2.5"></path></svg>
                            <span class="font-medium mt-3"><%=eventSize%></span> 
                        </div>
                    </div>
                </div>
                <div >
                    <div class="max-w-full">
                        <canvas id="mainChart" style="max-width: 100%!important; max-height: 85vh!important"></canvas>
                    </div>
                    <div class="mt-20 w-full flex">
                        <div class="max-w-full flex-1 p-20">
                            <canvas id="userChart" style="max-width: 100%!important; height: 60vh!important"></canvas>
                        </div>
                        <div class="max-w-full flex-1 p-20">
                            <canvas id="categoryChart" style="max-width: 100%!important; height: 60vh!important"></canvas>
                        </div>
                    </div>
                    <div class="max-w-full mt-20">
                        <h2 class="text-5xl mb-12 text-right">Calendar Admin</h2>
                        <jsp:include page="calendar.jsp" />
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script>
        var listCategoryQuantity = [];
        var listCategoryLabel = [];
        
        <c:forEach items="${listCategory}" var="category">
        listCategoryLabel.push("${category.name}");
        listCategoryQuantity[${category.id}] = 0;
        </c:forEach>

        var eventCalendars = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        var calendars = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        <c:forEach items="${events}" var="event">
        if (new Date("${event.created_at}").getFullYear() == new Date().getFullYear()) {
            eventCalendars[new Date("${event.created_at}").getMonth()] += 1;
            listCategoryQuantity[${event.additional.category.id}] += 1;
        }
        </c:forEach>
        
        listCategoryQuantity = listCategoryQuantity.filter(Number);

        <c:forEach items="${calendars}" var="calendar">
        if (new Date("${calendar.created_at}").getFullYear() == new Date().getFullYear()) {
            calendars[new Date("${calendar.created_at}").getMonth()] += 1;
        }
        </c:forEach>

        var users = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        <c:forEach items="${users}" var="user">
        if (new Date("${user.created_at}").getFullYear() == new Date().getFullYear()) {
            users[new Date("${user.created_at}").getMonth()] += 1;
        }
        </c:forEach>
    </script>
    <script src="/assets/js/dashboard/dashboard.js"></script>
    <jsp:include page="../base/footer.jsp" />
</html>
