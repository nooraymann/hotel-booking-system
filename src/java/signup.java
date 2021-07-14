/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import static java.lang.System.out;
import java.net.HttpURLConnection;
import java.net.URL;
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
import java.util.Properties;
import java.util.Random;
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
import javax.servlet.http.HttpSession;
import org.json.JSONObject;



/**
 *
 * @author Ayman
 */
@WebServlet(urlPatterns = {"/signup"})
public class signup extends HttpServlet {
private boolean isCaptchaValid(String secretKey, String response) {
        try {
        String url = "https://www.google.com/recaptcha/api/siteverify",
                params = "secret=" + secretKey + "&response=" + response;

        HttpURLConnection http = (HttpURLConnection) new URL(url).openConnection();
        http.setDoOutput(true);
        http.setRequestMethod("POST");
        http.setRequestProperty("Content-Type",
                "application/x-www-form-urlencoded; charset=UTF-8");
            try (OutputStream out = http.getOutputStream()) {
                out.write(params.getBytes("UTF-8"));
                out.flush();
            }

            JSONObject json;
            try (InputStream result = http.getInputStream()) {
                BufferedReader buffer = new BufferedReader(new InputStreamReader(result, "UTF-8"));
                StringBuilder string_builder = new StringBuilder();
                int cp;
                while ((cp = buffer.read()) != -1) {
                    string_builder.append((char) cp);
                }       json = new JSONObject(string_builder.toString());
            }

        return json.getBoolean("success");
    } catch (Exception e) {
        e.printStackTrace();
    }
    return false;
}
    
    

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

   
    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if(isCaptchaValid("6LeAdRoaAAAAAH1bZRNubWQyjqhjeNHEs6-CzpR_", request.getParameter("g-recaptcha-response"))){
            try {
                String toEmail=request.getParameter("mail");
                Class.forName("com.mysql.jdbc.Driver");
            
        String url = "jdbc:mysql://localhost:3306/web?useSSL=false";

            Connection conn = DriverManager.getConnection(url, "root", "webproject");
            
            PreparedStatement ps = conn.prepareStatement("SELECT  * FROM signup WHERE " +
                    "mail = ?");
            ps.setString(1,toEmail);
            ResultSet res = ps.executeQuery();
            if(res.first()){
                String error3 = "This email is taken ";

                        request.setAttribute("error3", error3);
                        request.getRequestDispatcher("signupPage.jsp").forward(request, response);
        
            }else{
  
     String subject="Your password";
     Random rand=new Random();
     int number=rand.nextInt(999999);
     String pass=String.format("%06d", number);
     HttpSession session = request.getSession(true); //set the sessions for the password to validate it later
     String first=request.getParameter("first");
     String second=request.getParameter("second");
     String phone=request.getParameter("phone");
     String role=request.getParameter("role");
     session.setAttribute("randPass",pass);
     session.setAttribute("firstname",first);
     session.setAttribute("second",second );
     session.setAttribute("mail",toEmail);
     session.setAttribute("phone",phone);
     session.setAttribute("role",role );
     String message="welcome "+first+" to our website your password is "+pass;
     String fromEmail="nooraymanweb@gmail.com";
     String fromPass="noorayman123";
     try{
         
     Properties prob=new Properties();
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
      response.sendRedirect("validate.jsp");
     }
     catch(MessagingException e){
        String error = "Something wrong try again later";
                        request.setAttribute("error", error);
                        request.getRequestDispatcher("signupPage.jsp").forward(request, response);
         e.printStackTrace();
     }
                
            }
            
            }
            catch (ClassNotFoundException | SQLException theException) {

            System.err.println(theException);

        }
    
    }
        else{
        String error2 = "you missed the captcha";

                        request.setAttribute("error2", error2);
                        request.getRequestDispatcher("signupPage.jsp").forward(request, response);
        
        }
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }

    

}
