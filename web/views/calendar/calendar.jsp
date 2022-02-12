<%-- 
    Document   : calendar
    Created on : Feb 11, 2022, 1:01:26 PM
    Author     : giaki
--%>

<%@page import="model.Calendar"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../base/header.jsp" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.2/main.min.css">
    </head>
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
    </style>
    <%
        ArrayList<Calendar> calendars = (ArrayList<Calendar>) request.getAttribute("calendars");
    %>
    <body>
        <jsp:include page="../dashboard/navbar.jsp" />
        <!--<div class="w-[calc(100%_-_15rem)] ml-auto p-5 min-h-screen">-->
        <div class="ml-auto p-5 min-h-screen">
            <div class="flex">
                <div class="w-60 md:w-64 lg:w-80">
                    <div class="px-5 pt-3">
                        <div class="mb-5 flex justify-between">
                            <h2 class="text-xl">My Calendars</h2>
                            <button type="button" data-modal-toggle="addCalendar-modal">
                                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6"></path></svg>
                            </button>
                        </div>
                        <fieldset>
                            <c:forEach items="${calendars}" var="calendar">
                                <div class="flex justify-between items-center  mb-2">
                                    <div class="flex items-center">
                                        <input id="calendar-${calendar.getId()}" aria-describedby="checkbox-1" type="checkbox" class="w-4 h-4 border-[${calendar.getColor()}] bg-white checked:bg-[${calendar.getColor()}] checked:border-[${calendar.getColor()}] bg-gray-100 rounded border-gray-300 focus:ring-blue-500" checked>
                                        <label for="calendar-${calendar.getId()}" class="ml-3 text-md font-medium">${calendar.getName()}</label>
                                    </div>
                                    <button type="button" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm inline-flex items-center p-1.5" data-modal-toggle="confirm-delete-calendar-modal" onclick="deleteCalendar(${calendar.getId()})">
                                        <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>  
                                    </button>
                                </div>
                            </c:forEach>
                        </fieldset>
                    </div>
                </div>
                <div class="w-full px-5">
                    <div id="calendar" class="max-h-screen w-full"></div>
                </div>
                <div class="w-60 md:w-64 lg:w-80">
                    <div class="mb-8">
                        <jsp:include page="addCalendar.jsp" />
                    </div>
                    <div>
                        <jsp:include page="addEvent.jsp" />
                    </div>
                </div>
            </div>
        </div>


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
        <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.2/main.min.js"></script>
        <script>
                                        const events = [
                                            {
                                                colorId: 1,
                                                title: 'Business Lunch',
                                                start: '2022-02-03T13:00:00',
                                                constraint: 'businessHours'
                                            },
                                            {
                                                colorId: 1,
                                                title: 'Meeting',
                                                start: '2022-02-13T11:00:00',
                                                constraint: 'availableForMeeting',
                                                color: '#257e4a'
                                            },
                                            {
                                                colorId: 1,
                                                title: 'Conference',
                                                start: '2022-02-12',
                                                end: '2022-02-13',
                                            },
                                            {
                                                colorId: 1,
                                                title: 'Party',
                                                start: '2022-02-29T20:00:00'
                                            },
                                            // các khu vực phải bỏ "Cuộc họp"
                                            {
                                                colorId: 1,
                                                groupId: 'availableForMeeting',
                                                start: '2020-02-11T10:00:00',
                                                end: '2020-02-11T16:00:00',
                                                display: 'background',
                                            },
                                            {
                                                colorId: 1,
                                                groupId: 'availableForMeeting',
                                                start: '2022-02-13T10:00:00',
                                                end: '2022-02-13T16:00:00',
                                                display: 'background',
                                            },
                                            // khu vực màu đỏ nơi không có sự kiện nào có thể bị bỏ
                                            {
                                                colorId: 1,
                                                start: '2022-02-24',
                                                end: '2022-02-28',
                                                overlap: false,
                                                display: 'background',
                                                color: '#ff9f89'
                                            },
                                            {
                                                colorId: 1,
                                                start: '2022-02-06',
                                                end: '2022-02-08',
                                                overlap: false,
                                                display: 'background',
                                                color: '#ff9f89'
                                            }
                                        ]

                                        const calendarEl = document.getElementById('calendar');
                                        const calendar = new FullCalendar.Calendar(calendarEl, {
                                            headerToolbar: {
                                                left: 'prev,next today',
                                                center: 'title',
                                                right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
                                            },
                                            initialDate: new Date(),
                                            navLinks: true, // có thể nhấp vào tên ngày / tuần để điều hướng chế độ xem
                                            businessHours: true, // hiển thị giờ làm việc
                                            editable: true,
                                            selectable: true,
                                            droppable: true,
                                            dayMaxEventRows: true,
                                            eventClick: function (info) {
                                                alert(info.event.extendedProps.colorId);
                                            },
                                            eventDrop: function (info) {
                                                alert(info.event.title + " was dropped on " + info.event.start.toISOString() + " - " + info.event.start.toISOString());
                                            },
                                            eventResize: function (info) {
                                                alert(info.event.title + " was dropped on " + info.event.start.toISOString() + " - " + info.event.start.toISOString());
                                            },
                                            events: function (info, successCallback, failureCallback, dropInfo) {
                                                successCallback(events);
                                            },
                                        });
                                        calendar.render();
                                        $("#form-add-event").on("submit", function (e) {
                                            e.preventDefault();
                                            const event = {
                                                title: $("#nameEvent").val(),
                                                description: $("#description").val(),
                                                start: $("#startDate").val(),
                                                color: $("input:radio[name=color]:checked").val(),
                                                category: $("#category").val(),
                                                calendar: $("#calendar").val(),
                                            }
                                            if ($("#startTime").val()) {
                                                event.start = event.start + "T" + $("#startTime").val();
                                            }
                                            if ($("#endDate").val()) {
                                                event.end = $("#endDate").val();
                                                if ($("#endTime").val()) {
                                                    event.end = event.end + "T" + $("#endTime").val();
                                                }
                                            }
                                            if ($("#display").val() != "default") {
                                                event.display = $("#display").val();
                                            }
                                            if ($("#overlap").is(':checked')) {
                                                event.overlap = true;
                                            }
                                            if ($("#location").val() && $("#location").val() != "" && $("#location").val() != null) {
                                                event.location = $("#location").val();
                                            }
                                            events.push(event);
                                            console.log(event);
                                            calendar.refetchEvents();
                                        });
        </script>
        <script>
            const deleteCalendar = (id) => {
                $("#confirm-delete-calendar").attr("data-id", id);
            }
            $("#confirm-delete-calendar").on('click', (e) => {
                alert($("#confirm-delete-calendar").attr("data-id"));
            })
        </script>
    </body>
</html>
<jsp:include page="../base/footer.jsp" />