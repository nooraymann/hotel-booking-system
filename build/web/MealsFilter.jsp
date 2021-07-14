<%-- 
    Document   : MealsFilter
    Created on : Jan 12, 2021, 11:16:28 PM
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
        <title>filter by meals</title>
        <style>
            body{
                background-image: url('h1.jpeg');
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-size: cover;  

            }
            .center{
                background-color: #0009;
                overflow: hidden;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                padding: 15px;
               color:white;
                    
            }
            .Cards{
                margin-top:0;
                margin-left:150px;
                padding-top:20px;
                background-color:#0009;
                font-size:15px;
                color:white;
                width:450px;
                height:300px;
                text-align: center;
                display :inline-block;
                position: relative;
                top: 70px;
                 color:white;
                
            }
            .button{
                    
                    width: 5em;
                    border-radius:25px; 
                    border:2px ;
                    padding:12px;
                    color: whitesmoke;
                    background:burlywood;
            }
            .text{
                   font-size: 20px;
                   margin: 20px;
                
            }
             .input
            {
                border-radius: 25px; 
                border: 2px ; 
                padding: 10px; 
                width: 10em 
            }
            .button1{
                width: 6em;
                border-radius:25px; 
                border:2px ;
                padding:10px;
                color: whitesmoke;
                background: burlywood;
                
            }
            
        </style>
    </head>
    <body>
        <form class="center" action="MealsFilter.jsp" method="post">
          
            <label>Number of meals (2) OR (3):</label>
            <input class="input" type="number" name="meals" value="" required min="0" />

            <input class="button1" type="submit" value="Done" />

        </form>
        <%
            String destination = session.getAttribute("session.dest").toString();
            String meals= request.getParameter("meals");
            
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/web?useSSL=false";
            String user = "root";
           
            Connection connection = null;
            connection = (Connection) DriverManager.getConnection(url, user, "webproject");
            PreparedStatement checkStmt = (PreparedStatement) connection.prepareStatement("SELECT * FROM Hotels where Destination=? and IncludingMeals=?;");
            checkStmt.setString(1,destination);
            checkStmt.setString(2,meals);
            

            ResultSet rs = checkStmt.executeQuery();
             
            while(rs.next()) {  %>
            <form class="Cards" action="SearchRooms.jsp">
              <div>
                  <input type="hidden" name="hotelName" value="<%=rs.getString("HotelName")%>"/><br>
                  <span class="text">Hotel name:<%=rs.getString("HotelName")%></span><br><br>
                  <span class="text">Rating:<%=rs.getString("HotelRating")%><br></span><br>
                  <span class="text">Destination:<%=rs.getString("Destination")%></span><br><br>
                  <span class="text">Price:<%=rs.getString("HotelExpectedPrice")%></span><br><br>
                  <span class="text">Included meals:<%=rs.getString("IncludingMeals")%></span><br><br>
                  <span class="text">Hotel stars:<%=rs.getString("HotelStars")%></span><br><br>
                  <input class="button" type="submit"  value="Select" /><br>
                   
               </div>
                   
            </form>
               <% }%>
        
    </body>
</html>