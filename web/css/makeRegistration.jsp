<%-- 
    Document   : index
    Created on : Jul 26, 2023, 4:19:46 PM
    Author     : HP
--%>

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

        <% Integer adminID = (Integer) session.getAttribute("adminID"); %>
        <%
            if (adminID != null && adminID != 0) {
        %>
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg bg-info navbar-dark">
            <!-- Container wrapper -->
            <div class="container-fluid">
                <!-- Navbar brand -->
                <a class="navbar-brand" href="#">PTCI</a>
                <div class="navbar-nav d-flex justify-content-center  ">
                    <a class="nav-link active" aria-current="page" href="adminHomepage.jsp">Home</a>
                    <a class="nav-link" href="manageStudentDetailsServlet">Manage Student Details</a>
                    <a class="nav-link" href="manageSubjectServlet">Manage Subject</a>
                    <a class="nav-link" href="#">Register Subject</a>


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
        <nav class="navbar navbar-expand-lg bg-info navbar-dark">
            <!-- Container wrapper -->
            <div class="container-fluid">
                <!-- Navbar brand -->
                <a class="navbar-brand" href="#">PTCI</a>
                <div class="navbar-nav d-flex justify-content-center  ">
                    <a class="nav-link active" aria-current="page" href="adminHomepage.jsp">Home</a>
                    <a class="nav-link" href="#">Make Registration</a>
                    <a class="nav-link" href="manageStudentDetails.jsp">Manage Student Details</a>
                    <a class="nav-link" href="">Manage Subject</a>
                    <a class="nav-link" href="#">Register Subject</a>
                    <a class="nav-link" href="#">Manage Schedule</a>

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

         <!-- sign up -->
        <form class="d-flex justify-content-center align-center mt-5" action="adminMakeRegistration" method="POST">
            <div class="login-container">
                <div class="form-group">
                    <h2 class="d-flex justify-content-center fw-bold mb-2 text-uppercase">SIGN UP STUDENT</h2>
                    <p class="text-dark-50 mb-4">"Create an account for student."</p>
                    <input type="hidden" name="choice" value="student"/>
                     <label for="exampleInputEmail1">NRIC</label>
                    <input type="text" class="form-control" id=""  name="icNumber"><br>
                    
                    <label for="exampleInputEmail1">Student Name</label>
                    <input type="text" class="form-control" id=""  name="studentName"><br>
                    
                    <label for="exampleInputEmail1">Email Address</label>
                    <input type="email" class="form-control" id=""  name="emailAddress"><br>
                    
                     <label for="exampleInputEmail1">Phone Number</label>
                    <input type="text" class="form-control" id=""  name="phoneNumber"><br>
                    
                    <label for="exampleInputEmail1">Address</label>
                    <input type="text" class="form-control" id=""  name="address"><br>
                    
                    <label for="exampleInputEmail1">Username</label>
                    <input type="text" class="form-control" id=""  name="username"><br>
                    
                    <label for="exampleInputPassword1">Password</label>
                    <input type="password" class="form-control mb-3" id="" name="password"><br>
                    
                    
                    
                    <div class="d-flex justify-content-center mb-4 ">
                      
                        <input type="submit" class="btn btn-primary w-50 " value="Submit"/>
                    </div>

                </div>
            </div>
        </form>



        <!-- Navbar -->

        <!--bootstrap-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </body>
</html>
