/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ptci.dao;
import Model.Student;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import ptci.util.DBConnection;
/**
 *
 * @author ASUS
 */
public class SingupDAO {
    
    public String Signup(Student student) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            // Create a database connection
            connection = DBConnection.createConnection();
            
            String query2= "INSERT INTO parent (parentName, parentNumber ) VALUES (?, ?)";
            preparedStatement = connection.prepareStatement(query2);
            preparedStatement.setString(1, student.getParentName());
            preparedStatement.setString(2, student.getParentNumber());
            
            preparedStatement.executeUpdate();
            
            // Prepare the SQL statement
            String query = "INSERT INTO student (icNumber, studentName, emailAddress, phoneNumber, address, username, password ) VALUES (?, ?, ?, ?, ?, ?, ?)";
            preparedStatement = connection.prepareStatement(query);

            // Set the parameter values
            preparedStatement.setString(1, student.getIcNumber());
            preparedStatement.setString(2, student.getStudentName());
            preparedStatement.setString(3, student.getEmailAddress());
            preparedStatement.setString(4, student.getPhoneNumber());
            preparedStatement.setString(5, student.getAddress());
            preparedStatement.setString(6, student.getUsername());
            preparedStatement.setString(7, student.getPassword());

            // Execute the query
             int i= preparedStatement.executeUpdate();
			 
             if (i!=0)  //Just to ensure data has been inserted into the database
             return "SUCCESS"; 

        } catch (SQLException e) {
            // Handle the exception appropriately
            e.printStackTrace();
        }
            return "FAILED";
    }
}

    
    



