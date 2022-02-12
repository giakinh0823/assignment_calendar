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
            font-size: 20px;
        }
        
        .fc-col-header-cell-cushion {
            font-size: 24px;
            font-weight: 400!important;
        }
        
        .fc-event-time{
            font-size: 18px;
        }
        
        .fc-event-title{
            font-size: 18px;
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
                        <fieldset>
                            <c:forEach items="${calendars}" var="calendar">
                                <div class="flex items-center mb-4">
                                    <input id="calendar-${calendar.getId()}" aria-describedby="checkbox-1" type="checkbox" class="w-4 h-4 text-blue-600 bg-gray-100 rounded border-gray-300 focus:ring-blue-500" checked>
                                    <label for="calendar-${calendar.getId()}" class="ml-3 text-md font-medium">${calendar.getName()}</label>
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
                events: function (info, successCallback, failureCallback) {
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
    </body>
</html>
<jsp:include page="../base/footer.jsp" />