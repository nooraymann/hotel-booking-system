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
@WebServlet(urlPatterns = {"/validate2"})
public class validate2 extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
  

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/web?useSSL=false";
           String mail = request.getParameter("mail"); //get the mail from the from 
           String pass = request.getParameter("pass");// """" password"""""
            Connection conn = DriverManager.getConnection(url, "root", "webproject");
            PreparedStatement stat = conn.prepareStatement("SELECT * FROM signup where mail=? and password=?;");
            stat.setString(1,mail );
            stat.setString(2,pass );
            ResultSet result = stat.executeQuery();
            if (result.next()) {
                HttpSession session = request.getSession(true); //set the sessions for the id if the username and password is exist in the database
                session.setAttribute("mail", mail);
                session.setAttribute("id", result.getInt("ID"));
                session.setAttribute("first", result.getString("FirstName"));
                session.setAttribute("second", result.getString("SecondName"));
                session.setAttribute("phone", result.getString("phone"));
                session.setAttribute("password", result.getString("password"));
                String role = result.getString("role");
                
                if(role.equals("Admin")){
                response.sendRedirect("CurrentPageReservation.jsp");
                }
                else if(role.equals("User")){
                    response.sendRedirect("userHome.jsp");
                }
               

            } else {
                String error = "Wrong username or password ";

                        request.setAttribute("error", error);
                        request.getRequestDispatcher("loginPage.jsp").forward(request, response);
            }

        } catch (ClassNotFoundException | SQLException theException) {

            System.err.println(theException);

        }
       
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
