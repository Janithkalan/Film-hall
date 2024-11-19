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
@WebServlet(name = "load_movies", urlPatterns = {"/load_movies"})
public class load_movies extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Gson gson = new Gson();
        JsonObject responseJson = new JsonObject();
        responseJson.addProperty("success", false);
        ArrayList movie_list = new ArrayList();
        ArrayList upcomming_movies_list = new ArrayList();
        
        try {
            ResultSet resultSet = ConnectionDB.execute("SELECT * FROM movies WHERE movies_status_id = '1' ");
            
            while (resultSet.next()){
                Movie_DTO movie_DTO = new Movie_DTO();
                
                movie_DTO.setId(resultSet.getInt("idmovies"));
                movie_DTO.setName(resultSet.getString("name"));
                movie_DTO.setGenre(resultSet.getString("genre"));
                movie_DTO.setRatings(resultSet.getString("ratings"));
                
                movie_list.add(movie_DTO);
            }
            
            ResultSet resultSet2 = ConnectionDB.execute("SELECT * FROM movies WHERE movies_status_id = '2' ");
            
            while (resultSet2.next()){
                Movie_DTO movie_DTO = new Movie_DTO();
                
                movie_DTO.setId(resultSet2.getInt("idmovies"));
                movie_DTO.setName(resultSet2.getString("name"));
                movie_DTO.setGenre(resultSet2.getString("genre"));
                movie_DTO.setRatings(resultSet2.getString("ratings"));
                
                upcomming_movies_list.add(movie_DTO);
            }
            
            responseJson.add("movie_list",gson.toJsonTree(movie_list));
            responseJson.add("upcomming_movies_list",gson.toJsonTree(upcomming_movies_list));
            responseJson.addProperty("success", true);
            
        } catch (Exception e) {
              e.printStackTrace();
        }
        
        response.setContentType("application/json");

        response.getWriter().write(gson.toJson(responseJson));
        
    }

    

}
