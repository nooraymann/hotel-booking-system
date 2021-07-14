<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User home</title>
        <style>
            body{
                background-image: url('h1.jpeg');
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-size: cover;  
            }
            .center {
                background-color:#0009;
                text-align: center;
                width: 30%;
                height: 65%;
                margin: auto;
                padding: 50px;
                position: fixed;
                top: 25%;
                bottom: 35%;
                right: 25%;
                left: 25%;
                color:white;
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
                float: right;
                color: black;
                text-align: center;
                padding: 14px 16px;
                text-decoration: none;
                font-size: 17px;
                color:white;
            }
            .topnav a:hover {
                background-color: #ddd;
                color: black;
            }
            .topnav a.active {
                background-color: burlywood;
                color: white;
            }
            .button{
                width: 13em;
                border-radius:25px; 
                border:2px ;
                padding:15px;
                color: whitesmoke;
                background: burlywood;
                position:relative;
                left:30px; 
                top:15px;
            }
            .input
            {
                border-radius: 25px; 
                border: 2px ; 
                padding: 10px; 
                width: 10em 
            }
            .done{
                 position: relative; 
                color:green;
            }
        </style>
    </head>
    <body>
      
         <div class="topnav">
            <a class="active" href="logout.jsp">Logout</a>
            <a href="update.jsp">Update Information</a>
        </div>
       
        <form class="center" action="SearchHotel.jsp" method="post">
             <center><p class="done">${done}</p></center>
                   <c:remove var="done" scope="session" /> 
            <h4>Search for hotels</h4>
            <label>Destination        :</label>
            <input type="text" name="destination" value="" class="input" required /><br><br>
            <label>Check-in date      :</label>
            <input type="date" name="check_in" value="" class="input" required/><br><br>
            <label>Check-out date     :</label>
            <input type="date" name="check_out" value="" class="input" required/><br><br>
            <label>Number of adults   :</label>
            <input type="text" name="adults" value="" class="input" required/><br><br>
            <label> Number of children:</label>
            <input type="text" name="children" value="" class="input" required/><br><br>
            <input type="submit" class="button" value="Search" />
            
        </form>
    </body>
</html>