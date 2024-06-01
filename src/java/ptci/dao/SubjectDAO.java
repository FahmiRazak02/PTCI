/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ptci.dao;

import Model.Student;
import Model.Subject;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import ptci.util.DBConnection;

/**
 *
 * @author ASUS
 */
public class SubjectDAO {
    
   public String createSubject(Subject subject) {
    Connection connection = null;
    PreparedStatement preparedStatement = null;

    try {
        // Create a database connection
        connection = DBConnection.createConnection();

        // Prepare the SQL statement
        String query = "INSERT INTO subject(subjectCode, subjectName, subjectPrice) VALUES (?, ?, ?)";
        preparedStatement = connection.prepareStatement(query);

        // Set the parameter values
        preparedStatement.setString(1, subject.getSubjectCode());
        preparedStatement.setString(2, subject.getSubjectName());
        preparedStatement.setString(3, subject.getSubjectPrice());

        int rowsAffected = preparedStatement.executeUpdate();

        // Check if the insert was successful
        if (rowsAffected > 0) {
            return "SUCCESS";
        } else {
            return "Failed to insert subject.";
        }

    } catch (SQLException e) {
        // Log the exception or return an error message
        e.printStackTrace(); // For development, consider using logging in production
        return "An error occurred while inserting the subject.";
}
     


   }
   public boolean deleteSubject(Subject subject) {
       try (Connection conn = DBConnection.createConnection();
                PreparedStatement stmt = conn.prepareStatement("DELETE FROM subject WHERE subjectCode = ?")) {

            stmt.setString(1, subject.getSubjectCode());

            int rowsDeleted = stmt.executeUpdate();
            return rowsDeleted > 0;

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return false;
    }
   
    public Subject getSubject(Subject subject){
        try (Connection conn = DBConnection.createConnection();
                PreparedStatement stmt = conn.prepareStatement("SELECT * FROM subject WHERE subjectCode=?")) {

            stmt.setString(1, subject.getSubjectCode());

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                
		subject.setSubjectCode(rs.getString("subjectCode"));
                subject.setSubjectName(rs.getString("subjectName"));
                subject.setSubjectPrice(rs.getString("subjectPrice"));

                    return subject; // Return the retrieved user object
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return null; // Return null if the user retrieval failed or no user found
    }
    public boolean updateSubject(Subject subject) {
    String query = "UPDATE subject SET subjectName=?, subjectPrice=? WHERE subjectCode=?";

    try (Connection connection = DBConnection.createConnection();
         PreparedStatement preparedStatement = connection.prepareStatement(query)) {

        // Set parameters
        preparedStatement.setString(1, subject.getSubjectName());
        preparedStatement.setString(2, subject.getSubjectPrice());
        preparedStatement.setString(3, subject.getSubjectCode());

        // Execute the query
        int rowsUpdated = preparedStatement.executeUpdate();
        return rowsUpdated > 0;

    } catch (SQLException e) {
        // Log the exception here (consider using a logging framework)
        e.printStackTrace();
        return false;
    }
}

}
