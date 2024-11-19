/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
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

        if (jsonObject.get("name").getAsString().isEmpty()) {
            responseJson.addProperty("message", "Name cannot be empty");
        } else if (!jsonObject.get("name").getAsString().matches("^[a-zA-Z]+$")) {
            responseJson.addProperty("message", "Enter valid name");
        } else if (jsonObject.get("email").getAsString().isEmpty()) {
            responseJson.addProperty("message", "E-mail cannot be empty");
        } else if (!Validations.isEmailValid(jsonObject.get("email").getAsString())) {
            responseJson.addProperty("message", "Enter valid e-mail");
        } else if (jsonObject.get("mobile").getAsString().isEmpty()) {
            responseJson.addProperty("message", "Mobile number cannot be empty");
        } else if (!Validations.isMobileValid(jsonObject.get("mobile").getAsString())) {
            responseJson.addProperty("message", "Enter valid mobile number");
        } else if (jsonObject.get("message").getAsString().isEmpty()) {
            responseJson.addProperty("message", "Message cannot be empty");
        } else {
            String name = jsonObject.get("name").getAsString();
            String email = jsonObject.get("email").getAsString();
            String mobile = jsonObject.get("mobile").getAsString();
            String message = jsonObject.get("message").getAsString();

            Mail.sendMail("sudheeradilum@gmail.com", "Feedback us form", "Email Sent Successfully" + name + "/" + email + "/" + mobile + "/" + message);
            responseJson.addProperty("success", true);
        }

        response.setContentType("application/json");

        response.getWriter().write(gson.toJson(responseJson));
    }

}
