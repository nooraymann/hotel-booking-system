<%-- 
    Document   : Changing
    Created on : Jan 14, 2021, 6:46:23 PM
    Author     : pc
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change reservation</title>
    </head>
    <body>
       
       <%
           try{
           String id = request.getParameter("id");
            String RoomID= session.getAttribute("roomID").toString();
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/web?useSSL=false";
            String user = "root";
           
            Connection connection = null;
            connection = (Connection) DriverManager.getConnection(url, user, "webproject");
            PreparedStatement deleteStmt = (PreparedStatement) connection.prepareStatement("DELETE From reservation where ReservationID=?;");
            deleteStmt.setString(1, id);
            deleteStmt.executeUpdate();
            PreparedStatement updateStmt = (PreparedStatement)connection.prepareStatement("UPDATE rooms \n"
                                    + "SET Available = 'yes'"  + "\n"
                                    + "WHERE id=?;");
            updateStmt.setString(1,RoomID);
            updateStmt.executeUpdate();
            
            out.println("Thank you :)"+"\r\n"+"Your reservation has been cancelled, now you can make another one.");}
           catch (ClassNotFoundException | SQLException theException) {

            theException.printStackTrace();

        }
           %>
           <br>
           <input class="button" type="button" value="Reserve "  />
       
       
    </body>
</html>