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
@WebServlet(urlPatterns = {"/checkIn"})
public class checkIn extends HttpServlet {

   
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
    
    String ID=request.getParameter("ID");
    PreparedStatement stat = conn.prepareStatement("update reservation set CheckIn=?"+"where  ReservationID="+ID);
    stat.setString(1,"true");
    stat.executeUpdate();  
    PreparedStatement statPayment = conn.prepareStatement("update reservation set Payment=?"+"where  ReservationID="+ID);
    statPayment.setString(1,"PaymentConfirmed");
    statPayment.executeUpdate(); 
    response.sendRedirect("CurrentPageReservation.jsp");
  
    }

catch(Exception e)
{
e.printStackTrace();
	
}
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
