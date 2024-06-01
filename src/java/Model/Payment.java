/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author HP
 */
public class Payment {
    
    private int paymentID;
    private int studentID;
    private String form;
    private String subjectReg;
    private String refId;
    private String paymentDate;
    private String isPaid;
    private String month;

        public Payment() {
    }

    public Payment(int paymentID, int studentID, String form, String subjectReg, String refId, String paymentDate,String isPaid,String month) {
        this.paymentID = paymentID;
        this.studentID = studentID;
        this.form = form;
        this.subjectReg = subjectReg;
        this.refId = refId;
        this.paymentDate = paymentDate;
        this.isPaid = isPaid;
        this.month = month;
    }

    public String getIsPaid() {
        return isPaid;
    }

    public void setIsPaid(String isPaid) {
        this.isPaid = isPaid;
    }

    public int getPaymentID() {
        return paymentID;
    }

    public void setPaymentID(int paymentID) {
        this.paymentID = paymentID;
    }

    public int getStudentID() {
        return studentID;
    }

    public void setStudentID(int studentID) {
        this.studentID = studentID;
    }

    public String getForm() {
        return form;
    }

    public void setForm(String form) {
        this.form = form;
    }

    public String getSubjectReg() {
        return subjectReg;
    }

    public void setSubjectReg(String subjectReg) {
        this.subjectReg = subjectReg;
    }

    public String getRefId() {
        return refId;
    }

    public void setRefId(String refId) {
        this.refId = refId;
    }

    public String getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(String paymentDate) {
        this.paymentDate = paymentDate;
    }

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }
    
  
}
