/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ptci.dao;

import Model.Admins;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import ptci.util.DBConnection;

public class AdminSignupDAO {
    
    public String AdminSignup(Admins admins) {
        try (Connection connection = DBConnection.createConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO admin (adminName, emailAddress, phoneNumber, username, password) VALUES (?, ?, ?, ?, ?)")) {

            // Set the parameter values
            preparedStatement.setString(1, admins.getAdminName());
            preparedStatement.setString(2, admins.getEmailAddress());
            preparedStatement.setString(3, admins.getPhoneNumber());
            preparedStatement.setString(4, admins.getUsername());
            preparedStatement.setString(5, admins.getPassword());

            // Execute the query
            int result = preparedStatement.executeUpdate();

            if (result > 0) {
                return "SUCCESS";
            } else {
                return "FAILED";
            }
        } catch (SQLException e) {
            // Handle the exception, log it, and consider returning a more descriptive error message.
            e.printStackTrace();
            return "FAILED: An error occurred while signing up: " + e.getMessage();
        }
    }
}
