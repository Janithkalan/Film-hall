
package Model;

import java.sql.*;

public class ConnectionDB {
    private static Connection connection;
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + "Cinema", "root", "admin");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static ResultSet execute(String query) {
        try {

            Statement statement = connection.createStatement();

            if (query.startsWith("SELECT")) {

                ResultSet resultSet = statement.executeQuery(query);
                return resultSet;

            } else {

                statement.executeUpdate(query);
                return null;

            }

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
