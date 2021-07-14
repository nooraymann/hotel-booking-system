
    <%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>
       
<!DOCTYPE html>


<html>
<head>

<title>search by date</title>

  
</head>
<body>


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
try
{    
    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/web?useSSL=false";
    Connection conn = DriverManager.getConnection(url, "root", "webproject");
    PreparedStatement statement = null;
    ResultSet resultSet = null;
 
String from =request.getParameter("from");
String to =request.getParameter("to");
PreparedStatement pst = conn.prepareStatement("select * from reservation where ReservationDate>=? and ReservationDate<=?");
pst.setString(1, from);
pst.setString(2, to);
ResultSet ResultFilter=pst.executeQuery();
while(ResultFilter.next()){
%>
	<tr>
    	<td><%=ResultFilter.getString("ReservationID")%></td>
    	<td><%=ResultFilter.getString("ClientMail")%></td>
    	<td><%=ResultFilter.getString("ReservationDate")%></td>
    	<td><%=ResultFilter.getString("RoomNumber")%></td>
    	<td><%=ResultFilter.getString("Payment")%></td>
    	<td><%=ResultFilter.getString("Phone")%></td>
    	<td><%=ResultFilter.getString("CheckIn")%></td>
    	<td><%=ResultFilter.getString("CheckOut")%></td>
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
</body>
</html>