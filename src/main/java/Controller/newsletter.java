/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.ConnectionDB;
import Model.Mail;
import Model.Validations;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
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

        Gson gson = new Gson();
        JsonObject responseJson = new JsonObject();
        responseJson.addProperty("success", false);
        

        try {
            String email = request.getParameter("email");

            if (Validations.isEmailValid(email)) {
                String subject = "Thank You for Subscribing to Moonbeams Cinema Newsletter";

                String emailContent = "<!DOCTYPE html>"
                        + "<html>"
                        + "<head>"
                        + "<style>"
                        + "body { font-family: Arial, sans-serif; background-color: #000000; color: #ffffff; padding: 20px; }"
                        + ".container { max-width: 600px; margin: 0 auto; background: #000000; border-radius: 8px; padding: 20px; }"
                        + ".header { text-align: center; }"
                        + ".header h1 { font-size: 24px; margin: 10px 0; }"
                        + ".content { background: #151515; padding: 20px; border-radius: 8px; margin-top: 20px; }"
                        + ".content h2 { color: #ffffff; font-size: 20px; text-align: center; }"
                        + ".content p { font-size: 16px; color: #bbbbbb; text-align: center; }"
                        + ".invoice-details { margin-top: 20px; }"
                        + ".invoice-details p { font-size: 16px; color: #ffffff; }"
                        + ".offers { text-align: center; margin-top: 20px; }"
                        + ".offers img { width: 100%; border-radius: 8px; }"
                        + ".footer { font-size: 14px; text-align: center; margin-top: 20px; color: #888888; }"
                        + "</style>"
                        + "</head>"
                        + "<body>"
                        + "<div class='container'>"
                        + "<div class='header'>"
                        + "<h1>MOONBEAMS CINEMA</h1>"
                        + "</div>"
                        + "<div class='content'>"
                        + "<h2>Thank You for Subscribing to Moonbeams Cinema Newsletter</h2>"
                        + "<p><strong>You'll be the first to know about our latest movie releases, exclusive events, special promotions, and much more. We aim to bring you the best cinematic experiences.</strong></p>"
                        + "</div>"
                        + "<div class='footer'>"
                        + "<p>COPYRIGHT 2024 MOONBEAM LTD. ALL RIGHTS RESERVED.</p>"
                        + "</div>"
                        + "</div>"
                        + "</body>"
                        + "</html>";

                Mail.sendMail(email, subject, emailContent);

                ConnectionDB.execute("INSERT IGNORE INTO newsletter (email) VALUES ('" + email + "')");
                responseJson.addProperty("success", true);
            } else {
            
                responseJson.addProperty("message", "Invalid E-mail");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        
        response.setContentType("application/json");
        response.getWriter().write(gson.toJson(responseJson));

    }

}
