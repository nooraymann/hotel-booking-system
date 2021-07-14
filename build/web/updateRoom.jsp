<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <head>
      <style>
     body{
                background-image: url('h1.jpeg');
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-size: cover;  
                color: white;

            }
    
    td{color: white;
    font-family: Helvetica;}
    .input
    {
         border-radius: 25px; 
                border: 2px ; 
                padding: 8px; 
                width: 10em 
               
        
    }
    .button{
                    
                    width: 5em;
                    border-radius:25px; 
                    border:2px ;
                    padding:12px;
                    color: whitesmoke;
                    background:burlywood;
                     
            }
    
   </style>
</head>
<body>
<table border="1">

<tr>
<td>Hotel Name</td>
<td>RoomNumber</td>
<td>RoomType</td>
<td>PricePerDay</td>
<td>ID</td>
<td>Available</td>

</tr>
<%

try{

Class.forName("com.mysql.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/web?useSSL=false";
Connection conn = DriverManager.getConnection(url, "root", "webproject");
    String Select="select * from rooms";
    Statement statment=conn.createStatement();
    ResultSet result=statment.executeQuery(Select);
    while(result.next()){
    	%>

    	<tr>
    	<td><%=result.getString("HotelName")%></td>
    	<td><%=result.getString("RoomNumber")%></td>
    	<td><%=result.getString("RoomType")%></td>
    	<td><%=result.getString("PricePerDay")%></td>
    	<td><%=result.getString("ID")%></td>
    	<td><%=result.getString("Available")%></td>
    	
    	</tr>

    	<%
    	}

	
}
catch(Exception e)
{
e.printStackTrace();
	
}
%>

 </table>

 <form action ="roomNum" method="post" >
 <br><br>
 Enter Room ID<input  class="input" type="number" name="ID" required>
 Enter Update Room number<input  class="input" type="text" name="RoomNum" required>
 <input class="button" type="submit" name="submit" value="update">
</form>
<br><br>
 <form action="type" method="post" >
 <br><br>
Enter Room ID <input  class="input" type="number" name="ID1" required>
 Enter Update Room Type <input  class="input" type="text" name="Roomtype" required>
  <input class="button" type="submit" name="submit" value="update">
</form>
<br><br>
 <form  action="price" method="post">
 <br><br>
 Enter Room ID<input  class="input" type="number" name="ID2" required>
 Enter Update Room Price <input  class="input" type="number" name="Roomprice" required>
  <input class="button" type="submit" name="submit" value="update">
</form>
<br><br>
<form  action="avail" method="post">
<br><br>
Enter Room ID<input class="input" type="number" name="ID3" required>
 Enter Update Room Available <input  class="input" type="text" name="avilible" required>
 <input  class="button" type="submit" name="submit" value="update">
</form>
</body>
</html>