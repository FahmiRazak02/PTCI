/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ptci.dao;

import Model.Admins;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import ptci.util.DBConnection;

/**
 *
 * @author ASUS
 */
public class AdminLoginDAO {
    
   public String authenticateAdmin(Admins admins) {
    String userName = admins.getUsername();
    String password = admins.getPassword(); // Assuming this is a hashed password

    String sql = "SELECT password FROM admin WHERE username = ?";
    
    try (Connection con = DBConnection.createConnection();
         PreparedStatement preparedStatement = con.prepareStatement(sql)) {
        
        preparedStatement.setString(1, userName);

        try (ResultSet resultSet = preparedStatement.executeQuery()) {
            if (resultSet.next()) {
                String storedPassword = resultSet.getString("password");
                if (password.equals(storedPassword)) { // You should use a password hashing comparison here
                    return "SUCCESS";
                }
            }
        }
        return "Invalid user credentials";
    } catch (SQLException e) {
        e.printStackTrace();
        return "Error occurred during login";
    }
}
}
