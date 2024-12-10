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
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Dilum
 */
@WebServlet(name = "coupon_code", urlPatterns = {"/coupon_code"})
public class coupon_code extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Gson gson = new Gson();
        JsonObject responseJson = new JsonObject();
        responseJson.addProperty("success", false);

        String code = request.getParameter("code");

        try {
            ResultSet resultSet = ConnectionDB.execute("SELECT * FROM coupon WHERE coupon = '" + code + "'");

            if (resultSet.next()) {

                if (code == resultSet.getString("coupon")) {
                    responseJson.addProperty("success", true);
                } else {

                    responseJson.addProperty("message", "Invalid coupon code");
                }

            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        response.setContentType("application/json");
        response.getWriter().write(gson.toJson(responseJson));

    }

}
