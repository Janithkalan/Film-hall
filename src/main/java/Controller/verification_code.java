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
import dto.GoogleUser_DTO;
import dto.User_DTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Dilum
 */
@WebServlet(name = "verification_code", urlPatterns = {"/verification_code"})
public class verification_code extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Gson gson = new Gson();
        JsonObject responseJson = new JsonObject();
        responseJson.addProperty("success", false);
        responseJson.addProperty("message", "");

        String email = request.getParameter("email");

        Random random = new Random();
        int verification_code = random.nextInt(1000000) + 1;

        try {

            if (Validations.isEmailValid(email)) {
                responseJson.addProperty("validStatus", true);
                ResultSet resultSet = ConnectionDB.execute("SELECT email FROM user WHERE email = '" + email + "'");
                if (resultSet.next()) {

                    ConnectionDB.execute("UPDATE user SET verification = '" + verification_code + "' WHERE email = '" + email + "'");
                    //send email
                    String subject = "Verification Code";
                    String emailContent = "<!DOCTYPE html>"
                            + "<html>"
                            + "<head>"
                            + "<style>"
                            + "body { font-family: Arial, sans-serif; background-color: #000000; color: #ffffff; padding: 20px; }"
                            + ".container { max-width: 600px; margin: 0 auto; background: #000000; border-radius: 8px; padding: 20px; }"
                            + ".header { text-align: center; }"
                            + ".header h1 { font-size: 24px; margin: 10px 0; }"
                            + ".highlight { color: #007bff; font-weight: bold; }"
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
                            + "<p>Here is your password verification code</p>"
                            + "</div>"
                            + "<div class='invoice-details'>"
                            + "<p><strong>Verification Code:</strong> <span class='highlight'>" + verification_code + "</span></p>"
                            + "</div>"
                            + "<div class='footer'>"
                            + "<p>COPYRIGHT 2024 MOONBEAM LTD. ALL RIGHTS RESERVED.</p>"
                            + "</div>"
                            + "</div>"
                            + "</body>"
                            + "</html>";

                    Mail.sendMail(email, subject, emailContent);
                    responseJson.addProperty("success", true);
                    responseJson.addProperty("message", "Verification code sent to your email");

                } else {
                    responseJson.addProperty("message", "User does not exist");
                }

            } else {

                responseJson.addProperty("message", "Enter Valid E-mail");

            }

            response.setContentType("application/json");
            response.getWriter().write(gson.toJson(responseJson));

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
