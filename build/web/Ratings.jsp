<%-- 
    Document   : Ratings
    Created on : Jan 15, 2021, 9:47:40 PM
    Author     : Ayman
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
       
        String rate = request.getParameter("rate");
                String comment = request.getParameter("comment");
                String hotelName = request.getSession().getAttribute("hotelName").toString();
                String mail = request.getSession().getAttribute("mail").toString();
                try{
                Class.forName("com.mysql.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/web?useSSL=false";
                String user = "root";
                Connection connection = null;
                connection = (Connection) DriverManager.getConnection(url, user, "webproject");

                PreparedStatement InsertStmt = (PreparedStatement) connection.prepareStatement("Insert into Ratings values(?,?,?,?);");
                 InsertStmt.setString(1,mail);
                InsertStmt.setString(2,hotelName);
                InsertStmt.setString(3,rate);
                InsertStmt.setString(4,comment);
                
                InsertStmt.execute();
                
                out.println("Thank you :)"+"\r\n"+"We will take your rating into consideration");}
                catch (ClassNotFoundException | SQLException theException) {

            theException.printStackTrace();

        }
                
       
       %>
    </body>
</html>
