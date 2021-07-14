<%-- 
    Document   : loginPage
    Created on : Dec 31, 2020, 11:42:55 PM
    Author     : Ayman
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login page</title>
        <style>
             body {
              background-image: url('h1.jpeg');
              background-repeat: no-repeat;
              background-size: cover;
            }
           
            .welc{position:relative; 
                     left:540px; 
                     top:35px;
                     color: white;
                     font-size:60px;
                font-family: Helvetica;
            }
            .mail{ 
                 position:relative; 
                 left:500px; 
                 top:60px;
                 border-radius: 25px; 
                 border: 2px ; 
                 padding: 25px; 
                 width: 20em 
            }
            .pass{ 
                  position:relative; 
                 left:500px; 
                 top:90px;
                 border-radius: 25px; 
                 border: 2px ; 
                 padding: 25px; 
                 width: 20em 
            }
             .button{
                    position:relative; 
                    left:250px; 
                    top:190px;
                    width: 13em;
                    border-radius:25px; 
                    border:2px ;
                    padding:21px;
                      color: whitesmoke;
                    background:burlywood;
                    
            }
             .error{
                
                  position:relative; 
                 left:561px; 
                 top:85px;
                color:red;
            }
        </style>
    </head>
    <body>
        <form action="validate2" method="post">
                <div class="welc">Welcome </div>
                <input class="mail" type="email" name="mail" placeholder="E-mail" required>
            <br><br>
            <input class="pass" type="Password" name="pass" placeholder="Password" required>
            
            <input class="button" type="submit" value="login">
            <p class="error">${error}</p>
            <c:remove var="error" scope="session" />
        </form>
    </body>
</html>
