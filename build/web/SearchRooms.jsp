<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>search rooms</title>
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
                width:400px;
                height:210px;
                text-align: center;
                display :inline-block;
                position: fixed;
                top: 10%;
              
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
                   
                
            }
            
        </style>
    </head>
    <body>
        <%
            String check_in = session.getAttribute("session.in").toString();
            String check_out = session.getAttribute("session.out").toString();
            String adults = session.getAttribute("session.adult").toString();
            String children = session.getAttribute("session.child").toString();
            String hotelName = request.getParameter("hotelName");
            int adult = Integer.parseInt(adults);
            int child = Integer.parseInt(children);
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/web?useSSL=false";
            String user = "root";
            Connection connection = null;
            connection = (Connection) DriverManager.getConnection(url, user, "webproject");
            if(adult==1&&child==0)
            {
                PreparedStatement checkStmt = (PreparedStatement) connection.prepareStatement("SELECT * FROM rooms where RoomType='Single' and HotelName=? and Available='yes';");
                checkStmt.setString(1,hotelName);
                ResultSet rs = checkStmt.executeQuery();
                
                while(rs.next()) {  %>
                <form class="Cards" action="reservation.jsp" method="get">
                    <div >
                        <input type="hidden" name="RoomNumber" value="<%=rs.getString("RoomNumber")%>"/><br>
                        
                        <input type="hidden" name="RoomID" value="<%=rs.getString("ID")%>"/><br>
                       
                        <span class="text">Hotel name:<%=rs.getString("HotelName")%></span><br>
                        <span  class="text">Room number:<%=rs.getString("RoomNumber")%></span><br>
                         <span class="text">Room type:<%=rs.getString("RoomType")%></span><br>
                         <span class="text">Available from:<%=rs.getString("AvailableFrom")%></span><br>
                         <span class="text">To:<%=rs.getString("AvailableTo")%></span><br>
                         <span class="text">Price per day:<%=rs.getString("PricePerDay")%></span><br><br>
                         <input class="button" type="submit"  value="Select" />
                     </div>
                          </form>
            
               <% }
            }
            else if(adult>0&&child==0)
            {
                PreparedStatement checkStmt = (PreparedStatement) connection.prepareStatement("SELECT * FROM rooms where (RoomType='Double' or RoomType='Single') and HotelName=? and Available='yes' ;");
                checkStmt.setString(1,hotelName);
                ResultSet rs = checkStmt.executeQuery();
                
                while(rs.next()) {  %>
                <form class="Cards" action="reservation.jsp">
                    <div >
                        <input type="hidden" name="RoomNumber" value="<%=rs.getString("RoomNumber")%>"/><br>
                        <input type="hidden" name="RoomID" value="<%=rs.getString("ID")%>"/><br>
                        <span class="text">Hotel name:<%=rs.getString("HotelName")%></span><br>
                        <span class="text">Room number:<%=rs.getString("RoomNumber")%></span><br>
                         <span class="text">Room type:<%=rs.getString("RoomType")%></span><br>
                         <span class="text">Available from:<%=rs.getString("AvailableFrom")%></span><br>
                         <span class="text">To:<%=rs.getString("AvailableTo")%></span><br>
                          <span class="text">Price per day:<%=rs.getString("PricePerDay")%></span><br><br>
                         <input class="button" type="submit"  value="Select" />
                     </div>
             </form>
               <% }
            }
            else if((adult==2&&child>0)||(adult==1&&child>0))
            {
                PreparedStatement checkStmt = (PreparedStatement) connection.prepareStatement("SELECT * FROM rooms where (RoomType='Family' or RoomType='Single') and HotelName=? and Available='yes';");
                checkStmt.setString(1,hotelName);
                ResultSet rs = checkStmt.executeQuery();
                
                while(rs.next()) {  %>
                <form class="Cards" action="reservation.jsp">
                    <div >
                        <input type="hidden" name="RoomNumber" value="<%=rs.getString("RoomNumber")%>"/><br>
                        <input type="hidden" name="RoomID" value="<%=rs.getString("ID")%>"/><br>
                        
                        <span class="text">Hotel name:<%=rs.getString("HotelName")%></span><br>
                        <span class="text">Room number:<%=rs.getString("RoomNumber")%></span><br>
                        <span class="text">Room type:<%=rs.getString("RoomType")%></span><br>
                         <span class="text">Price per day:<%=rs.getString("PricePerDay")%></span><br><br>
                        <input class="button" type="submit"  value="Select" />
                     </div>
                </form>
               <% }
            }%>
           
    
        
        
       
    </body>
</html>