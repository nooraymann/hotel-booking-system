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

<title>Admin page</title>

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
    .form-control
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
            .buttonu{
                width: 15em;
                    border-radius:25px; 
                    border:2px ;
                    padding:12px;
                    color: whitesmoke;
                    background:burlywood;
            }
    
    li{list-style: none;}
</style>
</head>
<body>
<nav>
  <ul>
    <li>
    <form action="searchData.jsp"  >
       <input required type="email" name="roll_no1" class="form-control" placeholder="Search roll Email..">
       <input type="submit" class="button" name="save" value="search" ><br>
    </form>
     </li>
     <li>
     <form  action="searchByphone.jsp">
         <br>
     <input  required type="text" name="roll_no2" class="form-control" placeholder="Search roll phone..">
       <input class="button" type="submit" name="save" value="search">
       <br>
     </form>
     <li>
         <br>
      <form action="updatePage.jsp">
      <input class="buttonu" type="submit" value="Update hotels">
      </form>
    </li>
      <li>
          <br>
      <form action="updateRoom.jsp">
      <input  class="buttonu" type="submit" value="Update Rooms">
      </form>
    </li>
    <li>
    <form action="uploadimagee.html" method="post"  >
        <br>
       <input class="buttonu" type="submit" value="UploadeImage">
       <br>
    </form>
     </li>
     <li>
         <br>
    <form action="updateimage.html"  method="post">
       <input class="buttonu" type="submit" value="update image">
        <br>
    </form>
     </li>
     <li>
         <br>
    <form action="commentsAndRatings.jsp"  >
       <input class="buttonu" type="submit" value="View Rating and Commints">
       <br>
    </form>
     </li>
     
    </ul>
    
</nav>
<br><br>
 <table border="1">
 
 <tr>
 <td>ReservationID</td>
 <td>Client Mail</td>
 <td>Reservation Date</td>
 <td>Room Number</td>
 <td>Payment</td>
 <td>Phone</td>
 <td>CheckIn</td>
 <td>CheckOut</td>

 </tr>
<%

try{

    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/web?useSSL=false";
    Connection conn = DriverManager.getConnection(url, "root", "webproject");
    String Select="select * from reservation";
    Statement statment=conn.createStatement();
    ResultSet result=statment.executeQuery(Select);
%>
  
 <%
    while(result.next()){
    	%>
       
    	<tr>
    	<td><%=result.getString("ReservationID")%></td>
    	<td><%=result.getString("ClientMail")%></td>
    	<td><%=result.getString("ReservationDate")%></td>
    	<td><%=result.getString("RoomNumber")%></td>
    	<td><%=result.getString("Payment")%></td>
    	<td><%=result.getString("phone")%></td>
    	<td><%=result.getString("CheckIn")%></td>
    	<td><%=result.getString("CheckOut")%></td>
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
<form action="searchBydate.jsp">

    From  <input class="form-control" type="date" name="from" required>
    To  <input class="form-control" type="date" name="to" required>
<input class="button" type="submit" value="search">
</form>
 <br><br>
<form action="checkIn" method="post">


Enter ID of reservation  <input  class="form-control" type="number" name="ID">
<input class="button" type="submit" value="checkIn">
</form>
 <br><br>
 <form action="checkOut" method="post">


Enter ID of reservation  <input  class="form-control" type="number" name="ID1">
<input class="button" type="submit" value="checkOut">
</form>
<br><br>
<form action="cancel" method="post">

Enter ID of reservation  <input class="form-control" type="number" name="ID2">
<input class="button" type="submit" value="cancel">
</form>
</body>
</html>