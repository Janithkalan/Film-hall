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
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Dilum
 */
@WebServlet(name = "remove_coupon", urlPatterns = {"/remove_coupon"})
public class remove_coupon extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Gson gson = new Gson();
        JsonObject responseJson = new JsonObject();
        responseJson.addProperty("success", false);
        
        String code = request.getParameter("code");
        try {
            ConnectionDB.execute("DELETE FROM coupon WHERE coupon='"+code+"'");
            responseJson.addProperty("success", true);
        } catch (Exception e) {
            e.printStackTrace();
        }
      
        
        response.setContentType("application/json");
        response.getWriter().write(gson.toJson(responseJson));
        
    }

    

}
