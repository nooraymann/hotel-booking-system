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
import java.sql.Statement;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ayman
 */
@WebServlet(urlPatterns = {"/cancel"})
public class cancel extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       try
{    
  
 Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/web?useSSL=false";
    Connection conn = DriverManager.getConnection(url, "root", "webproject");
  String ID=request.getParameter("ID2"); 
  String toEmail=null;
  PreparedStatement selectStmt = (PreparedStatement) conn.prepareStatement("Select * from web.reservation where ReservationID=?;");
selectStmt.setString(1, ID);
            ResultSet RS = selectStmt.executeQuery();
            if (RS.next()) {
            toEmail=RS.getString("ClientMail");
            
            }
  Statement st2=conn.createStatement();
  int i3=st2.executeUpdate("delete from reservation where ReservationID="+ID);
if(i3>0){
                String subject = "Cancellation done successfuly";
                String message = "Dear user your cancellation done successfully.\n Thanks for using our website.";
                String fromEmail = "nooraymanweb@gmail.com";
                String fromPass = "noorayman123";
                 try {
                    Properties prob = new Properties();
                    prob.setProperty("mail.smtp.host", "smtp.gmail.com");
                    prob.setProperty("mail.smtp.port", "587");
                    prob.setProperty("mail.smtp.auth", "true");
                    prob.setProperty("mail.smtp.starttls.enable", "true");
                    prob.put("mail.smtp.socketFactory.port", "587");
                    prob.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
                    Session ses = Session.getInstance(prob, new Authenticator() {
                        @Override
                        protected PasswordAuthentication getPasswordAuthentication() {
                            return new PasswordAuthentication(fromEmail, fromPass);
                        }
                    });
                    Message mailc = new MimeMessage(ses);
                    mailc.setFrom(new InternetAddress(fromEmail));
                    mailc.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
                    mailc.setSubject(subject);
                    mailc.setText(message);
                    Transport.send(mailc); //send the E-mail
                     response.sendRedirect("CurrentPageReservation.jsp");
                } catch (MessagingException e) {
                    String error = "Something wrong try again later";
                    request.setAttribute("error", error);
                    request.getRequestDispatcher("CurrentPageReservation.jsp").forward(request, response);
                    e.printStackTrace();
                }



}
  
  
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
