<%-- 
    Document   : addEvent
    Created on : Feb 12, 2022, 10:17:00 PM
    Author     : giaki
--%>

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
    %>
    <body>
        <div class="block p-6 rounded-lg shadow-lg bg-white max-w-md">
            <div class="mb-5 flex justify-between items-center">
                <h1 class="text-2xl">Add event</h1>
                <button type="button" id="buttonCloseAddFormEvent" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center">
                    <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>  
                </button>
            </div>
            <form action="/calendar/addEvent" name="form-add-event" id="form-add-event" method="POST">
                <div id="showErrorFormAdd" class="hidden">
                    <div id="contentErrorFormAdd" class="bg-red-100 rounded-lg py-5 px-6 mb-4 text-base text-red-700 mb-3" role="alert">
                    </div>
                </div>
                <div id="showSuccessFormAdd" class="hidden p-4 mb-4 text-sm text-green-700 bg-green-100 rounded-lg" role="alert">
                    <span id="contentSuccessFormAdd" class="font-medium"></span>
                </div>
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
                           placeholder="Title event" name="title" id="titleEvent" required>
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
                                    <c:if test="${calendar.user.id==sessionScope.admin.id}">
                                        <option value="${calendar.getId()}" class="option-calendar-${calendar.getId()}" data-color="${calendar.getColor()}" class="font-semibold text-[${calendar.getColor()}]">
                                            ${calendar.getName()}
                                        </option>
                                    </c:if>
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
                           placeholder="Color" name="color" id="colorEvent" disabled>
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
                        <input id="overlap" name="overlap" aria-describedby="overlap" type="checkbox" class="w-4 h-4 text-blue-600 bg-gray-100 rounded border-gray-300 focus:ring-blue-500" checked>
                        <label for="overlap" class="ml-3 text-sm font-medium">Overlap</label>
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
                           placeholder="Location" name="location" id="location">
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
    </body>
</html>
