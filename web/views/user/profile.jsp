<%-- 
    Document   : profile
    Created on : Feb 22, 2022, 6:42:13 PM
    Author     : giaki
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.auth.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <jsp:include page="../base/header.jsp" />
    <%
        User user = (User) request.getSession().getAttribute("user");
    %>
    <body>
        <div class="h-[20rem] bg-gray-100 w-full relative bg-sky-200/50">
            <div class="absolute top-[100%] left-[50%] -translate-y-2/4 -translate-x-2/4">
                <div class="rounded-full border-solid border-4 border-blue-400 w-[200px] h-[200px] overflow-hidden" >
                    <img src='<%=user.getAvatar()!=null?user.getAvatar():"/assets/images/default.png"%>' class="w-full h-full"/>
                </div>
                <div class="text-center mt-3">
                    <p class="text-2xl font-bold display-username"><%=user.getFirst_name()%> <%=user.getLast_name()%></p>
                </div>
            </div>
        </div>
        <div class="mt-[160px] max-w-lg mx-auto">
            <form action="/profile" method="post" id="form-profile-edit">
                <div id="showErrorForm" class="hidden">
                    <div id="contentErrorForm" class="bg-red-100 rounded-lg py-5 px-6 mb-4 text-base text-red-700 mb-3" role="alert">
                    </div>
                </div>
                <div id="showSuccessForm" class="hidden p-4 mb-4 text-sm text-green-700 bg-green-100 rounded-lg" role="alert">
                    <span id="contentSuccessForm" class="font-medium"></span>
                </div>
                <div class="mb-6">
                    <label for="username" class="block mb-2 text-sm font-medium text-gray-900">username</label>
                    <input class="disabled bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5"
                           type="text" id="username" name="username" required disabled value="<%=user.getUsername()%>"/>
                </div>
                <div class="mb-6">
                    <label for="email" class="block mb-2 text-sm font-medium text-gray-900">email</label>
                    <input class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5"
                           type="email" id="email" name="email" required value="<%=user.getEmail()%>"/>
                </div>
                <div class="mb-6">
                    <label for="phone" class="block mb-2 text-sm font-medium text-gray-900">phone number</label>
                    <input class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5"
                           type="text" id="phone" name="phone" required value="<%=user.getPhone()%>"/>
                </div>
                <div class="mb-6">
                    <label for="first_name" class="block mb-2 text-sm font-medium text-gray-900">first name</label>
                    <input class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5"
                           type="text" id="first_name" name="first_name" required value="<%=user.getFirst_name()%>"/>
                </div>
                <div class="mb-6">
                    <label for="last_name" class="block mb-2 text-sm font-medium text-gray-900">last name</label>
                    <input class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5"
                           type="text" id="last_name" name="last_name" required value="<%=user.getLast_name()%>"/>
                </div>
                <div class="mb-6 flex items-center">
                    <div class="flex items-center">
                        <input id="male" type="radio" name="gender" value="male" class="w-4 h-4 border-gray-300 focus:ring-2 focus:ring-blue-300" aria-labelledby="country-option-1" aria-describedby="country-option-1" <%=user.getGender() ? "checked" : ""%>>
                        <label for="male" class="block ml-2 text-sm font-medium text-gray-900">
                            male
                        </label>
                    </div>

                    <div class="flex items-center ml-3">
                        <input id="female" type="radio" name="gender" value="female" class="w-4 h-4 border-gray-300 focus:ring-2 focus:ring-blue-300" aria-labelledby="country-option-2" aria-describedby="country-option-2" <%=!user.getGender() ? "checked" : ""%>>
                        <label for="female" class="block ml-2 text-sm font-medium text-gray-900">
                            female
                        </label>
                    </div>
                </div>
                <div class="mb-6">
                    <label for="birthday" class="block mb-2 text-sm font-medium text-gray-900">birthday</label>
                    <input class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5"
                           type="date" id="birthday" name="birthday" required value="<%=user.getBirthday()%>"/>
                </div>
                <button type="submit" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Submit</button>
            </form>
        </div>
        <script>
            $("#form-profile-edit").on('submit', (e) => {
                e.preventDefault();
                const data = {
                    email: $("input[name='email']").val(),
                    phone: $("input[name='phone']").val(),
                    first_name: $("input[name='first_name']").val(),
                    last_name: $("input[name='last_name']").val(),
                    birthday: $("input[name='birthday']").val(),
                    gender: $("input[name='gender']:checked").val(),
                }
           
                $.ajax({
                    method: "POST",
                    url: "/profile",
                    data: data,
                }).done(function (data) {
                    if (data?.detailMessage) {
                        $("#showSuccessForm").addClass("hidden")
                        $('#contentErrorForm').text(data?.detailMessage);
                        $("#showErrorForm").removeClass("hidden")
                    } else{
                        $("#showErrorForm").addClass("hidden")
                        $('#contentSuccessForm').text("Update success")
                        $(".display-username").text(data?.first_name+" "+data?.last_name)
                        $("#showSuccessForm").removeClass("hidden")
                    }
                })
            })
        </script>
    </body>
    <jsp:include page="../base/footer.jsp" />
</html>
