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
@WebServlet(urlPatterns = {"/contact"})
public class contact extends HttpServlet {


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

String Contact=request.getParameter("contact");

String updatesql="update hotels set contact=?"+" where id="+ID;
PreparedStatement updateContact=conn.prepareStatement(updatesql);
updateContact.setString(1,Contact);
int i =  updateContact.executeUpdate();
if(i > 0)
{
response.sendRedirect("updatePage.jsp");
}
else
{
out.print("There is a problem in updating Record.");
}
}
catch(Exception e)
{

    out.println(e);
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
