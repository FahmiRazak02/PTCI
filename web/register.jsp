<%-- 
    Document   : index
    Created on : Jul 26, 2023, 4:19:46 PM
    Author     : HP
--%>



<%@page import="Model.Subject"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Model.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <!--bootstrap-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <!--fontawsome-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" 
              integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" 
              crossorigin="anonymous" referrerpolicy="no-referrer" />

        <title>JSP Page</title>
    </head>
    <body>

        <% Integer studentID = (Integer) session.getAttribute("studentID"); %>
        <% String icNumber = (String) session.getAttribute("icNumber"); %>
        <%
            if (studentID != null && studentID != 0) {
        %>
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg bg-success navbar-dark">
            <!-- Container wrapper -->
            <div class="container-fluid">
                <!-- Navbar brand -->
                <a class="navbar-brand" href="studentHomepage.jsp">PTCI</a>


                </div>
                <!-- Icons -->
                <ul class="navbar-nav d-flex flex-row me-1">
                    <a class="nav-link" href="logoutSerlet">Logout</a>        
                    <li class="navbar-nav">

                    </li>
                </ul>
            </div>
        </nav>
        <%
        } else {

        %>

        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg bg-success navbar-dark">
            <!-- Container wrapper -->
            <div class="container-fluid">
                <!-- Navbar brand -->
                <a class="navbar-brand" href="#">PTCI</a>
                <div class="navbar-nav d-flex justify-content-center  ">
                    <a class="nav-link active" aria-current="page" href="studentHomepage.jsp">Home</a>

                </div>
                <!-- Icons -->
                <ul class="navbar-nav d-flex flex-row me-1">
                    <a class="nav-link" href="login.jsp">Login</a>        
                    <li class="navbar-nav">

                    </li>
                </ul>
            </div>
        </nav>

        <%            }
        %>

        <!--content-->
        <section class="deliveryInfo py-5 px-5 ">
            <div class="row d-flex justify-content-center">
                <div class="col-md-8 mb-4">
                    <div class="card mb-4">
                        <div class="card-header py-3">
                            <h5 class="mb-0 d-flex justify-content-center">REGISTER SUBJECT</h5>
                        </div>
                        <div class="card-body">
                            <%
                                Student student = (Student) request.getAttribute("student");
                                List subjectList = (List) request.getAttribute("subjectList");
                            %>
                            <form id="registrationForm" action="registerSubjectStudentServlet" method="POST">

                                <!-- Email input -->
                                
                                <!-- Student Name input -->
                                <div class="form-outline mb-4">
                                    <label class="form-label d-flex justify-content-between" for="form7Example6">Student Name</label>
                                    <h6 class="form-label d-flex justify-content-between" for="form7Example6">${student.studentName}</h6>
                                </div>
                                
                                <!-- NRIC input -->
                                <div class="form-outline mb-4">
                                    <label class="form-label d-flex justify-content-between" for="form7Example6">NRIC</label>
                                    <h6 class="form-label d-flex justify-content-between" for="form7Example6">${student.icNumber}</h6>
                                </div>


                                <div class="form-outline mb-4">
                                    <label class="form-label d-flex justify-content-between" for="form7Example6" >Select Form</label>
                                    <select class="form-control my-3 d-flex justify-content-between" name="form" id="formSelection" >
                                         <option value="" disabled selected>Select Form</option>
                                          <option value="Form 3">FORM 3</option>
                                           <option value="Form 4">FORM 4</option>
                                            <option value="Form 5">FORM 5</option>
                                      </select>
                                </div>

                                <label class="form-label d-flex justify-content-between" for="form7Example6" >Please select the subject you would like to attend</label>


                                <!-- Select Subject -->
                                <div class="form-outline mb-4">
                                    <label class="form-label d-flex justify-content-between" for="form7Example6"></label>
                                    
                                     
                                
                            <%
                              Iterator iterator = subjectList.iterator();
                              int counter = 0;  // Add a counter to generate unique names
                              while (iterator.hasNext()) {
                              Subject subject = (Subject) iterator.next();
                            %>
                               <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="subject_<%= subject.getSubjectID()%>" 
                                    name="selectedSubjects_<%= counter %>" value="<%= subject.getSubjectName()%>">
                                    <label class="form-check-label" for="subject_<%= subject.getSubjectID()%>">
                                    <%= subject.getSubjectCode() %> - <%= subject.getSubjectName()%> (RM <%= subject.getSubjectPrice()%>)
                                    </label>
                                </div>
                                <%
                                    counter++;}
                                %>
                                 </div>
                                 
                                 <div class="form-outline mb-4">
                                    <label class="form-label d-flex justify-content-between" for="form7Example6" >Select Month to Pay</label>
                                    <select class="form-control my-3 d-flex justify-content-between" name="month" >
                                        <option value="" disabled selected>Select Form</option>
                                        <option value="January" >January</option>
                                        <option value="February" >February</option>
                                        <option value="March" >March</option>
                                        <option value="April" >April</option>
                                        <option value="June" >June</option>
                                        <option value="July" >July</option>
                                        <option value="August" >August</option>
                                        <option value="October" >October</option>
                                        <option value="November" >November</option>
                                        <option value="Disember" >Disember</option>
                                    </select>
                                </div>
                                 <hr class="rounded">
                                 
                                <div class="text-center justify-content-center align-center mt-5">
                                    <img src="css/qrr.jpg" class="rounded" style="max-width:20%;" >
                                </div>
                                 <br>
                                 <p style="text-align:center;">Please scan <strong>QR code</strong> above to make payment</p>
                                <!-- Select input -->
                                
                                <div class="form-outline mb-4">
                                    <label class="form-label d-flex justify-content-between" for="form7Example6" >Recipient Reference</label>
                                    <input class="form-control my-3 d-flex justify-content-between" type="text"  name="refId" required>
                                </div>
                                
                                <div class="form-outline mb-4">
                                    <label class="form-label d-flex justify-content-between" for="form7Example6" >Payment Date</label>
                                    <input class="form-control my-3 d-flex justify-content-between" type="date"  name="paymentDate" required>
                                </div>
                                
                                

                                
                                <input type="hidden" name="studentID" value="<%= studentID %>">
                                <input type="hidden" name="icNumber" value="<%= icNumber %>">
                                <input  type="submit" value="Submit" class="btn btn-primary btn-lg btn-block ">

                                


                            </form>
                        </div>
                    </div>
                </div>


            </div>

        </section>
                                

        <!-- Navbar -->
       

        <!--bootstrap-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
</script>

<script>
    function isAnySubjectChecked() {
        var counter = 0;
        while (document.getElementById('subject_' + counter) != null) {
            if (document.getElementById('subject_' + counter).checked) {
                console.log('At least one subject is checked.');
                return true;
            }
            counter++;
        }
        console.log('No subjects are checked.');
        return false;
    }

    function isMonthSelected() {
        var monthSelect = document.querySelector("select[name='month']");
        if (monthSelect && monthSelect.value !== "") {
            console.log('Month is selected.');
            return true;
        } else {
            console.log('Month is not selected.');
            return false;
        }
    }

    window.onload = function() {
        document.getElementById('registrationForm').addEventListener('submit', function(event) {
            var formSelection = document.getElementById('formSelection').value;

            // First, check the form selection
            if (formSelection === "") {
                alert("Please select your form.");
                event.preventDefault(); // Prevent form submission
            } 
            // Then, if form selection is fine, check the subjects
            else if (!isAnySubjectChecked()) {
                alert("Please select at least one subject.");
                event.preventDefault(); // Prevent form submission
            }
            else if (!isMonthSelected()) {
                alert("Please select a month for payment.");
                event.preventDefault(); // Prevent form submission
            }
        });
    };
</script>


    </body>
</html>
