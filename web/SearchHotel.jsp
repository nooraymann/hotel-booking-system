<%-- 
    Document   : Search
    Created on : Jan 6, 2021, 2:03:30 PM
    Author     : pc
--%>


<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page import= "java.sql.Blob"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search</title>
        <script src='https://kit.fontawesome.com/a076d05399.js'></script>
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
                height:350px;
                text-align: center;
                display :inline-block;
                position: relative;
                top: 70px;
                
            }
            .button{
                    
                    width: 10em;
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
            .topnav {
                background-color: #0009;
                overflow: hidden;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                    }


           .topnav a {
                float: left;
                color: white;
                text-align: center;
                padding: 14px 16px;
                text-decoration: none;
                font-size: 17px;
                    }
            .topnav a:hover {
                background-color: #ddd;
                color: black;
                  }
             .topnav a.active {
                background-color: burlywood;
                color: white;
                 
                  }
                  a.log{
                background-color: burlywood;
                color: white;
                 float: right;
                  }
            .btn{ background-color: Transparent;
            border: none;}
        </style>
    </head>
      <body>
        <div class="topnav">
          <a class="active" href="#home">Filter by</a>
          <a href="PriceFilter.jsp">Price</a>
          <a href="RatingFilter.jsp">User rating</a>
          <a href="StarsFilter.jsp">Hotel stars</a>
          <a href="MealsFilter.jsp">Meals</a>
          <a href="DistanceFilter.jsp">Distance from city center</a>
          <a class="log" href="logout.jsp">Logout</a>
           <a href="update.jsp">Update Information</a>
        </div>
        <%
            String destination = request.getParameter("destination");
            String check_in =request.getParameter("check_in");
            String check_out = request.getParameter("check_out");
            String adults = request.getParameter("adults");
            String children = request.getParameter("children");
            
            session.setAttribute("session.dest", destination);
            session.setAttribute("session.in", check_in);
            session.setAttribute("session.out", check_out);
            session.setAttribute("session.adult", adults);
            session.setAttribute("session.child", children);
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/web?useSSL=false";
            String user = "root";
            Connection connection = null;
            connection = (Connection) DriverManager.getConnection(url, user, "webproject");
            PreparedStatement checkStmt = (PreparedStatement) connection.prepareStatement("SELECT * FROM Hotels where Destination=? ;");
            checkStmt.setString(1,destination);

            ResultSet rs = checkStmt.executeQuery();
             
            while(rs.next()) {  %>
            
            <form class="Cards" action="SearchRooms.jsp">
              <div>
                  <input type="hidden" name="hotelName" value="<%=rs.getString("HotelName")%>"/><br>
                  <span class="text">Hotel name:<%=rs.getString("HotelName")%></span><br>
                  <span class="text">Rating:<%=rs.getString("HotelRating")%></span><br>
                  <span class="text">Destination:<%=rs.getString("Destination")%></span>
                   <a style="color:white;text-decoration: none;font-size: 25px;" href="<%=rs.getString("location")%>" title="location" class='fas fa-map-marker-alt'></a><br>
                  <span class="text">Price:<%=rs.getString("HotelExpectedPrice")%></span><br>
                  <span class="text">Included meals:<%=rs.getString("IncludingMeals")%></span><br>
                  <span class="text">Hotel stars:<%=rs.getString("HotelStars")%></span><br>
                  <span class="text">Hotel number:<%=rs.getString("contact")%></span><br>
                  <span class="text">Gym:<%=rs.getString("gym")%></span><br>
                  <span class="text">Aqua park:<%=rs.getString("aquaPark")%></span><br><br>

                  
                  <input class="button" type="submit"  value="Select" />
                  <button class="button" type="submit" formaction="RateHotel.jsp">Rate hotel</button>
                   <br><br>
                  <button class="button" type="submit" formaction="ViewPhotos.jsp">View photos</button><br><br>
                 
                  
               </div>
                   
          </form>
            
          
               <% }%>
      
    </body>
</html>