/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ptci.dao;

import Model.Admins;
import Model.Inquiry;
import Model.Payment;
import Model.Student;
import Model.Subject;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import ptci.util.DBConnection;

/**
 *
 * @author HP
 */
public class PtciDB {

   

    public int StudentID(Student student) {
        int StudentID = 0;
        Connection connection = null;
        PreparedStatement stmt = null;
        boolean isAuthenticated = false;

        try {
            connection = DBConnection.createConnection();
            String selectQuery = "SELECT * FROM student WHERE username = ?";
            PreparedStatement selectStatement = connection.prepareStatement(selectQuery);
            selectStatement.setString(1, student.getUsername());

            ResultSet resultSet = selectStatement.executeQuery();
            if (resultSet.next()) {
                String password = resultSet.getString("password");

                if (student.getPassword().equals(password)) {

                    StudentID = resultSet.getInt("studentID");

                    isAuthenticated = true;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return StudentID;
    }

    public boolean isStudent(Student student) {
        Connection connection = null;
        PreparedStatement stmt = null;
        boolean isAuthenticated = false;

        try {
            connection = DBConnection.createConnection();
            String selectQuery = "SELECT * FROM student WHERE username = ?";
            PreparedStatement selectStatement = connection.prepareStatement(selectQuery);
            selectStatement.setString(1, student.getUsername());

            ResultSet resultSet = selectStatement.executeQuery();
            if (resultSet.next()) {
                String password = resultSet.getString("password");

                if (student.getPassword().equals(password)) {

                    isAuthenticated = true;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return isAuthenticated;
    }


    public List<Student> readStudent() {
        List<Student> studentList = new ArrayList<>();

        try (Connection conn = DBConnection.createConnection();
                PreparedStatement stmt = conn.prepareStatement("SELECT * FROM student");
                ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Student student = new Student(); // Instantiate the User object

                student.setStudentID(rs.getInt("studentID"));
                student.setIcNumber(rs.getString("icNumber"));
                student.setStudentName(rs.getString("studentName"));
                student.setEmailAddress(rs.getString("emailAddress"));
                student.setPhoneNumber(rs.getString("phoneNumber"));
                student.setAddress(rs.getString("address"));
                student.setUsername(rs.getString("username"));
                student.setPassword(rs.getString("password"));

                studentList.add(student);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return studentList;
    }


    public List<Subject> readSubject() {
        List<Subject> subjectList = new ArrayList<>();

        try (Connection conn = DBConnection.createConnection();
                PreparedStatement stmt = conn.prepareStatement("SELECT * FROM subject");
                ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Subject subject = new Subject(); // Instantiate the User object

                subject.setSubjectCode(rs.getString("subjectCode"));
                subject.setSubjectName(rs.getString("subjectName"));
                subject.setSubjectPrice(rs.getString("subjectPrice"));

                subjectList.add(subject);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return subjectList;
    }

    

     public boolean updateStudent(Student student) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        boolean success = false;

        try {
            // Create a database connection
            connection = DBConnection.createConnection();

            // Prepare the SQL statement
            String query = "UPDATE student SET icNumber=?, studentName=?, emailAddress=?, phoneNumber=?, address=?, username=?, password=? WHERE studentID=?";
            preparedStatement = connection.prepareStatement(query);

            // Set the parameter values
            
            preparedStatement.setString(1, student.getIcNumber());
            preparedStatement.setString(2, student.getStudentName());
            preparedStatement.setString(3, student.getEmailAddress());
            preparedStatement.setString(4, student.getPhoneNumber());
            preparedStatement.setString(5, student.getAddress());
            preparedStatement.setString(6, student.getUsername());
            preparedStatement.setString(7, student.getPassword());
            preparedStatement.setInt(8, student.getStudentID());

            // Execute the query
            int rowsUpdated = preparedStatement.executeUpdate();
            if (rowsUpdated > 0) {
                success = true;
            }

        } catch (SQLException e) {
            // Handle the exception appropriately
            e.printStackTrace();
        }

        return success;
    }

    public Student getStudent(Student student) {
        try (Connection conn = DBConnection.createConnection();
                PreparedStatement stmt = conn.prepareStatement("SELECT * FROM student WHERE studentID=?")) {

            stmt.setInt(1, student.getStudentID());

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                
                student.setIcNumber(rs.getString("icNumber"));
                student.setStudentName(rs.getString("studentName"));
                student.setEmailAddress(rs.getString("emailAddress"));
                student.setPhoneNumber(rs.getString("phoneNumber"));
                student.setAddress(rs.getString("address"));
                student.setUsername(rs.getString("username"));
                student.setPassword(rs.getString("password"));

                    return student; // Return the retrieved user object
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return null; // Return null if the user retrieval failed or no user found
    }

    public boolean deleteStudent(Student student) {
       try (Connection conn = DBConnection.createConnection();
                PreparedStatement stmt = conn.prepareStatement("DELETE FROM student WHERE studentID = ?")) {

            stmt.setInt(1, student.getStudentID());

            int rowsDeleted = stmt.executeUpdate();
            return rowsDeleted > 0;

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return false;
    }

    public Subject getSubject(Subject subject) {
         try (Connection conn = DBConnection.createConnection();
                PreparedStatement stmt = conn.prepareStatement("SELECT * FROM subject WHERE subjectID=?")) {

            stmt.setInt(1, subject.getSubjectID());

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                 subject.setSubjectID(rs.getInt("subjectID"));
                 subject.setSubjectCode(rs.getString("subjectCode"));
                subject.setSubjectName(rs.getString("subjectName"));
                subject.setSubjectPrice(rs.getString("subjectPrice"));
                

                    return subject; // Return the retrieved user object
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return null; 
    }

    public boolean createPayment(Subject subject, Student student, String form, String paymentMethod) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        boolean success = false;

        try {
            // Create a database connection
            connection = DBConnection.createConnection();

            // Prepare the SQL statement
            String query = "INSERT INTO payment (studentID, icNumber, StudentName, form, subjectcode, subjectName, subjectPrice, paymentMethod) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            preparedStatement = connection.prepareStatement(query);

            // Set the parameter values
            preparedStatement.setInt(1, student.getStudentID() );
            preparedStatement.setString(2, student.getIcNumber());
            preparedStatement.setString(3, student.getStudentName());
            preparedStatement.setString(4, form);
            preparedStatement.setString(5, subject.getSubjectCode());
            preparedStatement.setString(6, subject.getSubjectName());
            preparedStatement.setString(7, subject.getSubjectPrice());
            preparedStatement.setString(8, paymentMethod);
            

            // Execute the query
            preparedStatement.executeUpdate();
            success = true;

        } catch (SQLException e) {
            // Handle the exception appropriately
            e.printStackTrace();
        }

        return success;
    }

    
    public void requestInquiry(Inquiry inquiry){
        String name = inquiry.getName();
        String email = inquiry.getEmail();
        String question = inquiry.getQuestion();
        
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            // Create a database connection
            connection = DBConnection.createConnection();

            // Prepare the SQL statement
            String query = "INSERT INTO Inquiry ( name, email,question) VALUES ( ?, ?,?)";
            preparedStatement = connection.prepareStatement(query);

            // Set the parameter values
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, email);
            preparedStatement.setString(3, question);

            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            // Handle the exception appropriately
            e.printStackTrace();
        }
    }
}
