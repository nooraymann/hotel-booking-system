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
@WebServlet(urlPatterns = {"/CancelReservation"})
public class CancelReservation extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        String toEmail = request.getSession().getAttribute("mail").toString();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/web?useSSL=false";
            Connection conn = DriverManager.getConnection(url, "root", "webproject");
            PreparedStatement st = conn.prepareStatement("SELECT * FROM reservation where ClientMail=? and ReservationID=?");
            st.setString(1, toEmail);
            st.setString(2, id);

            ResultSet result = st.executeQuery();
            if (result.next()) {

                String first = request.getSession().getAttribute("first").toString();
                String subject = "Your Cancellation is peding";
                String message = "Welcome " + first + " to our Website your cancellation is peding untill one of our admins confirms the cancellation ,we will send you an email soon to confirm your cancellation of reservation id " + id + " ,\n Thanks for using our application ";
                String fromEmail = "nooraymanweb@gmail.com";
                String fromPass = "noorayman123";
                String admin = null;
                try {

                    Connection co = DriverManager.getConnection(url, "root", "webproject");
                    PreparedStatement stat = co.prepareStatement("SELECT * FROM signup where role=?;");
                    stat.setString(1, "Admin");
                    ResultSet resulto = stat.executeQuery();
                    if (resulto.next()) {
                        admin = resulto.getString("mail");

                    }
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
                    Message mail = new MimeMessage(ses);
                    mail.setFrom(new InternetAddress(fromEmail));
                    mail.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
                    mail.setSubject(subject);
                    mail.setText(message);
                    Transport.send(mail); //send the E-mail

                    Message mail2 = new MimeMessage(ses);
                    mail2.setFrom(new InternetAddress(fromEmail));
                    mail2.setRecipient(Message.RecipientType.TO, new InternetAddress(admin));
                    mail2.setSubject("new Cancellaction request ");
                    mail2.setText("Hey Admin there is a client wants to cancel his reservation of id" + id + "please confirm it as soon as possible");
                    Transport.send(mail2); //send the E-mail

                    String done = "Cancellation done ";
                    request.setAttribute("done", done);
                    request.getRequestDispatcher("userHome.jsp").forward(request, response);
                } catch (MessagingException e) {
                    String error = "Something wrong try again later";
                    request.setAttribute("error", error);
                    request.getRequestDispatcher("final.jsp").forward(request, response);
                    e.printStackTrace();
                }
            } else {
                String error2 = "Enter corrct ID ,check the reservation id from mail";
                request.setAttribute("error2", error2);
                request.getRequestDispatcher("final.jsp").forward(request, response);
            }
        } catch (ClassNotFoundException | SQLException theException) {

            theException.printStackTrace();

        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
