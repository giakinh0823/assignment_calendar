<%-- 
    Document   : addEvent
    Created on : Feb 12, 2022, 10:17:00 PM
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
    <%
        ArrayList<Calendar> calendars = (ArrayList<Calendar>) request.getAttribute("calendars");
        ArrayList<CategoryCalendar> listCategory = (ArrayList<CategoryCalendar>) request.getAttribute("listCategory");
        EventCalendar event = (EventCalendar) request.getAttribute("event");
    %>
    <body>
        <div class="block p-6 rounded-lg shadow-lg bg-white max-w-md">
            <div class="mb-5 flex justify-between items-center">
                <h1 class="text-2xl">Edit event</h1>
            </div>
            <form action="/admin/event/edit" name="form-add-event" id="form-edit-event" method="POST">
                <div id="showErrorForm" class="hidden">
                <div id="contentErrorForm" class="bg-red-100 rounded-lg py-5 px-6 mb-4 text-base text-red-700 mb-3" role="alert">
                    </div>
                </div>
                <div id="showSuccessForm" class="hidden p-4 mb-4 text-sm text-green-700 bg-green-100 rounded-lg" role="alert">
                    <span id="contentSuccessForm" class="font-medium"></span>
                </div>
                <input name="id" id="idEvent" value="<%=event.getId()%>" type="hidden"/>
                <input name="additional" id="idAdditional" value="<%=event.getAdditional().getId()%>" type="hidden"/>
                <div class="form-group mb-5">
                    <label for="titleEvent" class="block text-sm font-medium text-gray-900 mr-2">Title</label>
                    <input type="text" class="form-control block
                           w-full
                           px-3
                           py-1.5
                           text-base
                           font-normal
                           text-gray-700
                           bg-white bg-clip-padding
                           border border-solid border-gray-300
                           rounded
                           transition
                           ease-in-out
                           m-0
                           focus:text-gray-700 focus:bg-white focus:border-blue-600 focus:outline-none"
                           placeholder="Title event" name="title" value="<%=event.getTitle()%>" id="titleEvent" required>
                </div>
                <div class="mb-3">
                    <div class="flex justify-center">
                        <div class="mb-3 w-full">
                            <label for="calendarGroup" class="block text-sm font-medium text-gray-900 mr-2">Calendar</label>
                            <select name="calendar" id="calendarGroup" required class="appearance-none
                                    block
                                    w-full
                                    px-3
                                    py-1.5
                                    text-base
                                    font-normal
                                    text-gray-700
                                    bg-white bg-clip-padding bg-no-repeat
                                    border border-solid border-gray-300
                                    rounded
                                    transition
                                    ease-in-out
                                    m-0
                                    focus:text-gray-700 focus:bg-white focus:border-blue-600 focus:outline-none" aria-label="Default select example">
                                <c:forEach items="${calendars}" var="calendar">
                                    <option value="${calendar.getId()}" class="option-calendar-${calendar.getId()}" data-color="${calendar.getColor()}" class="font-semibold text-[${calendar.getColor()}]">
                                        ${calendar.getName()}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="form-group mb-5">
                    <label for="colorEvent" class="block text-sm font-medium text-gray-900 mr-2">Color</label>
                    <input type="text" class="form-control block
                           w-full
                           px-3
                           py-1.5
                           text-base
                           font-normal
                           text-gray-700
                           bg-white bg-clip-padding
                           border border-solid border-gray-300
                           rounded
                           transition
                           ease-in-out
                           m-0
                           focus:text-gray-700 focus:bg-white focus:border-blue-600 focus:outline-none disabled"
                           placeholder="Color" name="color" value="<%=(calendars != null && calendars.size() > 0) ? calendars.get(0).getColor() : ""%>" style="color: <%=(calendars != null && calendars.size() > 0) ? calendars.get(0).getColor() : ""%>" id="colorEvent" disabled>
                </div>
                <div class="mb-3">
                    <div class="flex justify-center">
                        <div class="mb-3 w-full">
                            <label for="category" class="block text-sm font-medium text-gray-900 mr-2">Category</label>
                            <select name="category" id="category" required class="appearance-none
                                    block
                                    w-full
                                    px-3
                                    py-1.5
                                    text-base
                                    font-normal
                                    text-gray-700
                                    bg-white bg-clip-padding bg-no-repeat
                                    border border-solid border-gray-300
                                    rounded
                                    transition
                                    ease-in-out
                                    m-0
                                    focus:text-gray-700 focus:bg-white focus:border-blue-600 focus:outline-none" aria-label="Default select example">
                                <c:forEach items="${listCategory}" var="category">
                                    <option value="${category.getId()}">${category.getName()}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="mb-5">
                    <div class="flex items-center mb-4">
                        <input id="overlap" name="overlap" aria-describedby="overlap" type="checkbox" <%=event.getAdditional().isOverlap() ? "checked" : ""%> class="w-4 h-4 text-blue-600 bg-gray-100 rounded border-gray-300 focus:ring-blue-500">
                        <label for="overlap" class="ml-3 text-sm font-medium" >Overlap</label>
                    </div>
                </div>
                <div class="mb-3">
                    <div class="flex justify-center">
                        <div class="mb-3 w-full">
                            <label for="display" class="block text-sm font-medium text-gray-900 mr-2">Display</label>
                            <select name="display" id="display" required class="appearance-none
                                    block
                                    w-full
                                    px-3
                                    py-1.5
                                    text-base
                                    font-normal
                                    text-gray-700
                                    bg-white bg-clip-padding bg-no-repeat
                                    border border-solid border-gray-300
                                    rounded
                                    transition
                                    ease-in-out
                                    m-0
                                    focus:text-gray-700 focus:bg-white focus:border-blue-600 focus:outline-none" aria-label="Default select example">
                                <option value="auto">Auto</option>
                                <option value="block">Block</option>
                                <option value="list-item">List item</option>
                                <option value="background">Background</option>
                                <option value="inverse-background">Inverse Background</option>
                                <option value="none">None</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="form-group mb-5">
                    <label for="location" class="block text-sm font-medium text-gray-900 mr-2">Location</label>
                    <input type="text" class="form-control block
                           w-full
                           px-3
                           py-1.5
                           text-base
                           font-normal
                           text-gray-700
                           bg-white bg-clip-padding
                           border border-solid border-gray-300
                           rounded
                           transition
                           ease-in-out
                           m-0
                           focus:text-gray-700 focus:bg-white focus:border-blue-600 focus:outline-none" 
                           placeholder="Location" name="location" value="<%=event.getLocation()%>" id="location">
                </div>
                <div class="form-group mb-6">
                    <label for="description" class="block text-sm font-medium text-gray-900 mr-2">Description</label>
                    <textarea
                        class="
                        block
                        w-full
                        px-3
                        py-1.5
                        text-base
                        font-normal
                        text-gray-700
                        bg-white bg-clip-padding
                        border border-solid border-gray-300
                        rounded
                        transition
                        ease-in-out
                        m-0
                        focus:text-gray-700 focus:bg-white focus:border-blue-600 focus:outline-none
                        "
                        rows="4"
                        placeholder="Description"
                        name="description"
                        id="description"
                        ></textarea>
                </div>
                <div class="mb-5">
                    <div date-rangepicker>
                        <div class="relative mb-5">
                            <div class="flex absolute inset-y-0 left-0 items-center pl-3 pointer-events-none">
                                <svg class="w-5 h-5 text-gray-500 dark:text-gray-400" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M6 2a1 1 0 00-1 1v1H4a2 2 0 00-2 2v10a2 2 0 002 2h12a2 2 0 002-2V6a2 2 0 00-2-2h-1V3a1 1 0 10-2 0v1H7V3a1 1 0 00-1-1zm0 5a1 1 0 000 2h8a1 1 0 100-2H6z" clip-rule="evenodd"></path></svg>
                            </div>
                            <input name="start_date" id="startDate" type="date" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full pl-10 p-2.5" placeholder="Select date start">
                        </div>
                        <div class="relative mb-2">
                            <div class="flex absolute inset-y-0 left-0 items-center pl-3 pointer-events-none">
                                <svg class="w-5 h-5 text-gray-500 dark:text-gray-400" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M6 2a1 1 0 00-1 1v1H4a2 2 0 00-2 2v10a2 2 0 002 2h12a2 2 0 002-2V6a2 2 0 00-2-2h-1V3a1 1 0 10-2 0v1H7V3a1 1 0 00-1-1zm0 5a1 1 0 000 2h8a1 1 0 100-2H6z" clip-rule="evenodd"></path></svg>
                            </div>
                            <input name="start_time" id="startTime" type="time" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full pl-10 p-2.5" placeholder="Select date start">
                        </div>
                        <span class="mx-4 text-gray-500">to</span>
                        <div class="relative mb-2 mt-2">
                            <div class="flex absolute inset-y-0 left-0 items-center pl-3 pointer-events-none">
                                <svg class="w-5 h-5 text-gray-500 dark:text-gray-400" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M6 2a1 1 0 00-1 1v1H4a2 2 0 00-2 2v10a2 2 0 002 2h12a2 2 0 002-2V6a2 2 0 00-2-2h-1V3a1 1 0 10-2 0v1H7V3a1 1 0 00-1-1zm0 5a1 1 0 000 2h8a1 1 0 100-2H6z" clip-rule="evenodd"></path></svg>
                            </div>
                            <input name="end_date" id="endDate" type="date" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full pl-10 p-2.5" placeholder="Select date end">
                        </div>
                        <div class="relative mb-5">
                            <div class="flex absolute inset-y-0 left-0 items-center pl-3 pointer-events-none">
                                <svg class="w-5 h-5 text-gray-500 dark:text-gray-400" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M6 2a1 1 0 00-1 1v1H4a2 2 0 00-2 2v10a2 2 0 002 2h12a2 2 0 002-2V6a2 2 0 00-2-2h-1V3a1 1 0 10-2 0v1H7V3a1 1 0 00-1-1zm0 5a1 1 0 000 2h8a1 1 0 100-2H6z" clip-rule="evenodd"></path></svg>
                            </div>
                            <input name="end_time" id="endTime" type="time" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full pl-10 p-2.5" placeholder="Select date end">
                        </div>
                    </div>
                </div>
                <button type="submit" class="
                        w-full
                        px-6
                        py-2.5
                        bg-blue-600
                        text-white
                        font-medium
                        text-xs
                        leading-tight
                        uppercase
                        rounded
                        shadow-md
                        hover:bg-blue-700 hover:shadow-lg
                        focus:bg-blue-700 focus:shadow-lg focus:outline-none focus:ring-0
                        active:bg-blue-800 active:shadow-lg
                        transition
                        duration-150
                        ease-in-out" id="addEvent">Add event</button>
            </form>
        </div>
        <script>
            $("#description").val("<%=event.getDescription()%>");
            $("#colorEvent").val("<%=event.getAdditional().getCalendar().getColor()%>");
            $("#colorEvent").css("color", "<%=event.getAdditional().getCalendar().getColor()%>");
            $("#calendarGroup").val(<%=event.getAdditional().getCalendar().getId()%>);
            $("#category").val(<%=event.getAdditional().getCategory().getId()%>);
            if (<%=event.getAdditional().getDisplay()!=null?true:false%>) {
                $("#display").val("<%=event.getAdditional().getDisplay()%>");
            }
            const startDate = new Date("<%=event.getAdditional().getStartDate()%>");
            var startDay = ("0" + startDate.getDate()).slice(-2);
            var startMonth = ("0" + (startDate.getMonth() + 1)).slice(-2);
            var start = startDate.getFullYear() + "-" + (startMonth) + "-" + (startDay);
            $('#startDate').val(start);
            const endDate = new Date("<%=event.getAdditional().getEndDate()%>");
            var endDay = ("0" + endDate.getDate()).slice(-2);
            var endMonth = ("0" + (endDate.getMonth() + 1)).slice(-2);
            var end = endDate.getFullYear() + "-" + (endMonth) + "-" + (endDay);
            $('#endDate').val(end);
            if (<%=event.getAdditional().isIsHasEnd()%>) {
                const startHours = ("0" + startDate.getHours()).slice(-2);
                const startMinutes = ("0" + startDate.getMinutes()).slice(-2);
                const endHours = ("0" + endDate.getHours()).slice(-2);
                const endMinutes = ("0" + endDate.getMinutes()).slice(-2);
                const startTime = startHours + ":" + startMinutes;
                const endTime = endHours + ":" + endMinutes;
                $("#startTime").val(startTime);
                $("#endTime").val(endTime);
            }
            
            
            $("#form-edit-event").on("submit", function (e) {
                e.preventDefault();
                const event = {
                    id: $("#idEvent").val(),
                    title: $("#titleEvent").val(),
                    description: $("#description").val(),
                    start: $("#startDate").val(),
                    color: $("#colorEvent").val(),
                    category: $("#category").val(),
                    calendar: $("#calendarGroup").val(),
                    overlap: $("#overlap").is(':checked'),
                    allDay: true,
                    hasEnd: false,
                    display: $("#display").val(),
                    additional: $("#idAdditional").val(),
                }
                if ($("#startTime").val()) {
                    event.start = event.start + "T" + $("#startTime").val();
                    event.allDay=false;
                }
                if ($("#endDate").val()) {
                    event.end = $("#endDate").val();
                    if ($("#endTime").val()) {
                        event.end = event.end + "T" + $("#endTime").val();
                        event.hasEnd = true;
                        event.allDay=false;
                    }
                }   
                if ($("#location").val() && $("#location").val() != "" && $("#location").val() != null) {
                    event.location = $("#location").val();
                }
                if(new Date(event.end).getDate()-new Date(event.start).getDate()<=0){
                    event.allDay=false;
                }
                if(event.display == 'background' || event.display == 'inverse-background'){
                    event.allDay=true;
                }
                event.start = new Date(event.start).getTime();
                event.end = new Date(event.end).getTime();
                console.log(event);
                $.ajax({
                    method: "POST",
                    url: "/admin/event/edit",
                    data: event,
                }).done(function (data) {
                    if (data?.detailMessage) {
                        $("#showSuccessForm").addClass("hidden")
                        $('#contentErrorForm').text(data?.detailMessage);
                        $("#showErrorForm").removeClass("hidden")
                    } else{
                        const event = {
                            id: data?.id,
                            title: data?.title,
                            description: data?.description,
                            location: data?.location,
                            color: data?.additional?.calendar.color,
                            overlap: data?.additional?.overlap,
                            category:data?.additional?.category?.id,
                            categoryName:data?.additional?.category?.name,
                            status: data?.additional?.status?.id,
                            statusName:data?.additional?.status?.name,
                            calendarName: data?.additional?.calendar?.name,
                            calendar: data?.additional?.calendar?.id,
                            start: new Date(data?.additional?.startDate).toISOString(),
                            end: new Date(data?.additional?.endDate).toISOString(),
                            allDay: data?.additional?.isAllDay,
                            hasEnd: data?.additional?.isHasEnd,
                        }
                        if (data?.additional?.display){
                            event.display = data?.additional?.display;
                        }
                        $("#showErrorForm").addClass("hidden")
                        $('#contentSuccessForm').text("Update success")
                          
                        $("#showSuccessForm").removeClass("hidden")
                        $("#event-show-name").text(data?.title)
                    }
                });
            });
        </script>
    </body>
</html>
