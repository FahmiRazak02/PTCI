/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ptci.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author HP
 */
public class DBConnection {
    public static Connection createConnection() throws SQLException {
        String dbURL = "jdbc:derby://localhost:1527/ptci";
        String user = "web";
        String password = "web";

        Connection connection = DriverManager.getConnection(dbURL, user, password);
        return connection;
    }
    
}
