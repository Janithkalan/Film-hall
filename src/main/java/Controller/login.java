package Controller;

import Model.ConnectionDB;
import Model.Validations;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import dto.User_DTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "login", urlPatterns = {"/login"})
public class login extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        JsonObject responseJson = new JsonObject();
        responseJson.addProperty("success", false);
        responseJson.addProperty("message", "");

        Gson gson = new Gson();
        User_DTO user_DTO = gson.fromJson(request.getReader(), User_DTO.class);
        //validations
        if (user_DTO.getEmail().isEmpty()) {
            responseJson.addProperty("message", "Email cannot be empty!");
        } else if (user_DTO.getPassword().isEmpty()) {
            responseJson.addProperty("message", "Password cannot be empty!");
        } else if (!Validations.isEmailValid(user_DTO.getEmail())) {
            responseJson.addProperty("message", "Enter Valid E-mail");
        } else {
            try {
                //check the user is exist
                ResultSet resultSet = ConnectionDB.execute("SELECT * FROM user WHERE email ='" + user_DTO.getEmail() + "' "
                        + "AND password = '" + user_DTO.getPassword() + "'");
                if (resultSet.next()) {
                    HttpSession session = request.getSession();
                    user_DTO.setPassword("");
                    user_DTO.setFirst_name(resultSet.getString("fname"));
                    user_DTO.setLast_name(resultSet.getString("lname"));
                    session.setAttribute("user", user_DTO);
                    responseJson.addProperty("success", true);
                } else {
                    responseJson.addProperty("message", "Invalid Email Or Password");
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
