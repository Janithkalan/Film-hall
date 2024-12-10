/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.ConnectionDB;
import Model.Mail;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dto.GoogleUser_DTO;
import dto.Reservation_DTO;
import dto.User_DTO;
import java.io.IOException;
import java.sql.ResultSet;
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Gson gson = new Gson();
        JsonObject responseJson = new JsonObject();
        
        responseJson.addProperty("success", false);
        
        String reservation_dto_json = request.getParameter("reservation_dto_json");
        Reservation_DTO reservation_DTO = gson.fromJson(reservation_dto_json, Reservation_DTO.class);
   
        String seats[] = reservation_DTO.getSeat_id();
        
        User_DTO normal_user = (User_DTO) request.getSession().getAttribute("user");
        
        GoogleUser_DTO google_user = (GoogleUser_DTO) request.getSession().getAttribute("google_user");
        
        responseJson.addProperty("login_status", false);
        
        int invoice = Integer.parseInt(request.getParameter("invoice"));
        
        
        if (normal_user != null) {
            
            try {

            if (reservation_DTO.getScreen_time().equals("10:00AM")) {
                for (String seat : seats) {

                    ConnectionDB.execute(""
                            + "INSERT INTO seat_reservation (invoice,hall_table_id,screen_times_id,month_table_id,movies_idmovies,seat_id,seat_status_id) "
                            + "VALUES ("+invoice+"," + reservation_DTO.getHall_id() + ", 1, "
                            + "" + reservation_DTO.getDate_id() + ", " + reservation_DTO.getMovie_id() + ", '" + seat + "', 3)");
                    
                }
                ConnectionDB.execute(""
                            + "INSERT INTO invoice_table (invoice,user_email) "
                            + "VALUES ("+invoice+",'"+normal_user.getEmail()+"')");
            } else if (reservation_DTO.getScreen_time().equals("01:00PM")) {
                for (String seat : seats) {

                    ConnectionDB.execute(""
                            + "INSERT INTO seat_reservation (invoice,hall_table_id,screen_times_id,month_table_id,movies_idmovies,seat_id,seat_status_id) "
                            + "VALUES ("+invoice+"," + reservation_DTO.getHall_id() + ", 2, "
                            + "" + reservation_DTO.getDate_id() + ", " + reservation_DTO.getMovie_id() + ", '" + seat + "', 3)");
                    
                }
                ConnectionDB.execute(""
                            + "INSERT INTO invoice_table (invoice,user_email) "
                            + "VALUES ("+invoice+",'"+normal_user.getEmail()+"')");
            } else if (reservation_DTO.getScreen_time().equals("04:00PM")) {
                for (String seat : seats) {

                    ConnectionDB.execute(""
                            + "INSERT INTO seat_reservation (invoice,hall_table_id,screen_times_id,month_table_id,movies_idmovies,seat_id,seat_status_id) "
                            + "VALUES ("+invoice+"," + reservation_DTO.getHall_id() + ", 3, "
                            + "" + reservation_DTO.getDate_id() + ", " + reservation_DTO.getMovie_id() + ", '" + seat + "', 3)");
                    
                }
                ConnectionDB.execute(""
                            + "INSERT INTO invoice_table (invoice,user_email) "
                            + "VALUES ("+invoice+",'"+normal_user.getEmail()+"')");
            } else if (reservation_DTO.getScreen_time().equals("07:00PM")) {
                for (String seat : seats) {

                    ConnectionDB.execute(""
                            + "INSERT INTO seat_reservation (invoice,hall_table_id,screen_times_id,month_table_id,movies_idmovies,seat_id,seat_status_id) "
                            + "VALUES ("+invoice+"," + reservation_DTO.getHall_id() + ", 4, "
                            + "" + reservation_DTO.getDate_id() + ", " + reservation_DTO.getMovie_id() + ", '" + seat + "', 3)");
                    
                }
                ConnectionDB.execute(""
                            + "INSERT INTO invoice_table (invoice,user_email) "
                            + "VALUES ("+invoice+",'"+normal_user.getEmail()+"')");
            }
            
//            ResultSet resultSet = ConnectionDB.execute("SELECT total FROM invoice_table WHERE invoice = '"+invoice+"'");
//            String amount = resultSet.getString("total");
            
            String subject = "Feedback Form Submission";
                String emailContent = "<!DOCTYPE html>" +
                        "<html>" +
                        "<head>" +
                        "<style>" +
                        "body { font-family: Arial, sans-serif; line-height: 1.6; background-color: #f9f9f9; padding: 20px; }" +
                        ".container { max-width: 600px; margin: 0 auto; background: #ffffff; border-radius: 8px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); padding: 20px; }" +
                        "h2 { color: #333333; font-size: 24px; text-align: center; }" +
                        "p { font-size: 16px; color: #555555; }" +
                        ".highlight { color: #007bff; font-weight: bold; }" +
                        "footer { font-size: 14px; text-align: center; margin-top: 20px; color: #888888; }" +
                        "</style>" +
                        "</head>" +
                        "<body>" +
                        "<div class='container'>" +
                        "<h2>Feedback Form Submission</h2>" +
                        "<p><strong>Invoice Number:</strong> <span class='highlight'>" + invoice + "</span></p>" +
                        "<p><strong>Email:</strong> <span class='highlight'>" + normal_user.getEmail() + "</span></p>" +
                        "<p><strong>Name:</strong> <span class='highlight'>" + normal_user.getFirst_name() + " " + normal_user.getLast_name() + "</span></p>" +
//                        "<p><strong>Amount:</strong> <span class='highlight'>" + amount + "</span></p>" +
                        "</div>" +
                        "</body>" +
                        "</html>";

                
                Mail.sendMail("sudheeradilum@gmail.com", subject, emailContent);
            responseJson.addProperty("login_status", true);
            responseJson.addProperty("success", true);

        } catch (Exception e) {

            e.printStackTrace();

        }
            

        } else if (google_user != null) {
            responseJson.addProperty("user_name", google_user.getName());
            
            try {

            if (reservation_DTO.getScreen_time().equals("10:00AM")) {
                for (String seat : seats) {

                    ConnectionDB.execute(""
                            + "INSERT INTO seat_reservation (invoice,hall_table_id,screen_times_id,month_table_id,movies_idmovies,seat_id,seat_status_id) "
                            + "VALUES ("+invoice+"," + reservation_DTO.getHall_id() + ", 1, "
                            + "" + reservation_DTO.getDate_id() + ", " + reservation_DTO.getMovie_id() + ", '" + seat + "', 3)");
                    
                    
                }
                ConnectionDB.execute(""
                            + "INSERT INTO invoice_table (invoice,google_users_email) "
                            + "VALUES ("+invoice+",'"+google_user.getEmail()+"')");
            } else if (reservation_DTO.getScreen_time().equals("01:00PM")) {
                for (String seat : seats) {

                    ConnectionDB.execute(""
                            + "INSERT INTO seat_reservation (invoice,hall_table_id,screen_times_id,month_table_id,movies_idmovies,seat_id,seat_status_id) "
                            + "VALUES ("+invoice+"," + reservation_DTO.getHall_id() + ", 2, "
                            + "" + reservation_DTO.getDate_id() + ", " + reservation_DTO.getMovie_id() + ", '" + seat + "', 3)");
                    
                }
                ConnectionDB.execute(""
                            + "INSERT INTO invoice_table (invoice,google_users_email) "
                            + "VALUES ("+invoice+",'"+google_user.getEmail()+"')");
            } else if (reservation_DTO.getScreen_time().equals("04:00PM")) {
                for (String seat : seats) {

                    ConnectionDB.execute(""
                            + "INSERT INTO seat_reservation (invoice,hall_table_id,screen_times_id,month_table_id,movies_idmovies,seat_id,seat_status_id) "
                            + "VALUES ("+invoice+"," + reservation_DTO.getHall_id() + ", 3, "
                            + "" + reservation_DTO.getDate_id() + ", " + reservation_DTO.getMovie_id() + ", '" + seat + "', 3)");
                    
                }
                ConnectionDB.execute(""
                            + "INSERT INTO invoice_table (invoice,google_users_email) "
                            + "VALUES ("+invoice+",'"+google_user.getEmail()+"')");
            } else if (reservation_DTO.getScreen_time().equals("07:00PM")) {
                for (String seat : seats) {

                    ConnectionDB.execute(""
                            + "INSERT INTO seat_reservation (invoice,hall_table_id,screen_times_id,month_table_id,movies_idmovies,seat_id,seat_status_id) "
                            + "VALUES ("+invoice+"," + reservation_DTO.getHall_id() + ", 4, "
                            + "" + reservation_DTO.getDate_id() + ", " + reservation_DTO.getMovie_id() + ", '" + seat + "', 3)");
                    
                }
                ConnectionDB.execute(""
                            + "INSERT INTO invoice_table (invoice,google_users_email) "
                            + "VALUES ("+invoice+",'"+google_user.getEmail()+"')");
            }
            
            //            ResultSet resultSet = ConnectionDB.execute("SELECT total FROM invoice_table WHERE invoice = '"+invoice+"'");
//            String amount = resultSet.getString("total");
            
            String subject = "MoonBeams Cinema Invoice";
                String emailContent = "<!DOCTYPE html>" +
                        "<html>" +
                        "<head>" +
                        "<style>" +
                        "body { font-family: Arial, sans-serif; line-height: 1.6; background-color: #f9f9f9; padding: 20px; }" +
                        ".container { max-width: 600px; margin: 0 auto; background: #ffffff; border-radius: 8px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); padding: 20px; }" +
                        "h2 { color: #333333; font-size: 24px; text-align: center; }" +
                        "p { font-size: 16px; color: #555555; }" +
                        ".highlight { color: #007bff; font-weight: bold; }" +
                        "footer { font-size: 14px; text-align: center; margin-top: 20px; color: #888888; }" +
                        "</style>" +
                        "</head>" +
                        "<body>" +
                        "<div class='container'>" +
                        "<h2>MoonBeams Cinema Invoice</h2>" +
                        "<p><strong>Invoice Number:</strong> <span class='highlight'>" + invoice + "</span></p>" +
                        "<p><strong>Email:</strong> <span class='highlight'>" + google_user.getEmail() + "</span></p>" +
                        "<p><strong>Name:</strong> <span class='highlight'>" + google_user.getName() + "</span></p>" +
//                        "<p><strong>Amount:</strong> <span class='highlight'>" + amount + "</span></p>" +
                        "</div>" +
                        "</body>" +
                        "</html>";

                
                Mail.sendMail("sudheeradilum@gmail.com", subject, emailContent);
            responseJson.addProperty("login_status", true);
            responseJson.addProperty("success", true);

        } catch (Exception e) {

            e.printStackTrace();

        }
            
            
            
        } else {

        }
        

        response.setContentType("application/json");
        response.getWriter().write(gson.toJson(responseJson));

    }

}
