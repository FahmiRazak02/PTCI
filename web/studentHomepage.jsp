<%-- 
    Document   : studentHomepage
    Created on : Aug 1, 2023, 1:36:13 AM
    Author     : ASUS
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
        <style>
        body {
            background-image: url('img/bg5.jpg'); /* Provide the correct path to your image */
            background-size: cover; /* Ensure the image covers the entire body */
            background-repeat: no-repeat; /* Prevent the image from repeating */
        }
    </style>
        <title>JSP Page</title>
    </head>
    <body>

        <% Integer studentID = (Integer) session.getAttribute("studentID"); %>
        <%
            if (studentID != null && studentID != 0) {
        %>
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg bg-success navbar-dark">
            <!-- Container wrapper -->
            <div class="container-fluid">
                <!-- Navbar brand -->
                <a class="navbar-brand" href="#">PTCI</a>

                </div>
                <!-- Icons -->
                <ul class="navbar-nav d-flex flex-row me-1">
                    <a class="nav-link" href="logoutSerlet">Logout</a>        
                    <li class="navbar-nav">

                    </li>
                </ul>
            </div>
        </nav>
        <br><br><br><br><br><br><br><br><br><br><br>
        <div class="jumbotron bg-transparent  ">
            <h1 class="display-4 d-flex justify-content-center px-5 py-3">Welcome Student</h1>
            <p class="d-flex justify-content-center">Register to enroll in our Courses now!</p>
            <p class="lead d-flex justify-content-center">
                 <a class="btn btn-success btn-lg" href="registerSubjectStudentServlet?studentID=<%= studentID %>" role="button">Register Now</a>
            </p>
        </div>
        <%
        } else {

        %>

        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg bg-success navbar-dark">
            <!-- Container wrapper -->
            <div class="container-fluid">
                <!-- Navbar brand -->
                <a class="navbar-brand" href="#">PTCI</a>

                </div>
                <!-- Icons -->
                <ul class="navbar-nav d-flex flex-row me-1">
                    <a class="nav-link" href="login.jsp">Login</a>        
                    <li class="navbar-nav">

                    </li>
                </ul>
            </div>
        </nav>
             
                    <br><br><br><br><br><br><br><br><br><br><br>
        <div class="jumbotron bg-transparent  ">
            <h1 class="display-4 d-flex justify-content-center px-5 py-3">Welcome Student</h1>
            <p class="d-flex justify-content-center">Please Login to enroll in our Courses now!</p>
            <p class="lead d-flex justify-content-center">
                
            </p>
        </div>

        <%            }
        %>




        <!-- Navbar -->

        <!--bootstrap-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </body>
</html>
