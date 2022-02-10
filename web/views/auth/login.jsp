<%-- 
    Document   : login
    Created on : Jan 21, 2022, 11:50:53 AM
    Author     : giaki
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../base/base.jsp" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
            String error = (String)request.getAttribute("error");
        %>
    </head>
    <body>
        <div class="flex items-center justify-center min-h-screen bg-gray-5z0">
            <div class="px-10 py-10 mt-4 text-left bg-white shadow-lg rounded-lg">
                <div class="flex justify-center">
                    <svg xmlns="http://www.w3.org/2000/svg" class="w-20 h-20 text-blue-600" fill="none" viewBox="0 0 24 24"
                         stroke="currentColor">
                    <path d="M12 14l9-5-9-5-9 5 9 5z" />
                    <path
                        d="M12 14l6.16-3.422a12.083 12.083 0 01.665 6.479A11.952 11.952 0 0012 20.055a11.952 11.952 0 00-6.824-2.998 12.078 12.078 0 01.665-6.479L12 14z" />
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                          d="M12 14l9-5-9-5-9 5 9 5zm0 0l6.16-3.422a12.083 12.083 0 01.665 6.479A11.952 11.952 0 0012 20.055a11.952 11.952 0 00-6.824-2.998 12.078 12.078 0 01.665-6.479L12 14zm-4 6v-7.5l4-2.222" />
                    </svg>
                </div>
                <h3 class="text-4xl font-bold text-center mt-3">Login</h3>
                <form action="/login" autocomplete="off" method="POST">
                    <div class="mt-6 sm:w-80 md:w-96">
                        <%if(error!=null){%>
                        <div>
                            <div class="bg-red-100 rounded-lg py-5 px-6 mb-4 text-base text-red-700 mb-3" role="alert">
                                <%=error%>
                            </div>
                        </div>
                        <%}%>
                        <div>
                            <label class="block" for="username">Username or Email</label>
                            <input type="text" placeholder="Username or Email" autocomplete="off" name="username" required
                                   class="w-full px-4 py-2 mt-2 border rounded-md focus:outline-none focus:ring-1 focus:ring-blue-600"/>
                        </div>
                        <div class="mt-4">
                            <label class="block">Password</label>
                            <input type="password" placeholder="Password" autocomplete="off" name="password" required
                                   class="w-full px-4 py-2 mt-2 border rounded-md focus:outline-none focus:ring-1 focus:ring-blue-600"/>
                        </div>
                        <div class="flex items-baseline justify-between mt-4">
                            <button class="px-6 py-2 mt-4 text-white bg-blue-600 rounded-lg hover:bg-blue-900">Login</button>
                            <div>
                                <a href="/signup" class="text-sm text-blue-600 hover:underline">Signup</a>
                                <span>/</span>
                                <a href="#" class="text-sm text-blue-600 hover:underline">Forgot password?</a>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
