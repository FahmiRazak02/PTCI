/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ptci.dao;

import Model.Payment;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import ptci.util.DBConnection;

/**
 *
 * @author ASUS
 */
public class PaymentDAO {
    
    public String payment(Payment payment){
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        
        try {
            // Create a database connection
            connection = DBConnection.createConnection();
            
            // Prepare the SQL statement
            String query = "INSERT INTO payment(studentID, form, subjectReg, month, refId, paymentDate,isPaid ) VALUES (?, ?, ?, ?, ?, ?, ?)";
            preparedStatement = connection.prepareStatement(query);

            // Set the parameter values
            preparedStatement.setInt(1, payment.getStudentID());
            preparedStatement.setString(2, payment.getForm());
            preparedStatement.setString(3, payment.getSubjectReg());
            preparedStatement.setString(4, payment.getMonth());
            preparedStatement.setString(5, payment.getRefId());
            preparedStatement.setString(6, payment.getPaymentDate());
            preparedStatement.setString(7, payment.getIsPaid());
            

            // Execute the query
             int i= preparedStatement.executeUpdate();
			 
             if (i!=0) {
             return "SUCCESS"; 
             } //Just to ensure data has been inserted into the database
             

        } catch (SQLException e) {
            // Handle the exception appropriately
            e.printStackTrace();
        }
            return "FAILED";
    }
    
    public List<Payment> readPayment() {
        List<Payment> paymentList = new ArrayList<>();

        try (Connection conn = DBConnection.createConnection();
                PreparedStatement stmt = conn.prepareStatement("SELECT * FROM payment");
                ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Payment payment = new Payment(); // Instantiate the User object
                
                payment.setPaymentID(rs.getInt("paymentID"));
                payment.setStudentID(rs.getInt("studentID"));
                payment.setForm(rs.getString("form"));
                payment.setSubjectReg(rs.getString("subjectReg"));
                payment.setMonth(rs.getString("month"));
                payment.setRefId(rs.getString("refId"));
                payment.setPaymentDate(rs.getString("paymentDate"));
                payment.setIsPaid(rs.getString("isPaid"));

                paymentList.add(payment);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return paymentList;
    }
    public Payment getPayment(Payment payment) {
        try (Connection conn = DBConnection.createConnection();
                PreparedStatement stmt = conn.prepareStatement("SELECT * FROM payment WHERE paymentID=?")) {

            stmt.setInt(1, payment.getPaymentID());

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                payment.setPaymentID(rs.getInt("paymentID"));
                payment.setStudentID(rs.getInt("studentID"));
                payment.setForm(rs.getString("form"));
                payment.setSubjectReg(rs.getString("subjectReg"));
                payment.setMonth(rs.getString("month"));
                payment.setRefId(rs.getString("refId"));
                payment.setPaymentDate(rs.getString("paymentDate"));
                payment.setIsPaid(rs.getString("isPaid"));

                    return payment; // Return the retrieved user object
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return null; // Return null if the user retrieval failed or no user found
    }
    public boolean updatePayment(Payment payment) {
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    boolean success = false;

    try {
        // Create a database connection
        connection = DBConnection.createConnection();

        // Prepare the SQL statement
        String query = "UPDATE payment SET studentID=?, form=?, subjectReg=?, month=?, refId=?, paymentDate=?, isPaid=? WHERE paymentID=?";
        preparedStatement = connection.prepareStatement(query);

        // Set the parameter values
        preparedStatement.setInt(1, payment.getStudentID());
        preparedStatement.setString(2, payment.getForm());
        preparedStatement.setString(3, payment.getSubjectReg());
        preparedStatement.setString(4, payment.getMonth());
        preparedStatement.setString(5, payment.getRefId());
        preparedStatement.setString(6, payment.getPaymentDate());
        preparedStatement.setString(7, payment.getIsPaid());
        preparedStatement.setInt(8, payment.getPaymentID());

        // Execute the query
        int rowsUpdated = preparedStatement.executeUpdate();
        if (rowsUpdated > 0) {
            success = true;
        }

    } catch (SQLException e) {
        // Handle the exception appropriately
        e.printStackTrace();
    } finally {
        // Close the resources in the finally block to ensure they are released
        try {
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    return success;
}
    public boolean deletePayment(Payment payment) {
       try (Connection conn = DBConnection.createConnection();
                PreparedStatement stmt = conn.prepareStatement("DELETE FROM payment WHERE paymentID = ?")) {

            stmt.setInt(1, payment.getPaymentID());

            int rowsDeleted = stmt.executeUpdate();
            return rowsDeleted > 0;

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return false;
    }
    public boolean checkRecipientRefExists(String refId) {
    String query = "SELECT COUNT(*) FROM payment WHERE refId = ?";

    try (Connection connection = DBConnection.createConnection();
         PreparedStatement preparedStatement = connection.prepareStatement(query)) {

        preparedStatement.setString(1, refId);
        try (ResultSet resultSet = preparedStatement.executeQuery()) {
            if (resultSet.next()) {
                return resultSet.getInt(1) > 0;
            }
        }
    } catch (SQLException e) {
        // Consider logging the exception here
        e.printStackTrace();
    }

    return false;
}

}
