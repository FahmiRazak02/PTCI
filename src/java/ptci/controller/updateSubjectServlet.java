/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ptci.controller;

import Model.Subject;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ptci.dao.PtciDB;
import ptci.dao.SubjectDAO;


@WebServlet(name = "updateSubjectServlet", urlPatterns = {"/updateSubjectServlet"})
public class updateSubjectServlet extends HttpServlet {

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
            out.println("<title>Servlet updateSubjectServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet updateSubjectServlet at " + request.getContextPath() + "</h1>");
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
       String subjectCode = request.getParameter("subjectCode");

        // Validate form
        Subject subject = new Subject();
        subject.setSubjectCode(subjectCode);

        // Insert into database
        SubjectDAO subjectDAO = new SubjectDAO();
        subject = subjectDAO.getSubject(subject);
        request.setAttribute("subject", subject);
        RequestDispatcher dispatcher = request.getRequestDispatcher("updateSubject.jsp");
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
        String subjectCode = request.getParameter("subjectCode");
        String subjectName = request.getParameter("subjectName");
        String subjectPrice = request.getParameter("subjectPrice");
        
        List<String> error_messages = new LinkedList<>();
        if (subjectCode == null || subjectCode.trim().isEmpty()) {
            error_messages.add("Please INSERT subject Code");
        }
        if (subjectName == null || subjectName.trim().isEmpty()) {
            error_messages.add("Please INSERT subject name");
        }
        if (subjectPrice == null || subjectPrice.trim().isEmpty()) {
            error_messages.add("Please INSERT subject price");
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
            out.println("location='manageSubjectServlet';");
            out.println("</script>");
            return;
        }
        
        Subject subject = new Subject();
        subject.setSubjectCode(subjectCode);
        subject.setSubjectName(subjectName);
        subject.setSubjectPrice(subjectPrice);
        
        SubjectDAO subjectDAO = new SubjectDAO();
        boolean updateSubject = subjectDAO.updateSubject(subject);
        
        if (updateSubject) {
            String message = "Subject was updated successfully.";

            response.setContentType("text/html");
            PrintWriter out = response.getWriter();

            // JavaScript code to display message as a pop-up
            out.println("<script type=\"text/javascript\">");
            out.println("alert('" + message + "');");
            out.println("location='manageSubjectServlet';");
            out.println("</script>");
        } else {
            String errorMessage = "Updated subject failed.";

            response.setContentType("text/html");
            PrintWriter out = response.getWriter();

            // JavaScript code to display error message as a pop-up
            out.println("<script type=\"text/javascript\">");
            out.println("alert('" + errorMessage + "');");
            out.println("location='manageSubjectServlet';");
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
