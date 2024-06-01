/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ptci.controller;

import Model.Admins;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import ptci.dao.AdminSignupDAO;

/**
 *
 * @author HP
 */
public class adminSignupServlet extends HttpServlet {

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
            out.println("<title>Servlet adminSignupServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet adminSignupServlet at " + request.getContextPath() + "</h1>");
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
            
            String adminName = request.getParameter("adminName");
            String emailAddress = request.getParameter("emailAddress");
            String phoneNumber = request.getParameter("phoneNumber");
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            // Validate form
            List<String> error_messages = new LinkedList<>();
            
            if (adminName == null || adminName.trim().isEmpty()) {
                error_messages.add("Please enter the your name");
            }
            if (emailAddress == null || emailAddress.trim().isEmpty()) {
                error_messages.add("Please enter the your email address");
            }
            if (phoneNumber == null || phoneNumber.trim().isEmpty()) {
                error_messages.add("Please enter the your phone number");
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
                out.println("location='adminSignup.jsp';");
                out.println("</script>");
                return;
            }
            Admins admins = new Admins();
           
            admins.setAdminName(adminName);
            admins.setEmailAddress(emailAddress);
            admins.setPhoneNumber(phoneNumber);
            admins.setUsername(username);
            admins.setPassword(password);
            
            
            // Insert into database
            AdminSignupDAO adminSignupDAO = new AdminSignupDAO();
            String Admins = adminSignupDAO.AdminSignup(admins);
            if (Admins.equals("SUCCESS")) {
                String message = "New User was created successfully.";

                response.setContentType("text/html");
                PrintWriter out = response.getWriter();

                // JavaScript code to display message as a pop-up
                out.println("<script type=\"text/javascript\">");
                out.println("alert('" + message + "');");
                out.println("location='adminHomepage.jsp';");
                out.println("</script>");
            } else {
                String errorMessage = "Created User failed.";

                response.setContentType("text/html");
                PrintWriter out = response.getWriter();

                // JavaScript code to display error message as a pop-up
                out.println("<script type=\"text/javascript\">");
                out.println("alert('" + errorMessage + "');");
                out.println("location='adminSignup.jsp';");
                out.println("</script>");
            }
        }

}
