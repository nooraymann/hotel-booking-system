<%-- 
    Document   : update
    Created on : Jan 14, 2021, 3:29:54 PM
    Author     : Ayman
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>update info</title>
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
                height: 60%;
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
             .confirm
            { 
                position: relative; 
                color:green;
            }
            </style>
    </head>
    <body>
        <%
        Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/web?useSSL=false";
             String mail = request.getSession().getAttribute("mail").toString();
            String first=null;
            String second=null;
            String pass=null;
            String phone=null;
            Connection conn = DriverManager.getConnection(url, "root", "webproject");
            PreparedStatement stat = conn.prepareStatement("SELECT * FROM signup where mail=?");
            stat.setString(1,mail);
            ResultSet result = stat.executeQuery();
           if (result.next())
            {
              first=result.getString("FirstName");
              second=result.getString("SecondName");
              pass=result.getString("password");
               phone=result.getString("phone");
            }
        
        
        %>
         
        <form class="center" action="Update" method="post">
             
            <h4>Update User Info</h4>
            <label>First Name :</label>
            <input type="text" name="firstname" class="input" placeholder="<%=first%>" required /><br><br>
            <label>second Name :</label>
            <input type="text" name="secondname"  class="input" placeholder="<%=second%>" required/><br><br>
            <label>Mail :</label>
            <input type="text" name="mail"  class="input" placeholder="<%=mail%>" required/><br><br>
            <label>Phone :</label>
             <input type="text" name="phone"  class="input" placeholder="<%=phone%>" required/><br><br>
            <label>Password :</label>
            <input type="password" name="password"  class="input"  placeholder="******" required/><br><br>
            <input type="submit" class="button" value="Update" />
            <button  class="button" onclick="window.location.href ='userHome.jsp'" > back </button>
            
        </form>
             <center><p class="confirm">${message}</p></center>
           <c:remove var="message" scope="session" /> 
    </body>
</html>
