/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.ConnectionDB;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dto.Movie_DTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Dilum
 */
@WebServlet(name = "search", urlPatterns = {"/search"})
public class search extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Gson gson = new Gson();
        JsonObject responseObject = new JsonObject();
        responseObject.addProperty("success", false);
        ArrayList search_result_list = new ArrayList();

        String textResult = request.getParameter("textResult");

        try {
            ResultSet resultSet = ConnectionDB.execute("SELECT * FROM movies WHERE name LIKE '%" + textResult + "%'");
            if (resultSet.next()) {
                while (resultSet.next()) {
                    Movie_DTO movie_DTO = new Movie_DTO();

                    movie_DTO.setId(resultSet.getInt("idmovies"));
                    movie_DTO.setName(resultSet.getString("name"));

                    search_result_list.add(movie_DTO);
                    responseObject.add("movie_list", gson.toJsonTree(search_result_list));
                    responseObject.addProperty("success", true);
                }
            } else {
                responseObject.addProperty("success", false);
            }

        } catch (Exception e) {
            e.printStackTrace();
            responseObject.addProperty("success", false);
        }

        response.setContentType("application/json");
        response.getWriter().write(gson.toJson(responseObject));

    }

}
