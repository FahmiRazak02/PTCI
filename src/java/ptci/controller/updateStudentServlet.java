/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ptci.controller;

import ptci.dao.PtciDB;
import Model.Student;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HP
 */
public class updateStudentServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet updateStudentServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet updateStudentServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int studentID = Integer.parseInt(request.getParameter("studentID"));

        // Validate form
        Student student = new Student();
        student.setStudentID(studentID);

        // Insert into database
        PtciDB ptciDB = new PtciDB();
        student = ptciDB.getStudent(student);
        request.setAttribute("student", student);
        RequestDispatcher dispatcher = request.getRequestDispatcher("updateStudent.jsp");
        dispatcher.forward(request, response);

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int studentID = Integer.parseInt(request.getParameter("studentID"));
        String icNumber = request.getParameter("icNumber");
        String studentName = request.getParameter("studentName");
        String emailAddress = request.getParameter("emailAddress");
        String phoneNumber = request.getParameter("phoneNumber");
        String address = request.getParameter("address");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Validate form
        List<String> error_messages = new LinkedList<>();
        if (icNumber == null || icNumber.trim().isEmpty()) {
            error_messages.add("Please enter your Ic Number");
        }
        if (studentName == null || studentName.trim().isEmpty()) {
            error_messages.add("Please enter the your name");
        }
        if (emailAddress == null || emailAddress.trim().isEmpty()) {
            error_messages.add("Please enter the your email address");
        }
        if (phoneNumber == null || phoneNumber.trim().isEmpty()) {
            error_messages.add("Please enter the your phone number");
        }
        if (address == null || address.trim().isEmpty()) {
            error_messages.add("Please enter the your address");
        }
        if (username == null || username.trim().isEmpty()) {
            error_messages.add("Please enter the Username");
        }
        if (password == null || password.trim().isEmpty()) {
            error_messages.add("Please enter the Password");
        }
        if (!error_messages.isEmpty()) {
            // JavaScript code to display error messages as a pop-up
            StringBuilder errorMessageBuilder = new StringBuilder();
            for (String error : error_messages) {
                errorMessageBuilder.append(error).append("\\n");
            }
            String errorMessage = errorMessageBuilder.toString();

            response.setContentType("text/html");
            PrintWriter out = response.getWriter();

            out.println("<script type=\"text/javascript\">");
            out.println("alert('" + errorMessage + "');");
            out.println("location='manageStudentDetailsServlet';");
            out.println("</script>");
            return;
        }
        Student student = new Student();
        student.setStudentID(studentID);
        student.setIcNumber(icNumber);
        student.setStudentName(studentName);
        student.setEmailAddress(emailAddress);
        student.setPhoneNumber(phoneNumber);
        student.setAddress(address);
        student.setUsername(username);
        student.setPassword(password);

        // Insert into database
        PtciDB ptciDB = new PtciDB();
        boolean updateStudent = ptciDB.updateStudent(student);
        if (updateStudent) {
            String message = "User was updated successfully.";

            response.setContentType("text/html");
            PrintWriter out = response.getWriter();

            // JavaScript code to display message as a pop-up
            out.println("<script type=\"text/javascript\">");
            out.println("alert('" + message + "');");
            out.println("location='manageStudentDetailsServlet';");
            out.println("</script>");
        } else {
            String errorMessage = "Updated User failed.";

            response.setContentType("text/html");
            PrintWriter out = response.getWriter();

            // JavaScript code to display error message as a pop-up
            out.println("<script type=\"text/javascript\">");
            out.println("alert('" + errorMessage + "');");
            out.println("location='manageStudentDetailsServlet';");
            out.println("</script>");
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
