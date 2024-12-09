/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.ConnectionDB;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dto.Movie_DTO;
import dto.TimeTable_DTO;
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
@WebServlet(name = "comming_soon", urlPatterns = {"/comming_soon"})
public class comming_soon extends HttpServlet {

    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Gson gson = new Gson();
        JsonObject responseJson = new JsonObject();
        responseJson.addProperty("success", false);
        ArrayList comingSoonDetails = new ArrayList();

       
        try {
            ResultSet resultSet = ConnectionDB.execute("SELECT * FROM movies WHERE movies_status_id = '2' ");
            while (resultSet.next()) {
                Movie_DTO movie_DTO = new Movie_DTO();
                movie_DTO.setId(resultSet.getInt("idmovies"));
                movie_DTO.setName(resultSet.getString("name"));
                movie_DTO.setMovie_description(resultSet.getString("movie_description"));
                movie_DTO.setRatings(resultSet.getString("ratings"));
                movie_DTO.setTrailer_link(resultSet.getString("trailer_link"));
                movie_DTO.setMovie_story(resultSet.getString("movie_story"));

                comingSoonDetails.add(movie_DTO);
            }

            responseJson.add("comingSoonDetails", gson.toJsonTree(comingSoonDetails));
            responseJson.addProperty("success", true);

        } catch (Exception e) {
            e.printStackTrace();
        }

        response.setContentType("application/json");
        response.getWriter().write(gson.toJson(responseJson));

    }

}