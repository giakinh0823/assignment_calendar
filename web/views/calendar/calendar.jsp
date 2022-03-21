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
<jsp:include page="../base/header.jsp" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Calendar</title>
        <!--        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.2/main.min.css">-->
        <link rel="stylesheet" href="/assets/lib/fullcalendar/main.min.css">
        <link href="/assets/lib/calendar/css/mobiscroll.javascript.min.css" rel="stylesheet" />
        <script src="/assets/lib/calendar/js/mobiscroll.javascript.min.js"></script>
        <script src="assets/lib/jquery/jquery-ui.js"></script>
        <%
            ArrayList<EventCalendar> events = (ArrayList<EventCalendar>) request.getAttribute("events");
            ArrayList<Calendar> calendars = (ArrayList<Calendar>) request.getAttribute("calendars");
            ArrayList<CategoryCalendar> listCategory = (ArrayList<CategoryCalendar>) request.getAttribute("listCategory");
        %>
    </head>
    <style>
        .fc-button-primary{
            background-color: #fff!important;
            border-color: #fff!important;
            color: black!important;
            padding: 10px 15px!important;
            box-shadow: rgba(0, 0, 0, 0.1) 0px 4px 12px;
            font-size: 16px;
        }

        .fc-button-primary:focus{
            box-shadow: none!important;
        }
        .fc-button-group .fc-button{
            margin: 0 2px!important;
            border-radius: 10px!important;
        }
        .fc-toolbar-chunk{
            display:flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
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

        .fc .fc-bg-event{
            opacity: 0.4!important;
        }


        a.fc-event.hidden {
            display: none;
        }

        @media only screen and (min-width: 1501px) {
            .fc-view .fc-col-header-cell{
                padding-top: 10px!important;
                padding-bottom: 10px!important;
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

            .fc-bg-event.fc-event .fc-event-title{
                font-weight: bold;
                font-size: 16px;
            }
        }

        @media only screen and (max-width: 1500px) {
            .fc .fc-toolbar.fc-header-toolbar {
                margin-bottom: 0.3rem!important;
            }
            .fc-event-time{
                font-size: 12px;
            }

            .fc-event-title{
                font-size: 12px;
            }

            .fc-bg-event.fc-event .fc-event-title{
                font-weight: bold;
                font-size: 14px;
            }

            .fc-button-primary{
                padding: 7px 10px!important;
                font-size: 12px!important;
            }

            .fc-col-header-cell-cushion {
                font-weight: 400!important;
            }

            .fc-view .fc-col-header-cell{
                padding-top: 5px!important;
                padding-bottom: 5px!important;
            }
        }

        @media only screen and (max-width: 1200px) {
            #navBarCalendar {
                display: none;
            }
        }

        #navBarCalendar::-webkit-scrollbar-track
        {
            border-radius: 10px;
            background-color: #F5F5F5;
        }

        #navBarCalendar::-webkit-scrollbar
        {
            width: 5px;
            background-color: #F5F5F5;
        }

        #navBarCalendar::-webkit-scrollbar-thumb
        {
            border-radius: 10px;
            background-color: #bebebe;
        }

        .mbsc-ios.mbsc-datepicker-inline{
            border-color: #fff;
        }

        .mbsc-calendar-title, .mbsc-calendar-button{
            color: #1d4ed8;
            font-weight: bold;
        }
    </style>
    <script>
        $(function () {
            $("#category-list").sortable();
            $("#calendar-list").sortable();
            $("#navBarCalendar-content").sortable();
        });
    </script>
    <body>
        <div class="ml-auto max-h-screen max-w-full max-h-screen">
            <div class="flex" >
                <div class="w-64 2xl:w-80 px-2 2xl:px-6 pt-3 max-h-[93vh] overflow-y-scroll" id="navBarCalendar">
                    <div class="w-full" id="navBarCalendar-content">
                        <div class="mb-5 w-full mt-5">
                            <input id="demo-marked" class="hidden"/>
                        </div>
                        <div class="mb-5 px-3">
                            <div class="mb-5 flex justify-between">
                                <h2 class="text-xl">Category</h2>
                            </div>
                            <div id="category-list">
                                <c:forEach items="${listCategory}" var="category">
                                    <div class="flex justify-between items-center  mb-2 ui-state-default">
                                        <div class="flex items-center">
                                            <input id="category-${category.getId()}" value="${category.getId()}" name="filter-event-category" aria-describedby="checkbox-1" type="checkbox" class="w-4 h-4 border-[#1c64f2] bg-white checked:bg-[#1c64f2] checked:border-[#1c64f2] bg-gray-100 rounded border-gray-300 focus:ring-blue-500" checked>
                                            <label for="category-${category.getId()}" class="ml-3 font-medium">${category.getName()}</label>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="mb-5 w-full">
                            <div class="flex lg:justify-center">
                                <button type="button" id="buttonOpenAddEvent" class="flex items-center text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm py-1 px-2.5 2xl:px-4 2xl:py-2 text-center mr-2 mb-2">
                                    <span class="text-lg mr-2">Add Event</span><svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6"></path></svg>
                                </button>
                            </div>
                        </div>
                        <div class="mb-5 px-3">
                            <div class="mb-5 flex justify-between">
                                <h2 class="text-xl">My Calendars</h2>
                                <button type="button" data-modal-toggle="addCalendar-modal">
                                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6"></path></svg>
                                </button>
                            </div>
                            <div id="calendar-list">
                                <c:forEach items="${calendars}" var="calendar">
                                    <div class="ui-state-default flex justify-between items-center  mb-2 calendar-item-${calendar.getId()}">
                                        <div class="flex items-center">
                                            <input id="calendar-${calendar.getId()}" value="${calendar.getId()}" name="filter-event-calendar" aria-describedby="checkbox-1" type="checkbox" class="w-4 h-4 border-[${calendar.getColor()}] bg-white checked:bg-[${calendar.getColor()}] checked:border-[${calendar.getColor()}] bg-gray-100 rounded border-gray-300 focus:ring-blue-500" checked>
                                            <label for="calendar-${calendar.getId()}" class="ml-3 font-medium">${calendar.getName()}</label>
                                        </div>
                                        <div class="flex justify-end items-center">
                                            <button type="button" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm inline-flex items-center p-1.5" data-modal-toggle="confirm-delete-calendar-modal" onclick="deleteCalendar(${calendar.getId()})">
                                                <svg class="w-4 h-4 xl:w-5 xl:h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>  
                                            </button>
                                            <button type="button" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm inline-flex items-center p-1.5" data-modal-toggle="editCalendar-modal" onclick="editSetValueCalendar({id: ${calendar.getId()}, name: '${calendar.getName()}', color: '${calendar.getColor()}'})">
                                                <svg class="w-4 h-4 xl:w-5 xl:h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 5v.01M12 12v.01M12 19v.01M12 6a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2zm0 7a1 1 0 110-2 1 1 0 010 2z"></path></svg>
                                            </button>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="w-full">
                    <div id="calendar" class="max-h-[93vh] 2xl:max-h-[94vh] w-full"></div>
                </div>
            </div>
            <div id="addEventFormContainer" class="hidden w-60 md:w-64 lg:w-80 absolute z-[1000] cursor-pointer ui-widget-content">
                <div>
                    <jsp:include page="addEvent.jsp" />
                </div>
            </div>
        </div>
        <jsp:include page="addCalendar.jsp" />


        <div class="hidden overflow-y-auto overflow-x-hidden fixed right-0 left-0 top-4 z-50 justify-center items-center md:inset-0 h-modal sm:h-full" id="confirm-delete-calendar-modal">
            <div class="relative px-4 w-full max-w-md h-full md:h-auto">
                <!-- Modal content -->
                <div class="relative bg-white rounded-lg shadow">
                    <!-- Modal header -->
                    <div class="flex justify-end p-2">
                        <button type="button" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center" data-modal-toggle="confirm-delete-calendar-modal">
                            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>  
                        </button>
                    </div>
                    <!-- Modal body -->
                    <div class="p-6 pt-0 text-center">
                        <svg class="mx-auto mb-4 w-14 h-14 text-gray-400 dark:text-gray-200" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                        <h3 class="mb-5 text-lg font-normal text-gray-500 dark:text-gray-400">Are you sure you want to delete calendar?</h3>
                        <button data-modal-toggle="confirm-delete-calendar-modal" id="confirm-delete-calendar" type="button" class="text-white bg-red-600 hover:bg-red-800 focus:ring-4 focus:ring-red-300 font-medium rounded-lg text-sm inline-flex items-center px-5 py-2.5 text-center mr-2">
                            Yes, I'm sure
                        </button>
                        <button data-modal-toggle="confirm-delete-calendar-modal" type="button" class="text-gray-500 bg-white hover:bg-gray-100 focus:ring-4 focus:ring-gray-300 rounded-lg border border-gray-200 text-sm font-medium px-5 py-2.5 hover:text-gray-900 focus:z-10">No, cancel</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="z-[10000] fixed bottom-8 right-8" id="toast">
        </div>
        <jsp:include page="infoEvent.jsp" />
        <jsp:include page="editCalendar.jsp" />
        <script src="/assets/lib/fullcalendar/main.min.js"></script>
        <script src="/assets/js/calendar/calendar.js"></script>
        <script type="text/javascript">
                                                var events = [
            <c:forEach items="${events}" var="event">
                                                    {
                                                        id: ${event.id},
                                                                title: `${event.title}`,
                                                        start: "${event.additional.startDate}",
                                                                end: "${event.additional.endDate}",
                                                        color: `${event.additional.calendar.color}`,
                                                                description: `${event.description}`,
                                                        location: `${event.location}`,
                                                                overlap: ${event.additional.overlap},
                                                        category: ${event.additional.category.id},
                                                                categoryName: "${event.additional.category.name}",
                                                        status: "${event.additional.status.id}",
                                                                statusName: "${event.additional.status.name}",
                                                        allDay: ${event.additional.isAllDay},
                                                                hasEnd: ${event.additional.isHasEnd},
                                                        calendarName: "${event.additional.calendar.name}",
                                                                calendar: ${event.additional.calendar.id},
                                                        additional: ${event.additional.id},
                                                                display: "${event.additional.display}",
                                                    },
            </c:forEach>
                                                ]
                                                var marked = [
            <c:forEach items="${events}" var="event">
                                                {
                                                start: new Date("${event.additional.startDate}"),
                                                        end: new Date("${event.additional.endDate}"),
                                                color: `${event.additional.calendar.color}`,
                                                }
                                                ,
            </c:forEach>
                                                ]
        </script>
        <script  src="/assets/js/calendar/event.js"></script>
        <script>
                                                const ws_schema = window.location.protocol === "https:" ? "wss" : "ws";
                                                const socketUrl = ws_schema + '://' + window.location.host + '/ws/calendar/${sessionScope.user.username}'
        </script>
        <script src="/assets/js/calendar/websocket.js"></script>
        <script>
                                                mobiscroll.setOptions({
                                                    theme: 'ios',
                                                    themeVariant: 'light',
                                                });
                                                var now = new Date();
                                                mobiscroll.datepicker('#demo-marked', {
                                                    controls: ['calendar'],
                                                    display: 'inline',
                                                    marked: marked,
                                                });
                                                $("#demo-marked").on('change', function () {
                                                    calendar.gotoDate(new Date($(this).val()));
                                                })

        </script>
    </body>
</html>
<jsp:include page="../base/footer.jsp" />