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
@WebServlet(urlPatterns = {"/price"})
public class price extends HttpServlet {

  
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
		int ID=Integer.parseInt(request.getParameter("ID2"));
	String price=request.getParameter("Roomprice");
	String updatesql="update rooms set PricePerDay=?"+"where ID="+ID;
	PreparedStatement updatePrice=conn.prepareStatement(updatesql);

	updatePrice.setString(1,price);
	updatePrice.executeUpdate();
response.sendRedirect("updateRoom.jsp");
	
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
