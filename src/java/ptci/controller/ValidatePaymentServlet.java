/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ptci.controller;

import Model.Payment;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ptci.dao.PaymentDAO;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "ValidatePaymentServlet", urlPatterns = {"/ValidatePaymentServlet"})
public class ValidatePaymentServlet extends HttpServlet {

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
            out.println("<title>Servlet ValidatePaymentServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ValidatePaymentServlet at " + request.getContextPath() + "</h1>");
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
        int paymentID = Integer.parseInt(request.getParameter("paymentID"));

        // Validate form
        Payment payment = new Payment();
        payment.setPaymentID(paymentID);

        // Insert into database
        PaymentDAO paymentdao = new PaymentDAO();
        payment = paymentdao.getPayment(payment);
        request.setAttribute("payment", payment);
        RequestDispatcher dispatcher = request.getRequestDispatcher("validateStatus.jsp");
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
       
       int paymentID = Integer.parseInt(request.getParameter("paymentID"));
       int studentID = Integer.parseInt(request.getParameter("studentID"));
       String form = request.getParameter("form");
       String subjectReg = request.getParameter("subjectReg");
       String month = request.getParameter("month");
       String refId = request.getParameter("refId");
       String paymentDate = request.getParameter("paymentDate");
       String isPaid = request.getParameter("isPaid");
       
       Payment payment = new Payment();
       payment.setPaymentID(paymentID);
       payment.setStudentID(studentID);
       payment.setForm(form);
       payment.setSubjectReg(subjectReg);
       payment.setMonth(month);
       payment.setRefId(refId);
       payment.setPaymentDate(paymentDate);
       payment.setIsPaid(isPaid);
       
//       PrintWriter  out = response.getWriter();
//       out.println(payment.getPaymentID());
//       out.println(payment.getStudentID());
//       out.println(payment.getForm());
//       out.println(payment.getSubjectReg());
//       out.println(payment.getMonth());
//       out.println(payment.getRefId());
//       out.println(payment.getPaymentDate());
//       out.println(payment.getIsPaid());
       
       
       PaymentDAO paymentdao = new PaymentDAO();
       boolean updatePayment = paymentdao.updatePayment(payment);
       
       if (updatePayment) {
            String message = "Payment was validated successfully.";

            response.setContentType("text/html");
            PrintWriter out = response.getWriter();

            // JavaScript code to display message as a pop-up
            out.println("<script type=\"text/javascript\">");
            out.println("alert('" + message + "');");
            out.println("location='managePayment';");
            out.println("</script>");
        } else {
            String errorMessage = "validate payment failed.";

            response.setContentType("text/html");
            PrintWriter out = response.getWriter();

            // JavaScript code to display error message as a pop-up
            out.println("<script type=\"text/javascript\">");
            out.println("alert('" + errorMessage + "');");
            out.println("location='managePayment';");
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
