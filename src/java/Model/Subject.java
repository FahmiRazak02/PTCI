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
public class Subject implements java.io.Serializable {
    
    private int subjectID;
    private String subjectCode;
    private String subjectName;
    private String subjectPrice;

    public Subject() {
    }

    public Subject(int subjectID, String subjectCode, String subjectName, String subjectPrice) {
        this.subjectID = subjectID;
        this.subjectCode = subjectCode;
        this.subjectName = subjectName;
        this.subjectPrice = subjectPrice;
    }

    public int getSubjectID() {
        return subjectID;
    }

    public void setSubjectID(int subjectID) {
        this.subjectID = subjectID;
    }

    public String getSubjectCode() {
        return subjectCode;
    }

    public void setSubjectCode(String subjectCode) {
        this.subjectCode = subjectCode;
    }

    public String getSubjectName() {
        return subjectName;
    }

    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }

    public String getSubjectPrice() {
        return subjectPrice;
    }

    public void setSubjectPrice(String subjectPrice) {
        this.subjectPrice = subjectPrice;
    }

   
    
    
    
}
