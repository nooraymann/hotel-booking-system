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
@WebServlet(urlPatterns = {"/insertimges"})
public class insertimges extends HttpServlet {

   

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      try
{    
	
	String hotalname=request.getParameter("hotelname");
	
	String img=request.getParameter("image");

       Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/web?useSSL=false";
    Connection conn = DriverManager.getConnection(url, "root", "webproject");
	    PreparedStatement pstmt = null; 
	    pstmt = conn.prepareStatement("insert into photos (HotelName,HotelImage) " + "values(?,?)");
	    pstmt.setString(1, hotalname);   
	    pstmt.setString(2,img);
	    int count = pstmt.executeUpdate();
	    if(count>0)
	    {
                response.sendRedirect("CurrentPageReservation.jsp");
	    
	    }
	    else
	    {
	    System.out.println("not successfully");
	    }
	   
	  
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
