/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ptci.controller;

import Model.Payment;
import ptci.dao.PtciDB;
import Model.Student;
import Model.Subject;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ptci.dao.PaymentDAO;

/**
 *
 * @author HP
 */
public class registerSubjectStudentServlet extends HttpServlet {

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
            out.println("<title>Servlet registerSubjectStudentServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet registerSubjectStudentServlet at " + request.getContextPath() + "</h1>");
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
        
        PtciDB ptciDB = new PtciDB();
        Student student = new Student();
        student.setStudentID(studentID);
        
        student = ptciDB.getStudent(student);
        
        List<Subject> subjectList = ptciDB.readSubject();
        request.setAttribute("subjectList", subjectList);
        request.setAttribute("student", student);
        RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
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
       String form = request.getParameter("form");
       String date = request.getParameter("paymentDate");
       String refId = request.getParameter("refId");
       String month = request.getParameter("month");
       String[] selectedSubjects0 = request.getParameterValues("selectedSubjects_0");
        String[] selectedSubjects1 = request.getParameterValues("selectedSubjects_1");
        String[] selectedSubjects2 = request.getParameterValues("selectedSubjects_2");
        String[] selectedSubjects3 = request.getParameterValues("selectedSubjects_3");
        String[] selectedSubjects4 = request.getParameterValues("selectedSubjects_4");
        String[] selectedSubjects5 = request.getParameterValues("selectedSubjects_5");
        String[] selectedSubjects6 = request.getParameterValues("selectedSubjects_6");
        String[] selectedSubjects7 = request.getParameterValues("selectedSubjects_7");
        String[] selectedSubjects8 = request.getParameterValues("selectedSubjects_8");
        String[] selectedSubjects9 = request.getParameterValues("selectedSubjects_9");
        String[] selectedSubjects10 = request.getParameterValues("selectedSubjects_10");
        String isPaid = "unpaid";

        Student student = new Student();
        student.setStudentID(studentID);

        if (studentID <= 0) {
            String errorMessage = "Invalid studentID or subjectID.";

            response.setContentType("text/html");
            PrintWriter out = response.getWriter();

            // JavaScript code to display error message as a pop-up
            out.println("<script type=\"text/javascript\">");
            out.println("alert('" + errorMessage + "');");
            out.println("location='registerSubjectStudentServlet';"); // Redirect to an appropriate page
            out.println("</script>");
            return;
        }
        

        String concatenatedSubjects = getConcatenatedSubjects(selectedSubjects0, selectedSubjects1, selectedSubjects2,selectedSubjects3,selectedSubjects4,selectedSubjects5,selectedSubjects6,selectedSubjects7,selectedSubjects8,selectedSubjects9,selectedSubjects10);
        
        Payment payment = new Payment();
        
        payment.setStudentID(studentID);
        payment.setForm(form);
        payment.setSubjectReg(concatenatedSubjects);
        payment.setMonth(month);
        payment.setRefId(refId);
        payment.setPaymentDate(date);
        payment.setIsPaid(isPaid);
        
           
        PaymentDAO paymentDAO = new PaymentDAO();
       
        
        if (paymentDAO.checkRecipientRefExists(refId)) {
    String errorMessage = "This recipient reference already exists. Please use a different one.";

    response.setContentType("text/html");
    PrintWriter out = response.getWriter();
    out.println("<script type=\"text/javascript\">");
    out.println("alert('" + errorMessage + "');");
    out.println("history.back();"); // Go back to the previous page
    out.println("</script>");
    return;
}
         String isPayment = paymentDAO.payment(payment);
        if(isPayment.equals("SUCCESS"))   //On success, you can display a message to user on Home page
		 {
		String message = "Payment submitted successfully.";

                response.setContentType("text/html");
                PrintWriter out = response.getWriter();

                // JavaScript code to display message as a pop-up
                out.println("<script type=\"text/javascript\">");
                out.println("alert('" + message + "');");
                out.println("location='studentHomepage.jsp';");
                out.println("</script>");
		 }
		 else   //On Failure, display a meaningful message to the User.
		 {
			String errorMessage = "Payment submitted failed.";

                response.setContentType("text/html");
                PrintWriter out = response.getWriter();

                // JavaScript code to display error message as a pop-up
                out.println("<script type=\"text/javascript\">");
                out.println("alert('" + errorMessage + "');");
                out.println("window.location.href='registerSubjectStudentServlet?studentID=" + studentID + "';"); // Redirect to registerSubjectStudentServlet with studentID
                out.println("</script>");
		 }
    }

    
    
    
    
    
    
    // Function to concatenate subjects into a string separated by commas
    private String getConcatenatedSubjects(String[] subjects0, String[] subjects1, String[] subjects2,String[] subjects3,String[] subjects4,String[] subjects5,String[] subjects6,String[] subjects7,String[] subjects8,String[] subjects9,String[] subjects10) {
        StringBuilder concatenatedSubjects = new StringBuilder();

        appendSubjects(concatenatedSubjects, subjects0);
        appendSubjects(concatenatedSubjects, subjects1);
        appendSubjects(concatenatedSubjects, subjects2);
        appendSubjects(concatenatedSubjects, subjects3);
        appendSubjects(concatenatedSubjects, subjects4);
        appendSubjects(concatenatedSubjects, subjects5);
        appendSubjects(concatenatedSubjects, subjects6);
        appendSubjects(concatenatedSubjects, subjects7);
        appendSubjects(concatenatedSubjects, subjects8);
        appendSubjects(concatenatedSubjects, subjects9);
        appendSubjects(concatenatedSubjects, subjects10);
        

        // Remove the trailing comma, if any
        if (concatenatedSubjects.length() > 0) {
            concatenatedSubjects.deleteCharAt(concatenatedSubjects.length() - 1);
        }

        return concatenatedSubjects.toString();
    }

    // Helper function to append subjects to the StringBuilder
 private void appendSubjects(StringBuilder builder, String[] subjects) {
    if (subjects != null && subjects.length > 0) {
        for (String subject : subjects) {
            builder.append(subject).append(", ");
        }
    }
}}
