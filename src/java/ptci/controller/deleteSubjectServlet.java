/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ptci.controller;

import Model.Subject;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ptci.dao.SubjectDAO;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "deleteSubjectServlet", urlPatterns = {"/deleteSubjectServlet"})
public class deleteSubjectServlet extends HttpServlet {

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
            out.println("<title>Servlet deleteSubjectServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet deleteSubjectServlet at " + request.getContextPath() + "</h1>");
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
        
        Subject subject = new Subject();
        subject.setSubjectCode(subjectCode);
        
        SubjectDAO subjectDAO = new SubjectDAO();
        
        boolean isDeleted = subjectDAO.deleteSubject(subject);
        
        if (isDeleted) {
                String message = "Subject was deleted successfully.";

                response.setContentType("text/html");
                PrintWriter out = response.getWriter();

                // JavaScript code to display message as a pop-up
                out.println("<script type=\"text/javascript\">");
                out.println("alert('" + message + "');");
                out.println("location='manageSubjectServlet';");
                out.println("</script>");
            } else {
                String errorMessage = "Deleted subject failed.";

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
        processRequest(request, response);
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
