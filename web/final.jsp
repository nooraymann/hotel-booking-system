<%-- 
    Document   : final
    Created on : Jan 14, 2021, 10:45:26 PM
    Author     : Ayman
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hotel Reservation</title>
        <style>
             body{
                background-image: url('h1.jpeg');
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-size: cover;  
            }
            .confirm{
                position: relative; 
                color:green;
                font-size: 20px;
                position:relative;
                left:15px; 
                top:56px;
            }
            .cancel{
                color: white;
                position:relative;
                left:85px; 
                top:0px;
                font-size:20px ;
                
               
                
            }
            .input
            {
                border-radius: 25px; 
                border: 2px ; 
                padding: 13px; 
                width: 15em ;
                position:relative;
                left:85px; 
                top:13px;
               
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
                top:13px;
            }
            .button2{
                    
                    width: 5em;
                    border-radius:25px; 
                    border:2px ;
                    padding:12px;
                    color: whitesmoke;
                    background:burlywood;
                     position:relative;
                left:95px; 
                top:0px;
            }
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
            .error{
                position: relative; 
                color:red;
                font-size: 20px;
                position:relative;
                left:15px; 
                top:56px;
            }
        </style>
    </head>
    <body>
                    <center><p class="confirm">${message2}</p></center>
                   <c:remove var="message2" scope="session" /> 
                   <center><p class="error">${error2}</p></center>
                   <c:remove var="error2" scope="session" /> 
                   
         <form class="center" action="CancelReservation" method="post">
           
          
            <label class="cancel">Enter ID to cancel</label><br>
            <input class="input" name="id" palceholder="Enter the id of the reservation" required>
            <input class="button" type="submit" value="Cancel" /><br><br><br>
            <label class="cancel">Or Click change to change your reservation</label>
           <button class="button2" type="submit" formaction="ChangeReservation.jsp">Change</button>
            
        </form>

                   
    </body>
</html>
