/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.ConnectionDB;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dto.Reservation_DTO;
import java.io.IOException;
import static java.lang.Math.random;
import java.util.Arrays;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Dilum
 */
@WebServlet(name = "seatReservationInsert", urlPatterns = {"/seatReservationInsert"})
public class seatReservationInsert extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Gson gson = new Gson();
        JsonObject responseJson = new JsonObject();
        responseJson.addProperty("success", false);
        try {

            Reservation_DTO reservation_DTO = gson.fromJson(request.getReader(), Reservation_DTO.class);

            String seats[] = reservation_DTO.getSeat_id();
            
            if (reservation_DTO.getScreen_time().equals("10:00AM")){
                for (String seat : seats) { 
                
                ConnectionDB.execute(""
                    + "INSERT INTO seat_reservation (invoice,hall_table_id,screen_times_id,month_table_id,movies_idmovies,seat_id,seat_status_id) "
                    + "VALUES (10230,"+reservation_DTO.getHall_id()+", 1, "
                            + ""+reservation_DTO.getDate_id()+", "+reservation_DTO.getMovie_id()+", '"+seat+"', 3)");
            }
            } else if (reservation_DTO.getScreen_time().equals("01:00PM")){
                for (String seat : seats) { 
                
                ConnectionDB.execute(""
                    + "INSERT INTO seat_reservation (invoice,hall_table_id,screen_times_id,month_table_id,movies_idmovies,seat_id,seat_status_id) "
                    + "VALUES (10230,"+reservation_DTO.getHall_id()+", 2, "
                            + ""+reservation_DTO.getDate_id()+", "+reservation_DTO.getMovie_id()+", '"+seat+"', 3)");
            }
            }else if (reservation_DTO.getScreen_time().equals("04:00PM")){
                for (String seat : seats) { 
                
                ConnectionDB.execute(""
                    + "INSERT INTO seat_reservation (invoice,hall_table_id,screen_times_id,month_table_id,movies_idmovies,seat_id,seat_status_id) "
                    + "VALUES (10230,"+reservation_DTO.getHall_id()+", 3, "
                            + ""+reservation_DTO.getDate_id()+", "+reservation_DTO.getMovie_id()+", '"+seat+"', 3)");
            }
            } else if (reservation_DTO.getScreen_time().equals("07:00PM")){
                for (String seat : seats) { 
                
                ConnectionDB.execute(""
                    + "INSERT INTO seat_reservation (invoice,hall_table_id,screen_times_id,month_table_id,movies_idmovies,seat_id,seat_status_id) "
                    + "VALUES (10230,"+reservation_DTO.getHall_id()+", 4, "
                            + ""+reservation_DTO.getDate_id()+", "+reservation_DTO.getMovie_id()+", '"+seat+"', 3)");
            }
            }

            
            responseJson.addProperty("success", true);


        } catch (Exception e) {

            e.printStackTrace();

        }

        response.setContentType("application/json");
        response.getWriter().write(gson.toJson(responseJson));

    }

}
