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
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
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
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ayman
 */
@WebServlet(urlPatterns = {"/reserve"})
public class reserve extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String mail = request.getSession().getAttribute("mail").toString();
            String n = request.getSession().getAttribute("roomNum").toString();
            String id = request.getSession().getAttribute("roomID").toString();
            String p=null;
            String phone = request.getSession().getAttribute("phone").toString();
            String days = request.getParameter("days");
            String mailf = request.getParameter("mail");
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/web?useSSL=false";
            String user = "root";
            Connection connection = null;
            connection = (Connection) DriverManager.getConnection(url, user, "webproject");
            PreparedStatement select= (PreparedStatement) connection.prepareStatement("Select * from rooms where ID=?");
            select.setString(1,id);
            ResultSet res = select.executeQuery();
            if (res.next()) {
            p=res.getString("PricePerDay");
            
            }
            float price=Float.parseFloat(p);
            int daynum=Integer.parseInt(days);
            float total=price*daynum;
            PreparedStatement InsertStmt = (PreparedStatement) connection.prepareStatement("Insert into reservation(ClientMail,ReservationDate,CheckIn,CheckOut,RoomNumber,Payment,NoOfDays,phone) values(?,current_date(),0,0,?,'no',?,?);");
            InsertStmt.setString(1, mail);
            InsertStmt.setString(2, n);
            InsertStmt.setString(3, days);
            InsertStmt.setString(4, phone);
            InsertStmt.execute();
            PreparedStatement updateStmt = (PreparedStatement) connection.prepareStatement("UPDATE rooms \n"
                    + "SET Available = 'no'" + "\n"
                    + "WHERE id=?;");
            updateStmt.setString(1, id);
            updateStmt.executeUpdate();

            PreparedStatement selectStmt = (PreparedStatement) connection.prepareStatement("Select * from web.reservation order by ReservationID DESC LIMIT 1;");

            ResultSet RS = selectStmt.executeQuery();
            if (RS.next()) {
                
                String first = request.getSession().getAttribute("first").toString();
                String toEmail = request.getSession().getAttribute("mail").toString();
                String subject = "Reservation done successfuly";
                String message = "Welcome " + first + " to our Website your reservation done successfully,"+"your payment is" +total+" your reservation id is : " + RS.getString("ReservationID") +" Please keep it, you will need it if you want to cancel or change your reservation.\n Thanks for using our website.";
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
                } catch (MessagingException e) {
                    String error = "Something wrong try again later";
                    request.setAttribute("error", error);
                    request.getRequestDispatcher("userHome.jsp").forward(request, response);
                    e.printStackTrace();
                }

                String message2 = "Reservation done successfully, your reservation id is : " + RS.getString("ReservationID") + " Please keep it, you will need it if you want to cancel or change your reservation";
                request.getSession().setAttribute("message2", message2);
                response.sendRedirect("final.jsp");

            }

        } catch (ClassNotFoundException | SQLException theException) {

            theException.printStackTrace();

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
