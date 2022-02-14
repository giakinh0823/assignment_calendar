<%-- 
    Document   : calendar
    Created on : Feb 11, 2022, 1:01:26 PM
    Author     : giaki
--%>

<%@page import="model.EventCalendar"%>
<%@page import="model.CategoryCalendar"%>
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
    </style>
    <%
        ArrayList<EventCalendar> events = (ArrayList<EventCalendar>) request.getAttribute("events");
        ArrayList<Calendar> calendars = (ArrayList<Calendar>) request.getAttribute("calendars");
        ArrayList<CategoryCalendar> listCategory = (ArrayList<CategoryCalendar>) request.getAttribute("listCategory");
    %>
    <body>
        <jsp:include page="../dashboard/navbar.jsp" />
        <!--<div class="w-[calc(100%_-_15rem)] ml-auto p-5 min-h-screen">-->
        <div class="ml-auto p-5 min-h-screen">
            <div class="flex">
                <div class="w-60 md:w-64 lg:w-80 px-5 pt-3">
                    <div class="mb-5">
                        <div class="mb-5 flex justify-between">
                            <h2 class="text-xl">Category</h2>
                        </div>
                        <fieldset>
                            <c:forEach items="${listCategory}" var="category">
                                <div class="flex justify-between items-center  mb-2">
                                    <div class="flex items-center">
                                        <input id="category-${category.getId()}" aria-describedby="checkbox-1" type="checkbox" class="w-4 h-4 border-[#1c64f2] bg-white checked:bg-[#1c64f2] checked:border-[#1c64f2] bg-gray-100 rounded border-gray-300 focus:ring-blue-500" checked>
                                        <label for="category-${category.getId()}" class="ml-3 text-md font-medium">${category.getName()}</label>
                                    </div>
                                </div>
                            </c:forEach>
                        </fieldset>
                    </div>
                    <div class="mb-5">
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
                                        <%for (EventCalendar event : events) {%>
                                            {
                                                id: <%=event.getId()%>,
                                                title: "<%=event.getTitle()%>",
                                                start: <%= event.getAdditional().isIsOnlyDate() ? "new Date('" + event.getAdditional().getStartDate() + "').toJSON().split('T')[0]" : "new Date('" + event.getAdditional().getStartDate() + "').toISOString()"%>,
                                                end: <%= event.getAdditional().isIsOnlyDate() ? "new Date('" + event.getAdditional().getEndDate() + "').toJSON().split('T')[0]" : "new Date('" + event.getAdditional().getEndDate() + "').toISOString()"%>,
                                                color: "<%=event.getAdditional().getCalendar().getColor()%>",
                                                description: "<%=event.getDescription()%>",
                                                location: "<%=event.getLocation()%>",
                                                overlap: <%=event.getAdditional().isOverlap()%>,
                                                category: "<%=event.getAdditional().getCategory().getId()%>",
                                                categoryName: "<%=event.getAdditional().getCategory().getName()%>",
                                                status: "<%=event.getAdditional().getStatus().getId()%>",
                                                statusName: "<%=event.getAdditional().getStatus().getName()%>",
                                                isOnlyDate: <%=event.getAdditional().isIsOnlyDate()%>,
                                            <%if (event.getAdditional().getDisplay() != null) {%>
                                                display: <%=event.getAdditional().getDisplay() != null ? "'" + event.getAdditional().getDisplay() + "'" : "undefined"%>,
                                            <%}%>
                                            },
                                        <%}%>
                                        ]

                                        const calendarEl = document.getElementById('calendar');
                                        const calendar = new FullCalendar.Calendar(calendarEl, {
                                        headerToolbar: {
                                            left: 'prev,next today',
                                                center: 'title',
                                                right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth',
                                            },
                                                initialDate: new Date(),
                                                navLinks: true, // có thể nhấp vào tên ngày / tuần để điều hướng chế độ xem
                                                businessHours: true, // hiển thị giờ làm việc
                                                editable: true,
                                                selectable: true,
                                                droppable: true,
                                                dayMaxEventRows: true,
                                                eventClick: function (info) {
                                                    alert(info.event.title);
                                                },
                                                eventDrop: function (info) {
                                                    const start = new Date(info.event.start);
                                                    const end = new Date(info.event.end);
                                                    console.log(info.event);
                                                    if(info.event.allDay){
                                                        start.setDate(start.getDate()+1);
                                                        end.setDate(end.getDate()+1);
                                                    }
                                                    const event = {
                                                        id: info.event.id,
                                                        start: start.getTime(),
                                                        end: end.getTime(),
                                                        isOnlyDate: info.event.extendedProps.isOnlyDate,
                                                    }
                                                    if(info.event._def.hasEnd){
                                                        event.isOnlyDate = false;
                                                    } else{
                                                        event.isOnlyDate = true;
                                                    }
                                                    $.ajax({
                                                        method: "POST",
                                                        url: "/calendar/updateEvent",
                                                        data: event,
                                                    }).done(function (data) {
                                                        // update event thành công
                                                    });
                                                },
                                                eventResize: function (info) {
                                                    const start = new Date(info.event.start);
                                                    const end = new Date(info.event.end);
                                                    console.log(info.event);
                                                    if((info.event.allDay || info.event.extendedProps.isOnlyDate) && !info.event._def.hasEnd){
                                                        start.setDate(start.getDate()+1);
                                                        end.setDate(end.getDate()+1);
                                                    }
                                                    const event = {
                                                        id: info.event.id,
                                                        start: start.getTime(),
                                                        end: end.getTime(),
                                                        isOnlyDate: info.event.extendedProps.isOnlyDate,
                                                    }
                                                    if(info.event._def.hasEnd){
                                                        event.isOnlyDate = false;
                                                    } else{
                                                        event.isOnlyDate = true;
                                                    }
                                                    console.log(info.event._def.hasEnd);
                                                    $.ajax({
                                                        method: "POST",
                                                        url: "/calendar/updateEvent",
                                                        data: event,
                                                    }).done(function (data) {
                                                        // update event thành công
                                                    });
                                                },
                                                events: function (info, successCallback, failureCallback, dropInfo) {
                                                    successCallback(events);
                                                },
                                        });
                                        calendar.render();
                                        $("#form-add-event").on("submit", function (e) {
                                            e.preventDefault();
                                            const event = {
                                            title: $("#titleEvent").val(),
                                                description: $("#description").val(),
                                                start: $("#startDate").val(),
                                                color: $("#colorEvent").val(),
                                                category: $("#category").val(),
                                                calendar: $("#calendarGroup").val(),
                                                overlap: $("#overlap").is(':checked'),
                                                isOnlyDate: true,
                                            }
                                            if ($("#startTime").val()) {
                                                event.start = event.start + "T" + $("#startTime").val();
                                                event.isOnlyDate = false;
                                            }
                                            if ($("#endDate").val()) {
                                                event.end = $("#endDate").val();
                                                if ($("#endTime").val()) {
                                                    event.end = event.end + "T" + $("#endTime").val();
                                                    event.isOnlyDate = false;
                                                }
                                            }   
                                            if ($("#display").val() != "default") {
                                                event.display = $("#display").val();
                                            }
                                            if ($("#location").val() && $("#location").val() != "" && $("#location").val() != null) {
                                                event.location = $("#location").val();
                                            }
                                            event.start = new Date(event.start).getTime();
                                            event.end = new Date(event.end).getTime();
                                            console.log(event);
                                            $.ajax({
                                                method: "POST",
                                                url: "/calendar/addEvent",
                                                data: event,
                                            }).done(function (data) {
                                                const event = {
                                                    id: data.id,
                                                    title: data.title,
                                                    description: data?.description,
                                                    location: data?.location,
                                                    color: data?.additional?.calendar.color,
                                                    overlap: data?.additional?.overlap,
                                                    category:data?.additional?.category?.id,
                                                    categoryName:data?.additional?.category?.name,
                                                    status: data?.additional?.status?.id,
                                                    statusName:data?.additional?.status?.name,
                                                    start: data?.additional?.isOnlyDate ? new Date(data?.additional?.startDate).toJSON().split('T')[0] : new Date(data?.additional?.startDate).toISOString(),
                                                    end: data?.additional?.isOnlyDate ? new Date(data?.additional?.endDate).toJSON().split('T')[0] : new Date(data?.additional?.endDate).toISOString(),
                                                    isOnlyDate: data?.additional?.isOnlyDate,
                                                }
                                                if (data?.additional?.display){
                                                    event.display = data?.additional?.display;
                                                }
                                                console.log(data);
                                                console.log(event);
                                                events.push(event);
                                                calendar.refetchEvents();
                                            });
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

        <script>
                    $("#calendarGroup").on('change', (e) => {
            const color = event.target[event.target.selectedIndex].getAttribute("data-color");
            $("#colorEvent").val(color);
            $("#colorEvent").css("color", color);
            });
        </script>
    </body>
</html>
<jsp:include page="../base/footer.jsp" />