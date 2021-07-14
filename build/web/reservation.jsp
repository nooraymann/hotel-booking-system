<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reservation</title>
        <style>
            .center{
                background-color: #0009;
                width: 40%;
                height: 30%;
                margin: auto;
                padding: 50px;
                position: fixed;
                top: 25%;
                bottom: 35%;
                right: 25%;
                left: 25%;
                color:white;
            }
            .button{
                    
                    width: 5em;
                    border-radius:25px; 
                    border:2px ;
                    padding:12px;
                    color: whitesmoke;
                    background:burlywood;
                     position:relative;
                left:85px; 
                top:5px;
            }
            .input
            {
                border-radius: 25px; 
                border: 2px ; 
                padding: 13px; 
                width: 15em ;
              
                position:relative;
                left:85px; 
                top:5px;
               
            }
            .days
            {
                
                position:relative;
                left:16px; 
                top:32px;
                font-size:20px ;
            }
              body{
                background-image: url('h1.jpeg');
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-size: cover;  
            }
        </style>
    </head>
    <body>
        <%
         String roomNum=request.getParameter("RoomNumber");
         HttpSession sess = request.getSession(true);
         sess.setAttribute("roomNum", roomNum);
         String roomID=request.getParameter("RoomID");
         sess.setAttribute("roomID", roomID);
        %>
        <form class="center" action="reserve" method="post">
          
            <label class="days">Enter the number of days:</label>
          <center>  <input class="input" type="text" name="days"  required /></center><br>
           
         <center><input class="button" type="submit" value="Done" /><center>

        </form>
        
    </body>
</html>