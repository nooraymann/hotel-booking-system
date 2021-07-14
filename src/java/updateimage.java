/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(urlPatterns = {"/updateimage"})
public class updateimage extends HttpServlet {

  

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       try
{


    String img=request.getParameter("image");
    String ID=request.getParameter("ID");
 
      
       Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/web?useSSL=false";
    Connection conn = DriverManager.getConnection(url, "root", "webproject");
        PreparedStatement pstmt = null; 
        pstmt = conn.prepareStatement("update photos set HotelImage=? where id="+ID);

        pstmt.setString(1,img);
        int count = pstmt.executeUpdate();
        if(count>0)
        {
        response.sendRedirect("CurrentPageReservation.jsp");
        }
        else
        {
        System.out.println("update successfully");
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
