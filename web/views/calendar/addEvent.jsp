<%-- 
    Document   : addEvent
    Created on : Feb 12, 2022, 10:17:00 PM
    Author     : giaki
--%>

<%@page import="model.Calendar"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        ArrayList<Calendar> calendars = (ArrayList<Calendar>) request.getAttribute("calendars");
    %>
    <body>
        <div class="block p-6 rounded-lg shadow-lg bg-white max-w-md">
            <div class="mb-5 flex justify-center">
                <h1 class="text-2xl">Add event</h1>
            </div>
            <form action="/calendar" name="form-add-event" id="form-add-event" method="POST">
                <div class="form-group mb-5">
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
                           placeholder="Name Event" name="name" id="nameEvent" required>
                </div>
                <div class="mb-5">
                    <div class="flex justify-center">
                        <div class="mb-3 xl:w-96">
                            <select name="calendar" id="calendar" required class="appearance-none
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
                                    <option value="${calendar.getId()}">${calendar.getName()}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="flex justify-center flex-wrap mb-5">
                    <div class="m-2">
                        <input class="appearance-none rounded-full h-4 w-4 border border-[#8136E0] bg-white checked:bg-[#8136E0] checked:border-[#8136E0] focus:outline-none transition duration-200 mt-1 align-top bg-no-repeat bg-center bg-contain float-left mr-2 cursor-pointer" type="radio" class="color" name="color" value="#8136E0" checked>
                    </div>
                    <div class="m-2">
                        <input class="appearance-none rounded-full h-4 w-4 border border-[#E0211F] bg-white checked:bg-[#E0211F] checked:border-[#E0211F] focus:outline-none transition duration-200 mt-1 align-top bg-no-repeat bg-center bg-contain float-left mr-2 cursor-pointer" type="radio" class="color" name="color" value="#E0211F">
                    </div>
                    <div class="m-2">
                        <input class="appearance-none rounded-full h-4 w-4 border border-[#E09D41] bg-white checked:bg-[#E09D41] checked:border-[#E09D41] focus:outline-none transition duration-200 mt-1 align-top bg-no-repeat bg-center bg-contain float-left mr-2 cursor-pointer" type="radio" class="color" name="color" value="#E09D41">
                    </div>
                    <div class="m-2">
                        <input class="appearance-none rounded-full h-4 w-4 border border-[#2B3DE0] bg-white checked:bg-[#2B3DE0] checked:border-[#2B3DE0] focus:outline-none transition duration-200 mt-1 align-top bg-no-repeat bg-center bg-contain float-left mr-2 cursor-pointer" type="radio" class="color" name="color" value="#2B3DE0">
                    </div>
                    <div class="m-2">
                        <input class=" appearance-none rounded-full h-4 w-4 border border-[#E0DD14] bg-white checked:bg-[#E0DD14] checked:border-[#E0DD14] focus:outline-none transition duration-200 mt-1 align-top bg-no-repeat bg-center bg-contain float-left mr-2 cursor-pointer" type="radio" class="color" name="color" value="#E0DD14">
                    </div>
                    <div class="m-2">
                        <input class="appearance-none rounded-full h-4 w-4 border border-[#1F98E0] bg-white checked:bg-[#1F98E0] checked:border-[#1F98E0] focus:outline-none transition duration-200 mt-1 align-top bg-no-repeat bg-center bg-contain float-left mr-2 cursor-pointer" type="radio" class="color" name="color" value="#1F98E0">
                    </div>
                </div>
                <div class="mb-5">
                    <div class="flex justify-center">
                        <div class="mb-3 xl:w-96">
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
                                <option value="event">Event</option>
                                <option value="todo">Todo</option>
                                <option value="task">Task</option>
                                <option value="orther">Orther</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="mb-5">
                    <div class="flex items-center mb-4">
                        <input id="overlap" name="overlap" aria-describedby="overlap" type="checkbox" class="w-4 h-4 text-blue-600 bg-gray-100 rounded border-gray-300 focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600" checked>
                        <label for="overlap" class="ml-3 text-sm font-medium">Overlap</label>
                    </div>
                </div>
                <div class="mb-5">
                    <div class="flex justify-center">
                        <div class="mb-3 xl:w-96">
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
                                <option value="default">Default</option>
                                <option value="background">Background</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="form-group mb-5">
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
