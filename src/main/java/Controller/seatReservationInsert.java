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
                                + "VALUES (" + invoice + "," + reservation_DTO.getHall_id() + ", 1, "
                                + "" + reservation_DTO.getDate_id() + ", " + reservation_DTO.getMovie_id() + ", '" + seat + "', 3)");

                    }
                    ConnectionDB.execute(""
                            + "INSERT INTO invoice_table (invoice,user_email) "
                            + "VALUES (" + invoice + ",'" + normal_user.getEmail() + "')");
                } else if (reservation_DTO.getScreen_time().equals("01:00PM")) {
                    for (String seat : seats) {

                        ConnectionDB.execute(""
                                + "INSERT INTO seat_reservation (invoice,hall_table_id,screen_times_id,month_table_id,movies_idmovies,seat_id,seat_status_id) "
                                + "VALUES (" + invoice + "," + reservation_DTO.getHall_id() + ", 2, "
                                + "" + reservation_DTO.getDate_id() + ", " + reservation_DTO.getMovie_id() + ", '" + seat + "', 3)");

                    }
                    ConnectionDB.execute(""
                            + "INSERT INTO invoice_table (invoice,user_email) "
                            + "VALUES (" + invoice + ",'" + normal_user.getEmail() + "')");
                } else if (reservation_DTO.getScreen_time().equals("04:00PM")) {
                    for (String seat : seats) {

                        ConnectionDB.execute(""
                                + "INSERT INTO seat_reservation (invoice,hall_table_id,screen_times_id,month_table_id,movies_idmovies,seat_id,seat_status_id) "
                                + "VALUES (" + invoice + "," + reservation_DTO.getHall_id() + ", 3, "
                                + "" + reservation_DTO.getDate_id() + ", " + reservation_DTO.getMovie_id() + ", '" + seat + "', 3)");

                    }
                    ConnectionDB.execute(""
                            + "INSERT INTO invoice_table (invoice,user_email) "
                            + "VALUES (" + invoice + ",'" + normal_user.getEmail() + "')");
                } else if (reservation_DTO.getScreen_time().equals("07:00PM")) {
                    for (String seat : seats) {

                        ConnectionDB.execute(""
                                + "INSERT INTO seat_reservation (invoice,hall_table_id,screen_times_id,month_table_id,movies_idmovies,seat_id,seat_status_id) "
                                + "VALUES (" + invoice + "," + reservation_DTO.getHall_id() + ", 4, "
                                + "" + reservation_DTO.getDate_id() + ", " + reservation_DTO.getMovie_id() + ", '" + seat + "', 3)");

                    }
                    ConnectionDB.execute(""
                            + "INSERT INTO invoice_table (invoice,user_email) "
                            + "VALUES (" + invoice + ",'" + normal_user.getEmail() + "')");
                }

                
                String seat_list_string = String.join(", ", seats);
                String user_email = normal_user.getEmail();
                String first_name = normal_user.getFirst_name();
                String second_name = normal_user.getLast_name();
                String subject = "Your Order Invoice - Moonbeams Cinemas";
                String emailContent = "<!DOCTYPE html>"
                        + "<html>"
                        + "<head>"
                        + "<style>"
                        + "body { font-family: Arial, sans-serif; background-color: #000000; color: #ffffff; padding: 20px; }"
                        + ".container { max-width: 600px; margin: 0 auto; background: #000000; border-radius: 8px; padding: 20px; }"
                        + ".header { text-align: center; }"
                        + ".header h1 { font-size: 24px; margin: 10px 0; }"
                        + ".content { background: #151515; padding: 20px; border-radius: 8px; margin-top: 20px; }"
                        + ".content h2 { color: #ffffff; font-size: 20px; text-align: center; }"
                        + ".content p { font-size: 16px; color: #bbbbbb; text-align: center; }"
                        + ".invoice-details { margin-top: 20px; }"
                        + ".invoice-details p { font-size: 16px; color: #ffffff; }"
                        + ".offers { text-align: center; margin-top: 20px; }"
                        + ".offers img { width: 100%; border-radius: 8px; }"
                        + ".footer { font-size: 14px; text-align: center; margin-top: 20px; color: #888888; }"
                        + "</style>"
                        + "</head>"
                        + "<body>"
                        + "<div class='container'>"
                        + "<div class='header'>"
                        + "<h1>MOONBEAMS CINEMA</h1>"
                        + "</div>"
                        + "<div class='content'>"
                        + "<h2>Thank you for reservation</h2>"
                        + "<p>We’re thrilled to have you as part of our audience and can’t wait to bring you an unforgettable cinematic experience. If you have any questions or need assistance, feel free to contact us.</p>"
                        + "</div>"
                        + "<div class='invoice-details'>"
                        + "<p><strong>Invoice ID:</strong> "+invoice+"</p>"
                        + "<p><strong>Name:</strong> "+first_name+" "+second_name+"</p>"
                        + "<p><strong>Email:</strong> "+user_email+"</p>"
                        + "<p><strong>Seats:</strong> "+seat_list_string+"</p>"
                        + "</div>"
                        + "<div class='footer'>"
                        + "<p>COPYRIGHT 2024 MOONBEAM LTD. ALL RIGHTS RESERVED.</p>"
                        + "</div>"
                        + "</div>"
                        + "</body>"
                        + "</html>";

                Mail.sendMail(user_email, subject, emailContent);
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
                                + "VALUES (" + invoice + "," + reservation_DTO.getHall_id() + ", 1, "
                                + "" + reservation_DTO.getDate_id() + ", " + reservation_DTO.getMovie_id() + ", '" + seat + "', 3)");

                    }
                    ConnectionDB.execute(""
                            + "INSERT INTO invoice_table (invoice,google_users_email) "
                            + "VALUES (" + invoice + ",'" + google_user.getEmail() + "')");
                } else if (reservation_DTO.getScreen_time().equals("01:00PM")) {
                    for (String seat : seats) {

                        ConnectionDB.execute(""
                                + "INSERT INTO seat_reservation (invoice,hall_table_id,screen_times_id,month_table_id,movies_idmovies,seat_id,seat_status_id) "
                                + "VALUES (" + invoice + "," + reservation_DTO.getHall_id() + ", 2, "
                                + "" + reservation_DTO.getDate_id() + ", " + reservation_DTO.getMovie_id() + ", '" + seat + "', 3)");

                    }
                    ConnectionDB.execute(""
                            + "INSERT INTO invoice_table (invoice,google_users_email) "
                            + "VALUES (" + invoice + ",'" + google_user.getEmail() + "')");
                } else if (reservation_DTO.getScreen_time().equals("04:00PM")) {
                    for (String seat : seats) {

                        ConnectionDB.execute(""
                                + "INSERT INTO seat_reservation (invoice,hall_table_id,screen_times_id,month_table_id,movies_idmovies,seat_id,seat_status_id) "
                                + "VALUES (" + invoice + "," + reservation_DTO.getHall_id() + ", 3, "
                                + "" + reservation_DTO.getDate_id() + ", " + reservation_DTO.getMovie_id() + ", '" + seat + "', 3)");

                    }
                    ConnectionDB.execute(""
                            + "INSERT INTO invoice_table (invoice,google_users_email) "
                            + "VALUES (" + invoice + ",'" + google_user.getEmail() + "')");
                } else if (reservation_DTO.getScreen_time().equals("07:00PM")) {
                    for (String seat : seats) {

                        ConnectionDB.execute(""
                                + "INSERT INTO seat_reservation (invoice,hall_table_id,screen_times_id,month_table_id,movies_idmovies,seat_id,seat_status_id) "
                                + "VALUES (" + invoice + "," + reservation_DTO.getHall_id() + ", 4, "
                                + "" + reservation_DTO.getDate_id() + ", " + reservation_DTO.getMovie_id() + ", '" + seat + "', 3)");

                    }
                    ConnectionDB.execute(""
                            + "INSERT INTO invoice_table (invoice,google_users_email) "
                            + "VALUES (" + invoice + ",'" + google_user.getEmail() + "')");
                }

               String seat_list_string = String.join(", ", seats);
                String user_email = google_user.getEmail();
                String user_name = google_user.getName();
                String subject = "Your Order Invoice - Moonbeams Cinemas";
                String emailContent = "<!DOCTYPE html>"
                        + "<html>"
                        + "<head>"
                        + "<style>"
                        + "body { font-family: Arial, sans-serif; background-color: #000000; color: #ffffff; padding: 20px; }"
                        + ".container { max-width: 600px; margin: 0 auto; background: #000000; border-radius: 8px; padding: 20px; }"
                        + ".header { text-align: center; }"
                        + ".header h1 { font-size: 24px; margin: 10px 0; }"
                        + ".content { background: #151515; padding: 20px; border-radius: 8px; margin-top: 20px; }"
                        + ".content h2 { color: #ffffff; font-size: 20px; text-align: center; }"
                        + ".content p { font-size: 16px; color: #bbbbbb; text-align: center; }"
                        + ".invoice-details { margin-top: 20px; }"
                        + ".invoice-details p { font-size: 16px; color: #ffffff; }"
                        + ".offers { text-align: center; margin-top: 20px; }"
                        + ".offers img { width: 100%; border-radius: 8px; }"
                        + ".footer { font-size: 14px; text-align: center; margin-top: 20px; color: #888888; }"
                        + "</style>"
                        + "</head>"
                        + "<body>"
                        + "<div class='container'>"
                        + "<div class='header'>"
                        + "<h1>MOONBEAMS CINEMA</h1>"
                        + "</div>"
                        + "<div class='content'>"
                        + "<h2>Thank you for reservation</h2>"
                        + "<p>We’re thrilled to have you as part of our audience and can’t wait to bring you an unforgettable cinematic experience. If you have any questions or need assistance, feel free to contact us.</p>"
                        + "</div>"
                        + "<div class='invoice-details'>"
                        + "<p><strong>Invoice ID:</strong> "+invoice+"</p>"
                        + "<p><strong>Name:</strong> "+user_name+"</p>"
                        + "<p><strong>Email:</strong> "+user_email+"</p>"
                        + "<p><strong>Seats:</strong> "+seat_list_string+"</p>"
                        + "</div>"
                        + "<div class='footer'>"
                        + "<p>COPYRIGHT 2024 MOONBEAM LTD. ALL RIGHTS RESERVED.</p>"
                        + "</div>"
                        + "</div>"
                        + "</body>"
                        + "</html>";

                Mail.sendMail(user_email, subject, emailContent);
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
