/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.ConnectionDB;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dto.Cancellation_DTO;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Integer.parseInt;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author MSI
 */
@WebServlet(name = "cancellation", urlPatterns = {"/cancellation"})
public class cancellation extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Gson gson = new Gson();
        JsonObject responseObject = new JsonObject();
        responseObject.addProperty("success", false);
        ArrayList<Cancellation_DTO> cancellation_data = new ArrayList<>(); // Use the proper generic type

        String text = request.getParameter("textResult"); 
        
        // Check for missing or invalid textResult parameter
        
       
        try {
            int textResult = parseInt(text);
            // Construct the SQL query
            String sqlQuery = "SELECT "
                    + "    invoice_table.invoice, "
                    + "    COALESCE(google_users.name, CONCAT(user.fname, ' ', user.lname)) AS name, "
                    + "    COALESCE(google_users.email, user.email) AS email, "
                    + "    COALESCE(user.mobile, '') AS mobile, " // Ensure mobile is either from the user table or empty string
                    + "    month_table.id AS month_id, "
                    + "    weekdays.weekday, "
                    + "    seat_reservation.seat_id, "
                    + "    hall_table.hall_name, "
                    + "    screen_times.show_time, "
                    + "    movies.name, "
                    + "    invoice_table.total "
                    + "FROM seat_reservation "
                    + "INNER JOIN invoice_table ON seat_reservation.invoice = invoice_table.invoice "
                    + "INNER JOIN hall_table ON seat_reservation.hall_table_id = hall_table.id "
                    + "INNER JOIN screen_times ON seat_reservation.screen_times_id = screen_times.id "
                    + "INNER JOIN month_table ON seat_reservation.month_table_id = month_table.id "
                    + "INNER JOIN movies ON seat_reservation.movies_idmovies = movies.idmovies "
                    + "LEFT JOIN google_users ON invoice_table.google_users_email = google_users.email "
                    + "LEFT JOIN user ON invoice_table.user_email = user.email "
                    + "INNER JOIN weekdays ON month_table.weekdays_id = weekdays.id "
                    + "WHERE seat_reservation.invoice = '" + textResult + "'";
            
            

            // Log the query for debugging
            System.out.println("Executing SQL: " + sqlQuery);

            // Execute the SQL query
            ResultSet resultSet = ConnectionDB.execute(sqlQuery);

            // Check if there are any records in the result set
            if (!resultSet.isBeforeFirst()) {
                responseObject.addProperty("message", "No records found for invoice " + textResult);
                response.setContentType("application/json");
                response.getWriter().write(gson.toJson(responseObject));
                return;
            }
            Cancellation_DTO cancellationDTO = new Cancellation_DTO();
            // Process each record from the result set
            while (resultSet.next()) {
                
                // Set values for cancellationDTO
                cancellationDTO.setInvoice(resultSet.getInt("invoice_table.invoice"));
                cancellationDTO.setName(resultSet.getString("name"));
                cancellationDTO.setEmail(resultSet.getString("email"));
                cancellationDTO.setMobile(resultSet.getString("mobile"));  // Ensure "mobile" is properly handled
                cancellationDTO.setDate(resultSet.getInt("month_id"));
                cancellationDTO.setWeekday(resultSet.getString("weekdays.weekday"));
                cancellationDTO.setHall(resultSet.getString("hall_table.hall_name"));
                cancellationDTO.setShow_time(resultSet.getString("screen_times.show_time"));
                cancellationDTO.setMovie_name(resultSet.getString("movies.name"));
                cancellationDTO.setTotal_price(resultSet.getInt("invoice_table.total"));

                // Add seat_id to the list (if multiple seats for the same invoice)
                String seatId = resultSet.getString("seat_id");
                cancellationDTO.getSeat_id().add(seatId); // Add seat_id to the list
    
            }
            // Add the populated DTO to the cancellation data list
            cancellation_data.add(cancellationDTO);
            // Add the cancellation_data to the response object
            responseObject.add("cancellation_data", gson.toJsonTree(cancellation_data));
            responseObject.addProperty("success", true);

        } catch (Exception e) {
            e.printStackTrace();
            responseObject.addProperty("error", e.getMessage()); // Add error to response
        }

        // Send the response as JSON
        response.setContentType("application/json");
        response.getWriter().write(gson.toJson(responseObject));
    }
}
