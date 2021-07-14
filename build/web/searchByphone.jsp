<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>
<title>Insert title here</title>

<style>
    body{
                background-image: url('h1.jpeg');
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-size: cover;  

            }
    
    td{color: white;
    font-family: Helvetica;}

 
    </style>
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
try{
Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/web?useSSL=false";
    Connection conn = DriverManager.getConnection(url, "root", "webproject");

String roll_no2=request.getParameter("roll_no2");
Statement statement2=conn.createStatement();
String sql2 ="select * from reservation where phone="+roll_no2;
ResultSet resultSet2 =  statement2.executeQuery(sql2);
   while(resultSet2.next()){%>


<tr>
        <td><%=resultSet2.getString("ReservationID")%></td>
        <td><%=resultSet2.getString("ClientMail")%></td>
        <td><%=resultSet2.getString("ReservationDate")%></td>
        <td><%=resultSet2.getString("RoomNumber")%></td>
        <td><%=resultSet2.getString("Payment")%></td>
         <td><%=resultSet2.getString("phone")%></td>
        <td><%=resultSet2.getString("CheckIn")%></td>
        <td><%=resultSet2.getString("CheckOut")%></td>
        </tr>


<%}

conn.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
   </table>
</body>
</html>