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
import java.util.LinkedList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ptci.dao.SingupDAO;


/**
 *
 * @author HP
 */
public class signupServlet extends HttpServlet {

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
            out.println("<title>Servlet signupServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet signupServlet at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
           
             String icNumber = request.getParameter("icNumber");
            String studentName = request.getParameter("studentName");
            String emailAddress = request.getParameter("emailAddress");
            String phoneNumber = request.getParameter("phoneNumber");
            String address = request.getParameter("address");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String parentName = request.getParameter("parentName");
            String parentNumber = request.getParameter("pphoneNumber");
            
            List<String> error_messages = new LinkedList<>();
            if (icNumber == null || icNumber.trim().isEmpty()) {
                error_messages.add("Please enter the your Ic Number");
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
                out.println("location='signup.jsp';");
                out.println("</script>");
                return;
            }
            
            Student student = new Student();
            
            student.setIcNumber(icNumber);
            student.setStudentName(studentName);
            student.setEmailAddress(emailAddress);
            student.setPhoneNumber(phoneNumber);
            student.setAddress(address);
            student.setUsername(username);
            student.setPassword(password);
            student.setParentName(parentName);
            student.setParentNumber(parentNumber);
            
            SingupDAO singupDAO = new SingupDAO();
            String Student = singupDAO.Signup(student);
            
            
		 if(Student.equals("SUCCESS"))   //On success, you can display a message to user on Home page
		 {
		String message = "New User was created successfully.";

                response.setContentType("text/html");
                PrintWriter out = response.getWriter();

                // JavaScript code to display message as a pop-up
                out.println("<script type=\"text/javascript\">");
                out.println("alert('" + message + "');");
                out.println("location='login.jsp';");
                out.println("</script>");
		 }
		 else   //On Failure, display a meaningful message to the User.
		 {
			String errorMessage = "Created User failed.";

                response.setContentType("text/html");
                PrintWriter out = response.getWriter();

                // JavaScript code to display error message as a pop-up
                out.println("<script type=\"text/javascript\">");
                out.println("alert('" + errorMessage + "');");
                out.println("history.back();");
                out.println("</script>");
		 }

}
}
