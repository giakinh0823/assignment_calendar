<%-- 
    Document   : infoEvent
    Created on : Feb 19, 2022, 12:12:47 AM
    Author     : giaki
--%>

<%@page import="model.calendar.CategoryCalendar"%>
<%@page import="model.calendar.Calendar"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
            ArrayList<Calendar> calendars = (ArrayList<Calendar>) request.getAttribute("calendars");
            ArrayList<CategoryCalendar> listCategory = (ArrayList<CategoryCalendar>) request.getAttribute("listCategory");
        %>
    </head>
    <body>
        <button id="buttonOpenModelDetailEvent" class="hidden text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center" type="button" data-modal-toggle="modelCalendarEvent">
            Toggle modal
        </button>

        <!-- Main modal -->
        <div id="modelCalendarEvent" aria-hidden="true" class="hidden overflow-y-auto overflow-x-hidden fixed right-0 left-0 top-4 z-50 justify-center items-center h-modal md:h-full md:inset-0">
            <div class="relative px-4 w-full max-w-2xl h-full md:h-auto">
                <!-- Modal content -->
                <div class="relative bg-white rounded-lg shadow">
                    <!-- Modal header -->
                    <div class="flex justify-between items-start p-5 rounded-t border-b">
                        <h3 class="text-xl font-semibold text-gray-900 lg:text-2xl">
                            Event
                        </h3>
                        <button type="button" id="buttonCloseInfoEvent" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center" data-modal-toggle="modelCalendarEvent">
                            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>  
                        </button>
                    </div>
                    <!-- Modal body -->
                    <div class="space-y-6">
                        <div class="p-5 space-y-5" id="infoEventContent">
                            <div class="flex items-center justify-between">
                                <p class="text-3xl" id="titleDetailEvent">Đi họp lớp</p>
                                <div class="flex justify-end items-center">
                                    <button type="button" id="buttonDeleteEvent" data-modal-toggle="confirm-delete-event-modal" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center">
                                        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path></svg>                                    </button>
                                    <button type="button" id="buttonGoToEditEvent" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center">
                                        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14 5l7 7m0 0l-7 7m7-7H3"></path></svg>
                                    </button>
                                </div>
                            </div>
                            <p class="text-lg flex items-center">
                                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg> 
                                <span class="ml-2" id="timeDetailEvent"> </span>
                            </p>
                            <p class="text-lg flex items-center">
                                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"></path><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"></path></svg>
                                <span class="ml-2" id="locationDetailEvent"></span>
                            </p>
                            <p class="text-lg" id="descriptionDetailEvent"></p>
                            <p class="text-lg flex items-center">
                                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15.172 7l-6.586 6.586a2 2 0 102.828 2.828l6.414-6.586a4 4 0 00-5.656-5.656l-6.415 6.585a6 6 0 108.486 8.486L20.5 13"></path></svg>                            
                                <span class="ml-2" id="categoryDetailEvent"></span>
                            </p>
                            <p class="text-lg flex items-center">
                                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"></path></svg>
                                <span class="ml-2" id="calendarDetailEvent"></span>
                            </p>
                            <p class="text-lg flex items-center">
                                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5.636 18.364a9 9 0 010-12.728m12.728 0a9 9 0 010 12.728m-9.9-2.829a5 5 0 010-7.07m7.072 0a5 5 0 010 7.07M13 12a1 1 0 11-2 0 1 1 0 012 0z"></path></svg>
                                <span class="ml-2" id="statusDetailEvent"></span>
                            </p>
                        </div>
                        <div class="hidden flex justify-center pl-5 pr-5" id="editEventContent">
                            <div class="block bg-white w-full">
                                <button type="button" id="buttonGoToInfoEvent" class="mb-3 text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center">
                                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"></path></svg>                                
                                </button>
                                <form action="/calendar/editEvent" name="form-edit-event" id="form-edit-event" method="POST">
                                    <input name="id" id="idEditEvent" type="hidden"/>
                                    <input id="idAdditional" name="additional" type="hidden"/>
                                    <div class="form-group mb-5">
                                        <label for="titleEvent" class="block text-sm font-medium text-gray-900 mr-2">Title</label>
                                        <input type="text" class="form-control block w-full px-3 py-1.5 text-base font-normal text-gray-700 bg-white bg-clip-padding border border-solid border-gray-300 rounded transition ease-in-out m-0 focus:text-gray-700 focus:bg-white focus:border-blue-600 focus:outline-none"
                                               placeholder="Title event" name="title" id="titleEditEvent" required>
                                    </div>
                                    <div class="mb-3 w-full">
                                        <div class="flex justify-center">
                                            <div class="mb-3 w-full">
                                                <label for="calendarGroup" class="block text-sm font-medium text-gray-900 mr-2">Calendar</label>
                                                <select name="calendar" id="calendarGroupEditEvent" required class="appearance-none block w-full px-3 py-1.5 text-base font-normal text-gray-700 bg-white bg-clip-padding bg-no-repeat border border-solid border-gray-300 rounded transition ease-in-out m-0 focus:text-gray-700 focus:bg-white focus:border-blue-600 focus:outline-none" aria-label="Default select example">
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
                                        <input type="text" class="form-control block w-full px-3 py-1.5 text-base font-normal text-gray-700 bg-white bg-clip-padding border border-solid border-gray-300 rounded transition ease-in-out m-0 focus:text-gray-700 focus:bg-white focus:border-blue-600 focus:outline-none disabled"
                                               placeholder="Color" 
                                               name="color" 
                                               value="<%=(calendars != null && calendars.size() > 0) ? calendars.get(0).getColor() : ""%>" 
                                               style="color: <%=(calendars != null && calendars.size() > 0) ? calendars.get(0).getColor() : ""%>" 
                                               id="colorEditEvent" 
                                               disabled>
                                    </div>
                                    <div class="mb-3 w-full">
                                        <div class="flex justify-center">
                                            <div class="mb-3 w-full">
                                                <label for="category" class="block text-sm font-medium text-gray-900 mr-2">Category</label>
                                                <select name="category" id="categoryEditEvent" required class="appearance-none block w-full px-3 py-1.5 text-base font-normal text-gray-700 bg-white bg-clip-padding bg-no-repeat border border-solid border-gray-300 rounded transition ease-in-out m-0 focus:text-gray-700 focus:bg-white focus:border-blue-600 focus:outline-none" aria-label="Default select example">
                                                    <c:forEach items="${listCategory}" var="category">
                                                        <option value="${category.getId()}">${category.getName()}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="mb-5">
                                        <div class="flex items-center mb-4">
                                            <input id="overlapEditEvent" name="overlap" aria-describedby="overlap" type="checkbox" class="w-4 h-4 text-blue-600 bg-gray-100 rounded border-gray-300 focus:ring-blue-500" checked>
                                            <label for="overlap" class="ml-3 text-sm font-medium">Overlap</label>
                                        </div>
                                    </div>
                                    <div class="mb-3 w-full">
                                        <div class="flex justify-center">
                                            <div class="mb-3 w-full">
                                                <label for="display" class="block text-sm font-medium text-gray-900 mr-2">Display</label>
                                                <select name="display" id="displayEditEvent" required class="appearance-none block w-full px-3 py-1.5 text-base font-normal text-gray-700 bg-white bg-clip-padding bg-no-repeat border border-solid border-gray-300 rounded transition ease-in-out m-0 focus:text-gray-700 focus:bg-white focus:border-blue-600 focus:outline-none" aria-label="Default select example">
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
                                        <input type="text" class="form-control block w-full px-3 py-1.5 text-base font-normal text-gray-700 bg-white bg-clip-padding border border-solid border-gray-300 rounded transition ease-in-out m-0 focus:text-gray-700 focus:bg-white focus:border-blue-600 focus:outline-none"
                                               placeholder="Location" name="location" id="locationEditEvent">
                                    </div>
                                    <div class="form-group mb-6">
                                        <label for="description" class="block text-sm font-medium text-gray-900 mr-2">Description</label>
                                        <textarea class="block w-full px-3 py-1.5 text-base font-normal text-gray-700 bg-white bg-clip-padding border border-solid border-gray-300 rounded transition ease-in-out m-0 focus:text-gray-700 focus:bg-white focus:border-blue-600 focus:outline-none"
                                                  rows="4"
                                                  placeholder="Description"
                                                  name="description"
                                                  id="descriptionEditEvent"
                                                  ></textarea>
                                    </div>
                                    <div class="mb-5">
                                        <div date-rangepicker>
                                            <div class="relative mb-5">
                                                <div class="flex absolute inset-y-0 left-0 items-center pl-3 pointer-events-none">
                                                    <svg class="w-5 h-5 text-gray-500 dark:text-gray-400" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M6 2a1 1 0 00-1 1v1H4a2 2 0 00-2 2v10a2 2 0 002 2h12a2 2 0 002-2V6a2 2 0 00-2-2h-1V3a1 1 0 10-2 0v1H7V3a1 1 0 00-1-1zm0 5a1 1 0 000 2h8a1 1 0 100-2H6z" clip-rule="evenodd"></path></svg>
                                                </div>
                                                <input name="start_date" id="startDateEditEvent" type="date" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full pl-10 p-2.5" placeholder="Select date start">
                                            </div>
                                            <div class="relative mb-2">
                                                <div class="flex absolute inset-y-0 left-0 items-center pl-3 pointer-events-none">
                                                    <svg class="w-5 h-5 text-gray-500 dark:text-gray-400" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M6 2a1 1 0 00-1 1v1H4a2 2 0 00-2 2v10a2 2 0 002 2h12a2 2 0 002-2V6a2 2 0 00-2-2h-1V3a1 1 0 10-2 0v1H7V3a1 1 0 00-1-1zm0 5a1 1 0 000 2h8a1 1 0 100-2H6z" clip-rule="evenodd"></path></svg>
                                                </div>
                                                <input name="start_time" id="startTimeEditEvent" type="time" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full pl-10 p-2.5" placeholder="Select date start">
                                            </div>
                                            <span class="mx-4 text-gray-500">to</span>
                                            <div class="relative mb-2 mt-2">
                                                <div class="flex absolute inset-y-0 left-0 items-center pl-3 pointer-events-none">
                                                    <svg class="w-5 h-5 text-gray-500 dark:text-gray-400" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M6 2a1 1 0 00-1 1v1H4a2 2 0 00-2 2v10a2 2 0 002 2h12a2 2 0 002-2V6a2 2 0 00-2-2h-1V3a1 1 0 10-2 0v1H7V3a1 1 0 00-1-1zm0 5a1 1 0 000 2h8a1 1 0 100-2H6z" clip-rule="evenodd"></path></svg>
                                                </div>
                                                <input name="end_date" id="endDateEditEvent" type="date" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full pl-10 p-2.5" placeholder="Select date end">
                                            </div>
                                            <div class="relative mb-5">
                                                <div class="flex absolute inset-y-0 left-0 items-center pl-3 pointer-events-none">
                                                    <svg class="w-5 h-5 text-gray-500 dark:text-gray-400" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M6 2a1 1 0 00-1 1v1H4a2 2 0 00-2 2v10a2 2 0 002 2h12a2 2 0 002-2V6a2 2 0 00-2-2h-1V3a1 1 0 10-2 0v1H7V3a1 1 0 00-1-1zm0 5a1 1 0 000 2h8a1 1 0 100-2H6z" clip-rule="evenodd"></path></svg>
                                                </div>
                                                <input name="end_time" id="endTimeEditEvent" type="time" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full pl-10 p-2.5" placeholder="Select date end">
                                            </div>
                                        </div>
                                    </div>
                                    <button type="submit" class="w-full px-6 py-2.5 bg-blue-600 text-white font-medium leading-tight uppercase rounded shadow-md hover:bg-blue-700 hover:shadow-lg focus:bg-blue-700 focus:shadow-lg focus:outline-none focus:ring-0 active:bg-blue-800 active:shadow-lg transition duration-150 ease-in-out" 
                                            id="updateEvent">
                                        Update Event
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!-- Modal footer -->
                    <div class="flex justify-end items-center p-6 space-x-2 rounded-b border-t border-gray-200">
                        <button data-modal-toggle="modelCalendarEvent" type="button" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="hidden overflow-y-auto overflow-x-hidden fixed right-0 left-0 top-4 z-50 justify-center items-center md:inset-0 h-modal sm:h-full" id="confirm-delete-event-modal">
            <div class="relative px-4 w-full max-w-md h-full md:h-auto">
                <!-- Modal content -->
                <div class="relative bg-white rounded-lg shadow">
                    <!-- Modal header -->
                    <div class="flex justify-end p-2">
                        <button type="button" id="close-delete-event" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center" data-modal-toggle="confirm-delete-event-modal">
                            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>  
                        </button>
                    </div>
                    <!-- Modal body -->
                    <div class="p-6 pt-0 text-center">
                        <svg class="mx-auto mb-4 w-14 h-14 text-gray-400 dark:text-gray-200" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                        <h3 class="mb-5 text-lg font-normal text-gray-500 dark:text-gray-400">Are you sure you want to delete event?</h3>
                        <button data-modal-toggle="confirm-delete-event-modal" id="confirm-delete-event" type="button" class="text-white bg-red-600 hover:bg-red-800 focus:ring-4 focus:ring-red-300 font-medium rounded-lg text-sm inline-flex items-center px-5 py-2.5 text-center mr-2">
                            Yes, I'm sure
                        </button>
                        <button data-modal-toggle="confirm-delete-event-modal" id="cancel-delete-event" type="button" class="text-gray-500 bg-white hover:bg-gray-100 focus:ring-4 focus:ring-gray-300 rounded-lg border border-gray-200 text-sm font-medium px-5 py-2.5 hover:text-gray-900 focus:z-10">No, cancel</button>
                    </div>
                </div>
            </div>
        </div>
        <script>
            $("#buttonGoToEditEvent").on('click', function (e) {
                $("#infoEventContent").addClass("hidden");
                $("#editEventContent").removeClass("hidden");
            })
            $("#buttonGoToInfoEvent").on('click', function (e) {
                $("#infoEventContent").removeClass("hidden");
                $("#editEventContent").addClass("hidden");
            })
            $("#calendarGroupEditEvent").on('change', (e) => {
                const color = event.target[event.target.selectedIndex].getAttribute("data-color");
                $("#colorEditEvent").val(color);
                $("#colorEditEvent").css("color", color);
            });
            
            $("#buttonDeleteEvent").on('click', (e) => {
                $("#buttonOpenModelDetailEvent").click();
            })
            
            $("#cancel-delete-event").on('click', (e) => {
                $("#buttonOpenModelDetailEvent").click();
            })
            $("#close-delete-event").on('click', (e) => {
                $("#buttonOpenModelDetailEvent").click();
            })
        </script>
    </body>
</html>
