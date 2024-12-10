/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.ConnectionDB;
import Model.Mail;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Dilum
 */
@WebServlet(name = "newsletter", urlPatterns = {"/newsletter"})
public class newsletter extends HttpServlet {

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String subject = "Thank You for Subscribing to Moonbeams Cinema Newsletter";
                String emailContent = "<!DOCTYPE html>" +
                        "<html>" +
                        "<head>" +
                        "<style>" +
                        "body { font-family: Arial, sans-serif; line-height: 1.6; background-color: #f9f9f9; padding: 20px; }" +
                        ".container { max-width: 600px; margin: 0 auto; background: #ffffff; border-radius: 8px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); padding: 20px; }" +
                        "h2 { color: #333333; font-size: 24px; text-align: center; }" +
                        "p { font-size: 16px; color: #555555; }" +
                        ".highlight { color: #007bff; font-weight: bold; }" +
                        "footer { font-size: 14px; text-align: center; margin-top: 20px; color: #888888; }" +
                        "</style>" +
                        "</head>" +
                        "<body>" +
                        "<div class='container'>" +
                        "<h2>Thank You for Subscribing to Moonbeams Cinema Newsletter</h2>" +
                        "<p><span class='highlight'>you'll be the first to know about our latest movie releases, exclusive events, special promotions, and much more. We aim to bring you the best cinematic experiences.</span></p>" +
                        "</div>" +
                        "</body>" +
                        "</html>";

                
                Mail.sendMail(email, subject, emailContent);
                
                
                
          ConnectionDB.execute("INSERT IGNORE INTO newsletter (email) VALUES ('"+email+"')");
        
        
        
        
    }

    

}
