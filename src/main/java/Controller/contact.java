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
                
                String subject = "Feedback Form Submission";
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
                        "<h2>Feedback Form Submission</h2>" +
                        "<p><strong>Name:</strong> <span class='highlight'>" + name + "</span></p>" +
                        "<p><strong>Email:</strong> <span class='highlight'>" + email + "</span></p>" +
                        "<p><strong>Mobile:</strong> <span class='highlight'>" + mobile + "</span></p>" +
                        "<p><strong>Message:</strong> <span class='highlight'>" + message + "</span></p>" +
                        "</div>" +
                        "</body>" +
                        "</html>";

                
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