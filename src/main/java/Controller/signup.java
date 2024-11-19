/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.ConnectionDB;
import Model.Validations;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dto.User_DTO;
import java.io.IOException;
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
@WebServlet(name = "signup", urlPatterns = {"/signup"})
public class signup extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        JsonObject responseJson = new JsonObject();
        responseJson.addProperty("success", false);
        responseJson.addProperty("message", "");

        Gson gson = new Gson();
        User_DTO user_DTO = gson.fromJson(request.getReader(), User_DTO.class);

        if (user_DTO.getFirst_name().isEmpty()) {
            responseJson.addProperty("message", "Name cannot be empty");
        } else if (!user_DTO.getFirst_name().matches("^[a-zA-Z]+$")) {
            responseJson.addProperty("message", "Enter valid name");
        } else if (user_DTO.getLast_name().isEmpty()) {
            responseJson.addProperty("message", "Name cannot be empty");
        } else if (!user_DTO.getLast_name().matches("^[a-zA-Z]+$")) {
            responseJson.addProperty("message", "Enter valid name");
        } else if (user_DTO.getEmail().isEmpty()) {
            responseJson.addProperty("message", "Email cannot be empty");
        } else if (!Validations.isEmailValid(user_DTO.getEmail())) {
            responseJson.addProperty("message", "Enter valid E-mail");
        } else if (user_DTO.getNic().isEmpty()) {
            responseJson.addProperty("message", "NIC cannot be empty");
        } else if (!Validations.isValidNIC(user_DTO.getNic())) {
            responseJson.addProperty("message", "Enter valid NIC number");
        } else if (user_DTO.getMobile().isEmpty()) {
            responseJson.addProperty("message", "Mobile number cannot be empty");
        } else if (!Validations.isMobileValid(user_DTO.getMobile())) {
            responseJson.addProperty("message", "Enter valid mobile number");
        } else if (user_DTO.getPassword().isEmpty()) {
            responseJson.addProperty("message", "Password cannot be empty");
        } else if (user_DTO.getPassword().length() < 8) {
            responseJson.addProperty("message", "Password must have at least 8 characters");
        } else if (!user_DTO.getPassword().matches(".*[A-Z].*")) {
            responseJson.addProperty("message", "Password must have at least one uppercase letter");
        } else if (!user_DTO.getPassword().matches(".*[a-z].*")) {
            responseJson.addProperty("message", "Password must have at least one lowercase letter");
        } else if (!user_DTO.getPassword().matches(".*\\d.*")) {
            responseJson.addProperty("message", "Password must have at least one number");
        } else if (!user_DTO.getConf_password().equals(user_DTO.getPassword())) {
            responseJson.addProperty("message", "Password does not match");
        } else {
            ResultSet resultSet = ConnectionDB.execute("SELECT * FROM user WHERE email = '" + user_DTO.getEmail() + "'");
            try {
                if (resultSet.next()) {
                    responseJson.addProperty("message", "User already exists");
                } else {
                    try {

                        ConnectionDB.execute("INSERT INTO user VALUES "
                                + "('" + user_DTO.getFirst_name() + "','" + user_DTO.getLast_name() + "',"
                                + "'" + user_DTO.getEmail() + "','" + user_DTO.getMobile() + "','" + user_DTO.getNic() + "','" + user_DTO.getDob() + "',"
                                + "'" + user_DTO.getPassword() + "')");

                        responseJson.addProperty("success", true);
                    } catch (Exception e) {
                        e.printStackTrace();
                        responseJson.addProperty("message", "Failed. Try Again Later");
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
                responseJson.addProperty("message", "Failed. Try Again Later");
            }

        }

        response.setContentType("application/json");

        response.getWriter().write(gson.toJson(responseJson));

    }

}
