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

<title>Update</title>
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
                padding: 10px; 
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
<td>Hotel Rating</td>
<td>Destination</td>
<td>Hotel ExpectedPrice</td>
<td>Including Meals</td>
<td>Hotel Stars</td>
<td>contact</td>
<td>gym</td>
<td>aquaPark</td>
<td>ID</td>
<td>location</td>
</tr>
<%

try{

    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/web?useSSL=false";
    Connection conn = DriverManager.getConnection(url, "root", "webproject");

    String Select="select * from hotels";
    Statement statment=conn.createStatement();
    ResultSet result=statment.executeQuery(Select);
    while(result.next()){
    	%>

    	<tr>
    	<td><%=result.getString("HotelName")%></td>
    	<td><%=result.getString("HotelRating")%></td>
    	<td><%=result.getString("Destination")%></td>
    	<td><%=result.getString("HotelExpectedPrice")%></td>
    	<td><%=result.getString("IncludingMeals")%></td>
    	<td><%=result.getString("HotelStars")%></td>
    	<td><%=result.getString("contact")%></td>
    	<td><%=result.getString("gym")%></td>
    	<td><%=result.getString("aquaPark")%></td>
    	<td><%=result.getString("id")%></td>
    	<td><%=result.getString("Location")%></td>
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
 <br><br>
    <form action= "contact" method="post">
       <strong style="color: white;"> Update contact </strong>
       <br><br>
     
     Enter ID   <input class="input" type="text" name="ID" required>
     Enter contact <input class="input" type="text" name="contact" required>
       <input class="button" type="submit" name="submit" value="Update">
    </form>
    
    <br><br>
     <form action= "gym" method="post" >
        <strong> update Hotel Facilites gym </strong>
            <br><br>
       Enter ID   <input class="input" type="text" name="ID1" required>      
       Enter gymOption   <input class="input" type="text" name="optiongym" required>
          <input class="button" type="submit" name="submit" value="Update">
    </form>
    <br><br>
      <form action= "aqua" method="post">
      
    <strong>update Hotel Facilites aquaPark </strong>
    <br><br>
       Enter ID   <input class="input" type="text" name="ID2" required>    
       Enter aquaParkOption <input class="input" type="text" name="optionaquaPark" required>
        <input class="button" type="submit" name="submit" value="Update">
    </form><br><br>
      <form action= "location" method="post">
    <strong>update Hotel location </strong>
    <br><br>
       Enter ID   <input type="text" class="input" name="ID3" required>    
       Enter location <input class="input" type="text" name="location" required>
        <input class="button" type="submit" name="submit" value="Update">
    </form>
    

</body>
</html>