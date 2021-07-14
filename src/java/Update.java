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
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ayman
 */
@WebServlet(urlPatterns = {"/Update"})
public class Update extends HttpServlet {

   
    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String first=request.getParameter("firstname");
        String second=request.getParameter("secondname");
        String mail=request.getParameter("mail");
        String pass=request.getParameter("password");
        String phone=request.getParameter("phone");
        
        String id = request.getSession().getAttribute("id").toString();
        int idd=Integer.parseInt(id);
        try{
         Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/web?useSSL=false";
            Connection conn = DriverManager.getConnection(url, "root", "webproject");
            PreparedStatement stat = conn.prepareStatement("UPDATE signup SET FirstName = ?, SecondName=?, mail=?, password=? ,phone=? where ID=?");
            stat.setString(1,first);
            stat.setString(2,second);
            stat.setString(3,mail);
            stat.setString(4,pass);
            stat.setString(5,phone);
            stat.setInt(6,idd);
            stat.executeUpdate();
             HttpSession session = request.getSession(true);
             session.setAttribute("mail", mail);
             session.setAttribute("first", first);
             session.setAttribute("second", second);
             session.setAttribute("phone", phone);
             session.setAttribute("password", pass);
            String message = " update done successfully";
            request.setAttribute("message", message);
            request.getRequestDispatcher("update.jsp").forward(request, response);
            
        }
        catch (ClassNotFoundException | SQLException theException) {

            theException.printStackTrace();

        }
       
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
