<%-- 
    Document   : logout
    Created on : Jan 14, 2021, 2:23:25 PM
    Author     : Ayman
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%session=request.getSession(false);
         session.invalidate();
         response.sendRedirect("loginPage.jsp");
                                  %>
    </body>
</html>
