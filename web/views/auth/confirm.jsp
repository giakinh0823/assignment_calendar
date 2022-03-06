<%-- 
    Document   : login
    Created on : Jan 21, 2022, 11:50:53 AM
    Author     : giaki
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="https://unpkg.com/flowbite@1.3.3/dist/flowbite.min.css" />
        <%
            Boolean senEmail = (Boolean)request.getAttribute("senEmail");
        %>
    </head>
    <body>
        <script>
            var senEmail = "${senEmail}";
            if(senEmail==null || senEmail==undefined || senEmail==""){
                location.href="/"
            }
        </script>
        <div class="flex items-center justify-center min-h-screen bg-gray-5z0">
            <h3 class="text-5xl font-medium text-center mt-3">Check your email</h3>
        </div>
         <script src="https://unpkg.com/flowbite@1.3.3/dist/flowbite.js"></script>
    </body>
</html>