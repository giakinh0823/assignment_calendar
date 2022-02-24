<%-- 
    Document   : editUser
    Created on : Feb 24, 2022, 9:26:27 AM
    Author     : giaki
--%>
<%@page import="model.auth.User"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin user</title>
    </head>
    <jsp:include page="../base/header.jsp" />
    <body>
        <div class="flex">
            <div class="w-64  bg-gray-50">
                <jsp:include page="../base/navbar.jsp" />
            </div>
            <div class="w-full p-5">
                <jsp:include page="profile.jsp" />
            </div>
        </div>
    </body>
    <jsp:include page="../base/footer.jsp" />
</html>
