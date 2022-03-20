<%-- 
    Document   : calendar
    Created on : Feb 11, 2022, 1:01:26 PM
    Author     : giaki
--%>
<%@page import="model.calendar.EventCalendar"%>
<%@page import="model.calendar.CategoryCalendar"%>
<%@page import="model.calendar.Calendar"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Calendar</title>
        <link rel="stylesheet" href="/assets/lib/fullcalendar/main.min.css">
        <%
            ArrayList<EventCalendar> events = (ArrayList<EventCalendar>) request.getAttribute("events");
            ArrayList<Calendar> calendars = (ArrayList<Calendar>) request.getAttribute("calendars");
            ArrayList<CategoryCalendar> listCategory = (ArrayList<CategoryCalendar>) request.getAttribute("listCategory");
        %>
    </head>
    <jsp:include page="../../base/header.jsp" />
    <style>
        .fc-button-primary{
            background-color: #fff!important;
            border-color: #fff!important;
            color: black!important;
            padding: 10px 15px!important;
            box-shadow: rgba(0, 0, 0, 0.1) 0px 4px 12px;
        }

        .fc-button-primary:focus{
            box-shadow: none!important;
        }
        .fc-button-group .fc-button{
            margin: 0 2px!important;
            border-radius: 10px!important;
        }

        .fc-view .fc-col-header-cell{
            padding-top: 10px!important;
            padding-bottom: 10px!important;
        }

        .fc-theme-standard td, .fc-theme-standard th{
            border: 1px solid #ebebeb;
        }

        .fc-daygrid-event{
            opacity: 0.7!important;
        }

        .fc-daygrid-day-top{
            font-size: 18px;
        }

        .fc-col-header-cell-cushion {
            font-size: 20px;
            font-weight: 400!important;
        }

        .fc-event-time{
            font-size: 16px;
        }

        .fc-event-title{
            font-size: 16px;
        }

        .fc .fc-bg-event{
            opacity: 0.4!important;
        }
        .fc-bg-event.fc-event .fc-event-title{
            font-weight: bold;
            font-size: 16px;
        }
        a.fc-event.hidden {
            display: none;
        }
        @media only screen and (max-width: 800px) {
            #navBarCalendar {
                display: none;
            }
        }
    </style>
    <body>
        <div class="ml-auto pt-4 max-h-screen">
            <div class="flex" >
                <div class="w-60 lg:w-70 px-2 pt-3" id="navBarCalendar">
                    <div class="mb-5">
                        <div class="mb-5 flex justify-between">
                            <h2 class="text-xl">Category</h2>
                        </div>
                        <fieldset>
                            <c:forEach items="${listCategory}" var="category">
                                <div class="flex justify-between items-center  mb-2">
                                    <div class="flex items-center">
                                        <input id="category-${category.getId()}" value="${category.getId()}" name="filter-event-category" aria-describedby="checkbox-1" type="checkbox" class="w-4 h-4 border-[#1c64f2] bg-white checked:bg-[#1c64f2] checked:border-[#1c64f2] bg-gray-100 rounded border-gray-300 focus:ring-blue-500" checked>
                                        <label for="category-${category.getId()}" class="ml-3 text-md font-medium">${category.getName()}</label>
                                    </div>
                                </div>
                            </c:forEach>
                        </fieldset>
                    </div>
                    <div class="mb-5">
                        <div class="mb-5 flex justify-between">
                            <h2 class="text-xl">My Calendars</h2>
                        </div>
                        <fieldset>
                            <c:forEach items="${calendars}" var="calendar">
                                <div class="flex justify-between items-center  mb-3 calendar-item-${calendar.getId()}">
                                    <div class="flex items-center">
                                        <input id="calendar-${calendar.getId()}" value="${calendar.getId()}" name="filter-event-calendar" aria-describedby="checkbox-1" type="checkbox" class="w-4 h-4 border-[${calendar.getColor()}] bg-white checked:bg-[${calendar.getColor()}] checked:border-[${calendar.getColor()}] bg-gray-100 rounded border-gray-300 focus:ring-blue-500" checked>
                                        <label for="calendar-${calendar.getId()}" class="ml-3 text-md font-medium">${calendar.getName()}</label>
                                    </div>
                                </div>
                            </c:forEach>
                        </fieldset>
                    </div>
                </div>
                <div class="w-full">
                    <div id="calendar" class="max-h-[73vh] w-full"></div>
                </div>
            </div>
        </div>

        <div class="z-[10000] fixed bottom-8 right-8" id="toast">
        </div>
        <script src="/assets/lib/fullcalendar/main.min.js"></script>
        <script src="/assets/js/calendar/calendarUser.js"></script>
        <script>
            var events = []
            <c:forEach items="${events}" var="event">
                events.push({
                id: ${event.getId()},
                title: `${event.getTitle()}`,
                start: new Date("${event.getAdditional().getStartDate()}").getTime(),
                end: new Date("${event.getAdditional().getEndDate()}").getTime(),
                color: `${event.getAdditional().getCalendar().getColor()}`,
                description: `${event.getDescription()}`,
                location: `${event.getLocation()}`,
                overlap: ${event.getAdditional().isOverlap()},
                category: ${event.getAdditional().getCategory().getId()},
                categoryName: "${event.getAdditional().getCategory().getName()}",
                status: "${event.getAdditional().getStatus().getId()}",
                statusName: "${event.getAdditional().getStatus().getName()}",
                allDay: ${event.getAdditional().isIsAllDay()},
                hasEnd: ${event.getAdditional().isIsHasEnd()},
                calendarName: "${event.getAdditional().getCalendar().getName()}",
                calendar: ${event.getAdditional().getCalendar().getId()},
                additional: ${event.getAdditional().getId()},
                <c:if test="${event.getAdditional().getDisplay() != null}">
                display: "${event.getAdditional().getDisplay()}",    
                </c:if>
            })
            </c:forEach>
        </script>
        <script src="/assets/js/calendar/eventUser.js"></script>
    </body>
</html>
<jsp:include page="../../base/footer.jsp" />