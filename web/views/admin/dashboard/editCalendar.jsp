<%-- 
    Document   : editCalendar
    Created on : Feb 22, 2022, 4:30:39 PM
    Author     : giaki
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <div id="editCalendar-modal" aria-hidden="true" class="hidden overflow-y-auto overflow-x-hidden fixed right-0 left-0 top-4 z-50 justify-center items-center h-modal md:h-full md:inset-0">
            <div class="relative px-4 w-full max-w-md h-full md:h-auto">
                <!-- Modal content -->
                <div class="relative bg-white rounded-lg shadow">
                    <div class="flex justify-end p-2">
                        <button type="button" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center" data-modal-toggle="editCalendar-modal">
                            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>  
                        </button>
                    </div>
                    <div class="block p-6 rounded-lg shadow-lg bg-white max-w-md">
                        <div class="mb-5 flex justify-center">
                            <h1 class="text-2xl">Edit Calendar</h1>
                        </div>
                        <form action="/calendar/editCalendar"  method="POST">
                            <input id="idCalendar" name="idCalendar" type="hidden"/>
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
                                       placeholder="Name calendar" name="nameCalendar" id="nameEditCalendar" required>
                            </div>
                            <div class="form-group mb-5 flex items-center">
                                <label for="colorCalendar" class="block text-sm font-medium text-gray-900 mr-2">Color:</label>
                                <input type="color" class="form-control block
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
                                       placeholder="Color calendar" name="colorCalendar" id="colorEditCalendar" required>
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
                                    ease-in-out" id="buttonEditCalendar">Update calendar</button>
                        </form>
                    </div>
                </div>
            </div>
        </div> 

    </body>
</html>