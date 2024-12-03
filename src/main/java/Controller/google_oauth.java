package Controller;

import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow;
import com.google.api.client.googleapis.auth.oauth2.GoogleTokenResponse;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.client.http.GenericUrl;
import com.google.api.client.http.HttpRequest;
import com.google.api.client.http.HttpRequestFactory;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.HttpResponse;
import com.google.api.client.http.javanet.NetHttpTransport;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;

import Model.ConnectionDB;
import dto.GoogleUser_DTO;

@WebServlet(name = "google_oauth", urlPatterns = {"/google_oauth"})
public class google_oauth extends HttpServlet {

    private static final String CLIENT_ID = "967911859639-im9hcj4b3p2jbdjt6uag9apda292jdd1.apps.googleusercontent.com";
    private static final String CLIENT_SECRET = "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";
    private static final String REDIRECT_URI = "http://localhost:8080/CinemaHall/google_oauth"; // Updated URI to match servlet mapping
    private static final String AUTHORIZATION_SERVER_URL = "https://accounts.google.com/o/oauth2/auth";
    private static final String TOKEN_SERVER_URL = "https://oauth2.googleapis.com/token";
    private static final String SCOPE = "openid profile email";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("code");

        if (code == null || code.isEmpty()) {
            // Step 1: If the code is missing, redirect to Google OAuth 2.0 consent page
            String authUrl = buildAuthUrl();
            response.sendRedirect(authUrl);
        } else {
            try {
                // Step 2: Exchange authorization code for an access token
                String accessToken = exchangeCodeForAccessToken(code);

                // Step 3: Fetch user information using the access token
                String userInfo = fetchUserInfo(accessToken);

                // Step 4: Process user information
                processUser(userInfo, request, response);
            } catch (Exception e) {
                // Handle errors, such as token exchange or user info fetch failure
                e.printStackTrace();
                response.getWriter().write("Error: " + e.getMessage());
            }
        }
    }

    private String buildAuthUrl() {
        // Build the Google OAuth 2.0 authorization URL
        return String.format("%s?response_type=code&client_id=%s&redirect_uri=%s&scope=%s",
                AUTHORIZATION_SERVER_URL, CLIENT_ID, REDIRECT_URI, SCOPE);
    }

    private String exchangeCodeForAccessToken(String code) throws Exception {
        // Exchange the authorization code for an access token
        HttpTransport httpTransport = new NetHttpTransport();
        JsonFactory jsonFactory = new JacksonFactory();

        GoogleAuthorizationCodeFlow flow = new GoogleAuthorizationCodeFlow.Builder(
                httpTransport, jsonFactory, CLIENT_ID, CLIENT_SECRET, Arrays.asList(SCOPE))
                .setAccessType("offline")
                .build();

        GoogleTokenResponse tokenResponse = flow.newTokenRequest(code)
                .setRedirectUri(REDIRECT_URI)
                .execute();

        return tokenResponse.getAccessToken(); // Get the access token
    }

    private String fetchUserInfo(String accessToken) throws IOException {
        // Fetch user info from Google
        HttpTransport httpTransport = new NetHttpTransport();
        JsonFactory jsonFactory = new JacksonFactory();
        HttpRequestFactory requestFactory = httpTransport.createRequestFactory();

        GenericUrl url = new GenericUrl("https://openidconnect.googleapis.com/v1/userinfo");
        HttpRequest request = requestFactory.buildGetRequest(url);
        request.getHeaders().setAuthorization("Bearer " + accessToken);

        HttpResponse response = request.execute();
        return response.parseAsString(); // Returns JSON response with user details
    }

    private void processUser(String userInfo, HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        // Parse JSON (example with Gson)
        com.google.gson.JsonObject jsonObject = com.google.gson.JsonParser.parseString(userInfo).getAsJsonObject();
        GoogleUser_DTO user = new GoogleUser_DTO(jsonObject.get("email").getAsString(),jsonObject.get("name").getAsString());

        try {
            // Execute the SELECT query and check if the user exists
            ResultSet resultSet = ConnectionDB.execute("SELECT * FROM google_users WHERE email = '" + user.getEmail() + "'");
            if (resultSet != null && !resultSet.next()) {
                try {
                    // Insert the user if they do not exist
                    ConnectionDB.execute(
                            "INSERT INTO google_users (email, name) VALUES ('"
                                    + user.getEmail() + "','"
                                    + user.getName() + "')"
                    );
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            if (resultSet != null) {
                resultSet.close(); // Close the ResultSet to prevent resource leaks
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Create a session for the user
        HttpSession session = request.getSession();
        session.setAttribute("google_user", user);

        // Redirect to the user's dashboard or home page
        response.sendRedirect("http://localhost:8080/CinemaHall/");
    }
}
