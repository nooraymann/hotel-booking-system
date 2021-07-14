/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ayman
 */
@WebServlet(urlPatterns = {"/roomNum"})
public class roomNum extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
 Class.forName("com.mysql.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/web?useSSL=false";
Connection conn = DriverManager.getConnection(url, "root", "webproject");
int ID=Integer.parseInt(request.getParameter("ID"));
String num=request.getParameter("RoomNum");
String updatesql="update rooms set RoomNumber=?"+"where ID="+ID;
PreparedStatement updatenum=conn.prepareStatement(updatesql);
updatenum.setString(1,num);
updatenum.executeUpdate();
response.sendRedirect("updateRoom.jsp");
}
catch(Exception e)
{
e.printStackTrace();
	
}
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
