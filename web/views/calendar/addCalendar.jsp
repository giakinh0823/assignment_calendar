<%-- 
    Document   : addCalendar
    Created on : Feb 12, 2022, 10:18:32 PM
    Author     : giaki
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <div class="block p-6 rounded-lg shadow-lg bg-white max-w-md">
            <div class="mb-5 flex justify-center">
                <h1 class="text-2xl">Add Calendar</h1>
            </div>
            <form action="/calendar/addCalendar"  method="POST">
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
                           placeholder="Name calendar" name="nameCalendar" id="nameCalendar" required>
                </div>
                <div class="flex justify-center flex-wrap mb-5">
                    <div class="m-2">
                        <input class="appearance-none rounded-full h-4 w-4 border border-[#8136E0] bg-white checked:bg-[#8136E0] checked:border-[#8136E0] focus:outline-none transition duration-200 mt-1 align-top bg-no-repeat bg-center bg-contain float-left mr-2 cursor-pointer" type="radio" class="colorCalendar" name="colorCalendar" value="#8136E0" checked>
                    </div>
                    <div class="m-2">
                        <input class="appearance-none rounded-full h-4 w-4 border border-[#E0211F] bg-white checked:bg-[#E0211F] checked:border-[#E0211F] focus:outline-none transition duration-200 mt-1 align-top bg-no-repeat bg-center bg-contain float-left mr-2 cursor-pointer" type="radio" class="colorCalendar" name="colorCalendar" value="#E0211F">
                    </div>
                    <div class="m-2">
                        <input class="appearance-none rounded-full h-4 w-4 border border-[#E09D41] bg-white checked:bg-[#E09D41] checked:border-[#E09D41] focus:outline-none transition duration-200 mt-1 align-top bg-no-repeat bg-center bg-contain float-left mr-2 cursor-pointer" type="radio" class="colorCalendar" name="colorCalendar" value="#E09D41">
                    </div>
                    <div class="m-2">
                        <input class="appearance-none rounded-full h-4 w-4 border border-[#2B3DE0] bg-white checked:bg-[#2B3DE0] checked:border-[#2B3DE0] focus:outline-none transition duration-200 mt-1 align-top bg-no-repeat bg-center bg-contain float-left mr-2 cursor-pointer" type="radio" class="colorCalendar" name="colorCalendar" value="#2B3DE0">
                    </div>
                    <div class="m-2">
                        <input class=" appearance-none rounded-full h-4 w-4 border border-[#E0DD14] bg-white checked:bg-[#E0DD14] checked:border-[#E0DD14] focus:outline-none transition duration-200 mt-1 align-top bg-no-repeat bg-center bg-contain float-left mr-2 cursor-pointer" type="radio" class="colorCalendar" name="colorCalendar" value="#E0DD14">
                    </div>
                    <div class="m-2">
                        <input class="appearance-none rounded-full h-4 w-4 border border-[#1F98E0] bg-white checked:bg-[#1F98E0] checked:border-[#1F98E0] focus:outline-none transition duration-200 mt-1 align-top bg-no-repeat bg-center bg-contain float-left mr-2 cursor-pointer" type="radio" class="colorCalendar" name="colorCalendar" value="#1F98E0">
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
                        ease-in-out" id="addCalendar">Add calendar</button>
            </form>
        </div>
    </body>
</html>
