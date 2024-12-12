/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.ConnectionDB;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Dilum
 */
@WebServlet(name = "password_reset", urlPatterns = {"/password_reset"})
public class password_reset extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Gson gson = new Gson();
        JsonObject responseJson = new JsonObject();
        responseJson.addProperty("success", false);
        responseJson.addProperty("message", "");

        int verification = Integer.parseInt(request.getParameter("verification"));
        String password = request.getParameter("password");
        String repassword = request.getParameter("repassword");
        String email = request.getParameter("email");

        try {

            if (password.isEmpty()) {
                responseJson.addProperty("message", "Password cannot be empty");
            } else if (password.length() < 8) {
                responseJson.addProperty("message", "Password must have at least 8 characters");
            } else if (!password.matches(".*[A-Z].*")) {
                responseJson.addProperty("message", "Password must have at least one uppercase letter");
            } else if (!password.matches(".*[a-z].*")) {
                responseJson.addProperty("message", "Password must have at least one lowercase letter");
            } else if (!password.matches(".*\\d.*")) {
                responseJson.addProperty("message", "Password must have at least one number");
            } else if (!repassword.equals(password)) {
                responseJson.addProperty("message", "Password does not match");
            } else {
                ResultSet resultSet = ConnectionDB.execute("SELECT verification FROM user WHERE verification = '" + verification + "'");
                if (resultSet.next()) {
                    ConnectionDB.execute("UPDATE user SET password = '"+password+"' WHERE email = '"+email+"'");
                    responseJson.addProperty("success", true);
                    responseJson.addProperty("message", "Password changed successfully");
                }else{
                    responseJson.addProperty("message", "Invalid verification code");
                }
            }

            response.setContentType("application/json");
            response.getWriter().write(gson.toJson(responseJson));
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
