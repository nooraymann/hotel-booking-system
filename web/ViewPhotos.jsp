<%-- 
    Document   : ViewPhotos
    Created on : Jan 13, 2021, 7:13:14 AM
    Author     : pc
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body{
                background-image: url('h1.jpeg');
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-size: cover;  

            }
            .Cards{
                margin-top:0;
                margin-left:150px;
                padding-top:20px;
                background-color:#0009;
                font-size:15px;
                color:white;
                width:450px;
                height:270px;
                text-align: center;
                display :inline-block;
                position: relative;
                top: 10px;
                
            }
        
        </style>
    </head>
    <body>
         <%
             try{
            String hotelName = request.getParameter("hotelName");
            
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/web?useSSL=false";
            String user = "root";
            Connection connection = null;
            connection = (Connection) DriverManager.getConnection(url, user, "webproject");
           
            PreparedStatement checkStmt = (PreparedStatement) connection.prepareStatement("SELECT * FROM Photos where HotelName=?");
            checkStmt.setString(1, hotelName);
            ResultSet rs = checkStmt.executeQuery();

            while(rs.next()) {  %>
                <div class="Cards">
                    
                    <img src='<%=rs.getString("HotelImage")%>' width="450" height="270">
                   
                 </div>

           <% }}catch (Exception e) {
                out.println("Error: " + e.getMessage());
            } %>
            
            
           
    
    </body>
</html>