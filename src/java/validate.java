/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/validate"})
public class validate extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String password = request.getSession().getAttribute("randPass").toString();
        String role = request.getSession().getAttribute("role").toString();
        String check_pass = request.getParameter("confirm_password");
        String second = request.getSession().getAttribute("second").toString();
        String mail = request.getSession().getAttribute("mail").toString();
        String phone = request.getSession().getAttribute("phone").toString();
        
        String first = request.getSession().getAttribute("firstname").toString();
        try {
        Class.forName("com.mysql.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/web?useSSL=false";
                Connection conn = DriverManager.getConnection(url, "root", "webproject");
        if (password.equals(check_pass) && role.equals("Admin")) {
            
                
                String query = "INSERT INTO `signup`(`FirstName`,`SecondName`,`role`,`mail`,`password`,`phone`) VALUES (?,?,?,?,?,?);";
                PreparedStatement stat = conn.prepareStatement(query);
                stat.setString(1, first);
                stat.setString(2, second);
                stat.setString(3, role);
                stat.setString(4, mail);
                stat.setString(5, password);
                stat.setString(6, phone);
                stat.execute();

            
            response.sendRedirect("CurrentPageReservation.jsp");
        } else if (password.equals(check_pass) && role.equals("User")) {
            
                String query = "INSERT INTO `signup`(`FirstName`,`SecondName`,`role`,`mail`,`password`,`phone`) VALUES (?,?,?,?,?,?);";
                PreparedStatement stat = conn.prepareStatement(query);
                stat.setString(1, first);
                stat.setString(2, second);
                stat.setString(3, role);
                stat.setString(4, mail);
                stat.setString(5, password);
                stat.setString(6, phone);
                stat.execute();
                
                PreparedStatement st = conn.prepareStatement("SELECT * FROM signup where mail=?");
                st.setString(1,mail );
            
                ResultSet result = st.executeQuery();
            if (result.next()) {
                HttpSession session = request.getSession(true); //set the sessions for the id 
                session.setAttribute("id", result.getInt("ID"));
                session.setAttribute("first", result.getString("FirstName"));
                session.setAttribute("second", result.getString("SecondName"));
                session.setAttribute("phone", result.getString("phone"));
                session.setAttribute("password", result.getString("password"));
                
                }
            response.sendRedirect("userHome.jsp");
        } else {
            String error3 = "Wrong password try again";
            request.setAttribute("error3", error3);
            request.getRequestDispatcher("validate.jsp").forward(request, response);
        }
        } catch (ClassNotFoundException | SQLException theException) {

                theException.printStackTrace();

            }
    }   

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
