<%-- 
    Document   : ChangeReservation
    Created on : Jan 14, 2021, 8:02:34 PM
    Author     : pc
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>change reservation</title>
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
                
          
         border-radius: 25px; 
                border: 2px ; 
                padding: 10px; 
                width: 10em 
            }
            
        </style>
        
    </head>
    <body>
        <form class="center" name="changing">
          
            <label>Enter your reservation id to change:</label><br><br>
            <input class="input" type="text" name="id" value="" required/><br><br>

            <input class="button" type="button" value="Done" onclick="sendId()" />
            
            <div class="message" id="show"></div>

        </form>
        <script>
            function sendId()
            {
                var id = document.forms["changing"]["id"].value;
                var xmlhttp = new XMLHttpRequest();
                
                xmlhttp.open("Get","Changing.jsp?id="+id,true);
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