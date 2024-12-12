package Controller;

import Model.Mail;
import Model.Validations;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

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
@WebServlet(name = "contact", urlPatterns = {"/contact"})
public class contact extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Gson gson = new Gson();
        JsonObject responseJson = new JsonObject();
        responseJson.addProperty("success", false);
        responseJson.addProperty("message", "");
        JsonObject jsonObject = JsonParser.parseReader(request.getReader()).getAsJsonObject();

        try {
            String name = jsonObject.get("name").getAsString();
            String email = jsonObject.get("email").getAsString();
            String mobile = jsonObject.get("mobile").getAsString();
            String message = jsonObject.get("message").getAsString();

            // Validations
            if (name.isEmpty()) {
                responseJson.addProperty("message", "Name cannot be empty");
            } else if (!name.matches("^[a-zA-Z\\s]+$")) {
                responseJson.addProperty("message", "Enter a valid name (letters and spaces only)");
            } else if (email.isEmpty()) {
                responseJson.addProperty("message", "E-mail cannot be empty");
            } else if (!Validations.isEmailValid(email)) {
                responseJson.addProperty("message", "Enter a valid e-mail");
            } else if (mobile.isEmpty()) {
                responseJson.addProperty("message", "Mobile number cannot be empty");
            } else if (!Validations.isMobileValid(mobile)) {
                responseJson.addProperty("message", "Enter a valid mobile number");
            } else if (message.isEmpty()) {
                responseJson.addProperty("message", "Message cannot be empty");
            } else {
                //send email
                String subject = "Customer Feedback";
                
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
                        + "<h2>Customer Feedback</h2>"
                        + "</div>"
                        + "<div class='invoice-details'>"
                        + "<p><strong>Name:</strong> "+name+"</p>"
                        + "<p><strong>Email:</strong> "+email+"</p>"
                        + "<p><strong>Mobile:</strong> "+mobile+"</p>"
                        + "<p><strong>Message:</strong> "+message+"</p>"
                        + "</div>"
                        + "<div class='footer'>"
                        + "<p>COPYRIGHT 2024 MOONBEAM LTD. ALL RIGHTS RESERVED.</p>"
                        + "</div>"
                        + "</div>"
                        + "</body>"
                        + "</html>";

                
                Mail.sendMail("sudheeradilum@gmail.com", subject, emailContent);

                responseJson.addProperty("success", true);
                responseJson.addProperty("message", "Feedback submitted successfully");
            }
        } catch (Exception e) {
            responseJson.addProperty("message", "An error occurred while processing your request: " + e.getMessage());
        }

        
        response.setContentType("application/json");
        response.getWriter().write(gson.toJson(responseJson));
    }
}