<%-- 
    Document   : newjspvalidate
    Created on : Dec 31, 2020, 6:22:43 PM
    Author     : Ayman
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Validate password</title>
        <style>
            body {
              background-image: url('h1.jpeg');
              background-repeat: no-repeat;
              background-size: cover;
            
            }
            .pass{ 
                  position:relative; 
                 left:570px; 
                 top:220px;
                 border-radius: 25px; 
                 border: 2px ; 
                 padding: 25px; 
                 width: 20em 
            }
            .button{
                    position:relative; 
                    left:314px; 
                    top:325px;
                    width: 13em;
                    border-radius:25px; 
                    border:2px ;
                    padding:21px;
                    color: whitesmoke;
                    background:burlywood;
                    
            }
            .sent{
                position:relative; 
                     left:370px; 
                     top:180px;
                     color:beige;
                     font-size:25px;
                font-family: Helvetica;
            }
            .error3{
                 position:relative; 
                     left:640px; 
                     top:340px;
                color:red;
            }
            </style>
    </head>
    <body>
        <form action="validate" method="post">
            <h3 class="sent">there is a message sent to your mail check it to know your password </h3>
            <input class="pass"  type="text" name="confirm_password" placeholder="Enter the password ">
            <input type="submit" class="button" value="validate">
             
        </form>
        <p class="error3">${error3}</p>
        <c:remove var="error3" scope="session" />
    </body>
</html>
