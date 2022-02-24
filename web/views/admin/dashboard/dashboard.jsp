<%-- 
    Document   : dashboard
    Created on : Feb 23, 2022, 8:23:46 PM
    Author     : giaki
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin dashboard</title>
    </head>
    <jsp:include page="../base/header.jsp" />
    <body>
        <div class="flex">
            <div class="w-64  bg-gray-50">
                <jsp:include page="../base/navbar.jsp" />
            </div>
            <div class="w-full p-5">
                <div class="flex justify-between">
                    <div class="p-8 m-2 text-lg text-blue-700 bg-blue-100 rounded-lg flex-1 shadow-sm" role="alert">
                        <div class="flex flex-col items-center">
                            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path></svg>
                            <span class="font-medium mt-3">512</span> 
                        </div>
                    </div>
                    <div class="p-8 m-2 text-lg text-red-700 bg-red-100 rounded-lg flex-1 shadow-sm" role="alert">
                        <div class="flex flex-col items-center">    
                            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 15l-2 5L9 9l11 4-5 2zm0 0l5 5M7.188 2.239l.777 2.897M5.136 7.965l-2.898-.777M13.95 4.05l-2.122 2.122m-5.657 5.656l-2.12 2.122"></path></svg>                            
                            <span class="font-medium mt-3">512</span> 
                        </div>
                    </div>
                    <div class="p-8 m-2 text-lg text-green-700 bg-green-100 rounded-lg flex-1 shadow-sm" role="alert">
                        <div class="flex flex-col items-center">
                            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"></path><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"></path></svg>
                            <span class="font-medium mt-3">512</span> 
                        </div>
                    </div>
                </div>
                <div>
                     <jsp:include page="calendar.jsp" />
                </div>
            </div>
        </div>
    </body>
    <jsp:include page="../base/footer.jsp" />
</html>
