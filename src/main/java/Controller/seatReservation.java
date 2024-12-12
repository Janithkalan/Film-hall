/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.ConnectionDB;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dto.SeatReservationDetails_DTO;
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
@WebServlet(name = "seatReservation", urlPatterns = {"/seatReservation"})
public class seatReservation extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Gson gson = new Gson();
        JsonObject responseJson = new JsonObject();
        responseJson.addProperty("success", false);
        ArrayList seatReservationDetails = new ArrayList();

        String current_date = request.getParameter("current_date");
        String current_time = request.getParameter("current_time");
        String current_movie = request.getParameter("current_movie");
        String current_hall = request.getParameter("current_hall");

        try {
            ResultSet resultSet = ConnectionDB.execute(""
                    + "SELECT seat.id, seat_status.id, hall_table.id, screen_times.id, month_table.id, movies.idmovies, seat_price.price AS price "
                    + "FROM seat_reservation "
                    + "INNER JOIN seat ON seat_reservation.seat_id = seat.id "
                    + "INNER JOIN hall_table ON seat_reservation.hall_table_id = hall_table.id "
                    + "INNER JOIN screen_times ON seat_reservation.screen_times_id = screen_times.id "
                    + "INNER JOIN month_table ON seat_reservation.month_table_id = month_table.id "
                    + "INNER JOIN movies ON seat_reservation.movies_idmovies = movies.idmovies "
                    + "INNER JOIN seat_status ON seat_reservation.seat_status_id = seat_status.id "
                    + "INNER JOIN seat_price ON seat_reservation.hall_table_id = seat_price.id "
                    + "WHERE seat_reservation.month_table_id = '" + current_date + "' "
                    + "AND screen_times.show_time LIKE '" + current_time + "%' "
                    + "AND movies.idmovies = '" + current_movie + "' "
                    + "AND hall_table.id = '" + current_hall + "'");

            while (resultSet.next()) {


                    SeatReservationDetails_DTO seatReservationDetails_DTO = new SeatReservationDetails_DTO();
                    seatReservationDetails_DTO.setSeat_id(resultSet.getString("seat.id"));
                    seatReservationDetails_DTO.setSeat_status(resultSet.getInt("seat_status.id"));
                    seatReservationDetails_DTO.setHall_id(resultSet.getInt("hall_table.id"));
                    seatReservationDetails_DTO.setTime(resultSet.getInt("screen_times.id"));
                    seatReservationDetails_DTO.setDate(resultSet.getInt("month_table.id"));
                    seatReservationDetails_DTO.setMovie_id(resultSet.getInt("movies.idmovies"));
                    seatReservationDetails_DTO.setPrice(resultSet.getInt("price"));

                    seatReservationDetails.add(seatReservationDetails_DTO);


            }

            ResultSet resultSet2 = ConnectionDB.execute("SELECT movies.name FROM movies WHERE movies.idmovies = '" + current_movie + "'");
            if (resultSet2.next()) {
                responseJson.addProperty("movie_name", resultSet2.getString("movies.name"));
            }

            ResultSet resultSet3 = ConnectionDB.execute("SELECT hall_table.hall_name FROM hall_table WHERE hall_table.id = '" + current_hall + "'");
            if (resultSet3.next()) {
                responseJson.addProperty("hall_name", resultSet3.getString("hall_table.hall_name"));
            }

            responseJson.add("seatReservationDetails", gson.toJsonTree(seatReservationDetails));
            responseJson.addProperty("success", true);

        } catch (Exception e) {
            e.printStackTrace();
        }

        response.setContentType("application/json");
        response.getWriter().write(gson.toJson(responseJson));

    }

}
