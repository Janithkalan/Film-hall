/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.ConnectionDB;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
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
@WebServlet(name = "button_load", urlPatterns = {"/button_load"})
public class button_load extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Gson gson = new Gson();
        JsonObject responseJson = new JsonObject();
        responseJson.addProperty("success", false);
        ArrayList timeTableDetails = new ArrayList();
        
        String movie_id = request.getParameter("movie_id");
        String day_id = request.getParameter("day_id");

        try {

            ResultSet resultSet = ConnectionDB.execute(""
                    + "SELECT movies.idmovies, movies.name, screen_times.show_time, time_table.month_table_id, hall_table.hall_name, hall_table.id "
                    + "FROM time_table "
                    + "INNER JOIN movies ON movies.idmovies = time_table.movies_idmovies "
                    + "INNER JOIN screen_times ON time_table.screen_times_id = screen_times.id "
                    + "INNER JOIN hall_table ON time_table.hall_table_id = hall_table.id "
                    + "WHERE time_table.month_table_id = "+day_id+" AND movies.idmovies = "+movie_id+"");

            while (resultSet.next()) {

                TimeTable_DTO timeTable_DTO = new TimeTable_DTO();
                timeTable_DTO.setShow_time(resultSet.getString("screen_times.show_time"));
                timeTable_DTO.setHall_name(resultSet.getString("hall_table.hall_name"));
                timeTable_DTO.setHall_id(resultSet.getInt("hall_table.id"));
                
                timeTableDetails.add(timeTable_DTO);
                
                

            }
            responseJson.add("timeTableDetails", gson.toJsonTree(timeTableDetails));
            responseJson.addProperty("success", true);

        } catch (Exception e) {

        }

        response.setContentType("application/json");
        response.getWriter().write(gson.toJson(responseJson));

    }

}
