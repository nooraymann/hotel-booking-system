<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>

<head>
    <title>comments and ratings</title>
    <style>

 body{
                background-image: url('h1.jpeg');
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-size: cover;  

            }
    
    td{color: white;}
</style>
</head>
<body>

<table border="1">
<tr>
<td>User mail</td>
<td>Hotel Name</td>
<td>Rate</td>
 <td>Comment</td>
 
</tr>

<%
try{


Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/web?useSSL=false";
    Connection conn = DriverManager.getConnection(url, "root", "webproject");
Statement statement=conn.createStatement();
PreparedStatement pst = conn.prepareStatement("select * from ratings ");

ResultSet resultSet =  pst.executeQuery();
 

     while(resultSet.next()){%>
 
     <tr>
        <td><%=resultSet.getString("User")%></td>
        <td><%=resultSet.getString("HotelName")%></td>
        <td><%=resultSet.getString("Rate")%></td>
        <td><%=resultSet.getString("Comment")%></td>

    </tr>

<%
}





conn.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
   </table>
</body>
</html>