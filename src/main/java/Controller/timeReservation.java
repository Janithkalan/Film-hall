/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.ConnectionDB;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.mysql.cj.protocol.Resultset;
import dto.Movie_DTO;
import dto.TimeTable_DTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ConnectionBuilder;
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
@WebServlet(name = "timeReservation", urlPatterns = {"/timeReservation"})
public class timeReservation extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Gson gson = new Gson();
        JsonObject responseJson = new JsonObject();
        responseJson.addProperty("success", false);
        ArrayList timeReservationDetails = new ArrayList();
        ArrayList timeTableDetails = new ArrayList();
        
        String today_date = request.getParameter("today_date");
        String selectedId = request.getParameter("selectedId");
        

        try {
            ResultSet resultSet = ConnectionDB.execute("SELECT * FROM movies WHERE movies_status_id = '1' ");
            while (resultSet.next()) {
                Movie_DTO movie_DTO = new Movie_DTO();
                movie_DTO.setId(resultSet.getInt("idmovies"));
                movie_DTO.setName(resultSet.getString("name"));
                movie_DTO.setMovie_description(resultSet.getString("movie_description"));
                movie_DTO.setRatings(resultSet.getString("ratings"));
                movie_DTO.setTrailer_link(resultSet.getString("trailer_link"));

                timeReservationDetails.add(movie_DTO);
            }

            

            ResultSet resultSet2 = ConnectionDB.execute(""
                    + "SELECT screen_times.show_time, hall_table.hall_name, movies.idmovies, month_table.id, weekdays.weekday "
                    + "FROM time_table "
                    + "INNER JOIN screen_times ON time_table.screen_times_id = screen_times.id "
                    + "INNER JOIN hall_table ON time_table.hall_table_id = hall_table.id "
                    + "INNER JOIN movies ON time_table.movies_idmovies = movies.idmovies "
                    + "INNER JOIN month_table ON time_table.month_table_id = month_table.id "
                    + "INNER JOIN weekdays ON month_table.weekdays_id = weekdays.id");
            
            while (resultSet2.next()) {
                
                    TimeTable_DTO timeTable_DTO = new TimeTable_DTO();
                    timeTable_DTO.setShow_time(resultSet2.getString("show_time"));
                    timeTable_DTO.setHall_name(resultSet2.getString("hall_name"));
                    timeTable_DTO.setMovie_id(resultSet2.getInt("idmovies"));
                    timeTable_DTO.setDate(resultSet2.getInt("id"));
                    timeTable_DTO.setDay(resultSet2.getString("weekday"));

                    timeTableDetails.add(timeTable_DTO);
                

            }

            responseJson.add("timeReservationDetails", gson.toJsonTree(timeReservationDetails));
            responseJson.add("timeTableDetails", gson.toJsonTree(timeTableDetails));
            responseJson.addProperty("success", true);

        } catch (Exception e) {
            e.printStackTrace();
        }

        response.setContentType("application/json");
        response.getWriter().write(gson.toJson(responseJson));

    }

}
