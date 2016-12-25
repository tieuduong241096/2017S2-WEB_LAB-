package connect;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

public class Controller {

    private static Connection conn;

    public static Connection getConnection() throws SQLException {
        if (Controller.conn == null) {
            createConnection();
        }
        return conn;
    }
    private static String URL = "jdbc:mysql://localhost:3306/shoestore";
    private static String username = "root";
    private static String password = "root";

    private static void createConnection() throws SQLException {
        try {
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
            } catch (InstantiationException ex) {
                Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
            } catch (IllegalAccessException ex) {
                Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
            }
            conn = DriverManager.getConnection(URL, username, password);
        } catch (SQLException e) {
            System.out.println("Error");
            //JOptionPane.showMessageDialog(null, "Cannot connect to the database\nContact Admin!", "Connection Message", JOptionPane.ERROR_MESSAGE);
        }
    }

    public static ResultSet queryExecute(String query) throws SQLException {
        if (conn == null) {
            createConnection();
        }
        return conn.createStatement().executeQuery(query);
    }

    public static void updateExecute(String query) throws SQLException {
        if (conn == null) {
            createConnection();
        }
        conn.createStatement().executeUpdate(query);
    }

    public static boolean isInvalidInput(String inputString) {
        for (int i = 0; i < inputString.length(); i++) {
            char t = inputString.charAt(i);
            if (t == '\'') {
                return true;
            }
        }
        return false;
    }
    
    public static void main(String[] args) {
        try {
            Controller.getConnection();
        } catch (SQLException ex) {
            System.err.println(ex.getLocalizedMessage());
        }
    }

}
