/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dto.GoogleUser_DTO;
import dto.User_DTO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Random;

/**
 *
 * @author Dilum
 */
@WebServlet(name = "checkout", urlPatterns = {"/checkout"})
public class checkout extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Gson gson = new Gson();
        JsonObject responseJson = new JsonObject();

        User_DTO normal_user = (User_DTO) request.getSession().getAttribute("user");
        GoogleUser_DTO google_user = (GoogleUser_DTO) request.getSession().getAttribute("google_user");
        
        String first_name = null;
        String last_name = null;
        
        Random random = new Random();
        int invoice = random.nextInt(1000000) + 1; //generate invoice
        //check user is normal or google
        if (normal_user != null) {

            first_name = normal_user.getFirst_name();
            last_name = normal_user.getLast_name();

        } else if (google_user != null) {
            //split the full name into parts
            String full_name = google_user.getName();
            String[] words = full_name.split(" ");
            first_name = words[0];
            last_name = words[1];

        }
     

        String merchantId = "1228948";
        String orderId = String.valueOf(invoice);
        int amountStr = Integer.parseInt(request.getParameter("final_price"));
        String currency = "LKR";
        String merchantSecret = "MjQ1MDQ2MTYzMzg4NDUwOTc0NjkwODExODc5Mjc0MTc3MzQ5Mw==";

        BigDecimal amount = new BigDecimal(amountStr).setScale(2, BigDecimal.ROUND_HALF_UP);
        String amountFormatted = amount.toString();

        try {
            String merchantSecretHash = md5(merchantSecret).toUpperCase();
            String concatenatedString = merchantId + orderId + amountFormatted + currency + merchantSecretHash;
            String hash = md5(concatenatedString).toUpperCase();

            // Add data to the JSON object
            responseJson.addProperty("merchantId", merchantId);
            responseJson.addProperty("orderId", orderId);
            responseJson.addProperty("amount", amountFormatted);
            responseJson.addProperty("currency", currency);
            responseJson.addProperty("hash", hash);
            responseJson.addProperty("first_name", first_name);
            responseJson.addProperty("last_name", last_name);

        } catch (NoSuchAlgorithmException e) {
            throw new ServletException("MD5 algorithm not found", e);
        }

        
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.print(gson.toJson(responseJson));
        out.flush();
    }
    //hash generation
    private String md5(String input) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(input.getBytes());
        byte[] digest = md.digest();
        StringBuilder sb = new StringBuilder();
        for (byte b : digest) {
            sb.append(String.format("%02x", b & 0xff));
        }
        return sb.toString();
    }
}
