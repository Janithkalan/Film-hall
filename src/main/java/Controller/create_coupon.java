/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Mail;
import Model.Validations;
import Model.ConnectionDB;
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
        // Get the total price from the request
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
            response.getWriter().write("Coupon code " + coupon + " created successfully!");
            
            String subject = "Your Coupon Code is Here!";
            String emailContent = "<!DOCTYPE html>"
                    + "<html>"
                    + "<head>"
                    + "<style>"
                    + "body { font-family: Arial, sans-serif; line-height: 1.6; background-color: #f9f9f9; padding: 20px; }"
                    + ".container { max-width: 600px; margin: 0 auto; background: #ffffff; border-radius: 8px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); padding: 20px; }"
                    + "h2 { color: #333333; font-size: 24px; text-align: center; }"
                    + "p { font-size: 16px; color: #555555; }"
                    + ".highlight { color: #007bff; font-weight: bold; }"
                    + "footer { font-size: 14px; text-align: center; margin-top: 20px; color: #888888; }"
                    + "</style>"
                    + "</head>"
                    + "<body>"
                    + "<div class='container'>"
                    + "<h2>Hi <span class='highlight'>" + user_name + "</span>,</h2>"
                    + "<p>Thank you for choosing our service! We’re excited to share your exclusive coupon code with you:</p>"
                    + "<p><strong>Coupon Code:</strong> <span class='highlight'>" + coupon + "</span></p>"
                    + "<p>You can use this coupon during your next purchase to enjoy special discounts.</p>"
                    + "<p>If you have any questions, feel free to contact us anytime.</p>"
                    + "<footer>"
                    + "<p>Best regards,</p>"
                    + "<p><strong>Your Company Team</strong></p>"
                    + "</footer>"
                    + "</div>"
                    + "</body>"
                    + "</html>";
            
            Mail.sendMail(email, subject, emailContent);

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Error: " + e.getMessage());
        }
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
