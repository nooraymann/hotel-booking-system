<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Rating</title>
        <style>
            body{
                background-image: url('h1.jpeg');
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-size: cover;  
                color:white;

            }
            .center{
                background-color: #0009;

                text-align: center;
                width: 30%;
                height: 40%;
                margin: auto;
                padding: 50px;
                position: fixed;
                top: 25%;
                bottom: 45%;
                right: 25%;
                left: 25%;
               
                    
            }
            .message{
                
                text-align: center;
                color: white;
                width: 30%;
                height: 10%;
                position: fixed;
                top: 55%;
                left: 35%;
                font-size: 20px;
            }
            .button{
                    
                    width: 7em;
                    border-radius:25px; 
                    border:2px ;
                    padding:12px;
                    color: whitesmoke;
                    background: burlywood;
            }
            .text{
                   font-size: 20px;
                   margin: 20px;
                
            }
            .input{
                width: 20em;;
                height: 5em;
                border-radius: 25px;
            }
            .inputt{
                
         border-radius: 25px; 
                border: 2px ; 
                padding: 8px; 
                width: 10em 
            }
            
        </style>
        
    </head>
    <body>
        <%
            
            String hotelName = request.getParameter("hotelName");
            session.setAttribute("hotelName", hotelName);
         
        %>
        <form class="center" name="rating">
          
            <label>Enter the rate as (*) from 1 to 5 </label><br>
            <input class="inputt" type="text" name="rate" value="" required/><br><br>
            <label>Write comment </label><br>
            <input class="input" type="text" name="comment" value="" required/><br><br>

            <input class="button" type="button" value="Done" onclick="sendRate()" />
            
            <div class="message" id="show"></div>

        </form>
        <script>
            function sendRate()
            {
                var rate = document.forms["rating"]["rate"].value;
                var comment = document.forms["rating"]["comment"].value;
                var xmlhttp = new XMLHttpRequest();
                
                xmlhttp.open("Get","Ratings.jsp?rate="+rate+"&comment="+comment,true);
                xmlhttp.send();
                
                xmlhttp.onreadystatechange=function()
                {
                    if(xmlhttp.readyState===4 && xmlhttp.status===200)
                    {
                        document.getElementById("show").innerHTML = xmlhttp.responseText;
                    }
                };
            }
        </script>
        
    </body>
</html>