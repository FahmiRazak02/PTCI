<%-- 
    Document   : updateSubject
    Created on : Oct 21, 2023, 1:59:32 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="subject" scope="request" class="Model.Subject" />
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
        
        <% String adminName = (String) session.getAttribute("adminName"); %>
        <%
            if (adminName != null) {
        %>
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg bg-danger navbar-dark">
            <!-- Container wrapper -->
            <div class="container-fluid">
                <!-- Navbar brand -->
                <a class="navbar-brand" href="index.jsp">PTCI</a>
                <div class="navbar-nav d-flex justify-content-center  ">
                    <a class="nav-link active" aria-current="page" href="adminHomepage.jsp">Home</a>
                    <a class="nav-link" href="manageStudentDetailsServlet">Manage Student Details</a>
                    <a class="nav-link" href="manageSubjectServlet">Manage Subject</a>


                </div>
                <!-- Icons -->
                <ul class="navbar-nav d-flex flex-row me-1">
                    <a class="nav-link" href="adminLogoutServlet">Logout</a>        
                    <li class="navbar-nav">

                    </li>
                </ul>
            </div>
        </nav>
        <%
        } else {

        %>

        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg bg-danger navbar-dark">
            <!-- Container wrapper -->
            <div class="container-fluid">
                <!-- Navbar brand -->
                <a class="navbar-brand" href="index.jsp">PTCI</a>
                <div class="navbar-nav d-flex justify-content-center ">
                    <a class="nav-link active" aria-current="page" href="adminHomepage.jsp">Home</a>
                    <a class="nav-link" href="manageStudentDetails.jsp">Manage Student Details</a>
                    <a class="nav-link" href="manageSubject.jsp">Manage Subject</a>


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
       
        
        
        <form class="d-flex justify-content-center align-center mt-5" action="updateSubjectServlet" method="POST">
            <div class="login-container">
                <div class="form-group">
                    <h2 class="d-flex justify-content-center fw-bold mb-2 text-uppercase">Update Subject</h2>
                    <p class="text-dark-50 mb-4">"Edit a subject."</p>
                    
                     <label for="exampleInputEmail1">Subject Code</label>
                     <input type="text" class="form-control" id="" name="subjectCode" value="<jsp:getProperty name="subject" property="subjectCode" />"><br>
                    
                    <label for="exampleInputEmail1">Subject Name</label>
                    <input type="text" class="form-control" id="" name="subjectName" value="<jsp:getProperty name="subject" property="subjectName" />" ><br>
                    
                    <label for="exampleInputEmail1">Subject Price</label>
                    <input type="text" class="form-control" id="" name="subjectPrice" value="<jsp:getProperty name="subject" property="subjectPrice" />"><br>
                    
                    <div class="d-flex justify-content-center mb-4 ">
                      
                        
                        <input type="submit" class="btn btn-primary w-50 " value="Submit"/>
                    </div>

                </div>
            </div>
        </form>
        
        
        <!--bootstrap-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </body>
</html>
