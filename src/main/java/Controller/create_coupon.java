/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Mail;
import Model.Validations;
import Model.ConnectionDB;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Integer.parseInt;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author MSI
 */
@WebServlet(name = "create_coupon", urlPatterns = {"/create_coupon"})
public class create_coupon extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        Gson gson = new Gson();
        JsonObject responseObject = new JsonObject();

        int total_price = Integer.parseInt(request.getParameter("total_price"));
        int invoice = Integer.parseInt(request.getParameter("invoice"));
        String email = request.getParameter("email");
        String user_name = request.getParameter("user_name");
        // Generate a random coupon code
        String coupon = generateCouponCode();

        // Insert the coupon and total price into the database
        try {
            String query = "INSERT INTO coupon (coupon, total_price) VALUES ('" + coupon + "', " + total_price + ")";
            String query_2 = "DELETE FROM seat_reservation WHERE invoice = " + invoice + " ";
            String query_3 = "DELETE FROM invoice_table WHERE invoice = " + invoice + " ";

            ConnectionDB.execute(query);
            ConnectionDB.execute(query_2);
            ConnectionDB.execute(query_3);
            responseObject.addProperty("message", "Cancellation success here is your coupon code: " + coupon);
            //send email
            String subject = "Coupon Code - Moonbeams Cinemas";
            String emailContent = "<!DOCTYPE html>"
                    + "<html>"
                    + "<head>"
                    + "<style>"
                    + "body { font-family: Arial, sans-serif; background-color: #000000; color: #ffffff; padding: 20px; }"
                    + ".container { max-width: 600px; margin: 0 auto; background: #000000; border-radius: 8px; padding: 20px; }"
                    + ".header { text-align: center; }"
                    + ".header h1 { font-size: 24px; margin: 10px 0; }"
                    + ".highlight { color: #007bff; font-weight: bold; }"
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
                    + "<h2>Hi <span class='highlight'>" + user_name + "</span>,</h2>"
                    + "<p>Thank you for choosing our service! We’re excited to share your exclusive coupon code with you</p>"
                    + "</div>"
                    + "<div class='invoice-details'>"
                    + "<p><strong>Coupon Code:</strong> <span class='highlight'>" + coupon + "</span></p>"
                    + "</div>"
                    + "<div class='footer'>"
                    + "<p>COPYRIGHT 2024 MOONBEAM LTD. ALL RIGHTS RESERVED.</p>"
                    + "</div>"
                    + "</div>"
                    + "</body>"
                    + "</html>";

            Mail.sendMail(email, subject, emailContent);

        } catch (Exception e) {
            e.printStackTrace();
        }
        response.setContentType("application/json");
        response.getWriter().write(gson.toJson(responseObject));

    }

    // Helper method to generate a random coupon code
    private String generateCouponCode() {
        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        StringBuilder coupon = new StringBuilder();
        for (int i = 0; i < 15; i++) { // 15 characters long coupon
            int index = (int) (Math.random() * characters.length());
            coupon.append(characters.charAt(index));
        }
        return coupon.toString();
    }
}
