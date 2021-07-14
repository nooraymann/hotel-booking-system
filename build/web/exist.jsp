<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    try{
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/web?useSSL=false";

            Connection conn = DriverManager.getConnection(url, "root", "webproject");
            
            PreparedStatement ps = conn.prepareStatement("SELECT  * FROM signup WHERE " +
                    "mail = ? ");
            ps.setString(1,request.getParameter("mail"));
            ResultSet res = ps.executeQuery();
            if(res.next()){
                out.print("User already exists");
            }
             
              
        }catch (Exception e){
            System.out.println(e);  
        }
%>