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
        <style>
        body {
            background-image: url('img/bg7.jpg'); /* Provide the correct path to your image */
            background-size: cover; /* Ensure the image covers the entire body */
            background-repeat: no-repeat; /* Prevent the image from repeating */
        }
        

    </style>
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
                <a class="navbar-brand" aria-current="page" href="adminHomepage.jsp">PTCI</a>
                <div class="navbar-nav d-flex justify-content-center  ">

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
                <a class="navbar-brand" href="#">PTCI</a>
                

                </div>
                <!-- Icons -->
                <ul class="navbar-nav d-flex flex-row me-1">
                    <a class="nav-link" href="adminLogin.jsp">Login</a>        
                    <li class="navbar-nav">

                    </li>
                </ul>
            </div>
        </nav>

        <%            }
        %>




        <!--content-->
        
        <%
            if (adminName != null) {
        %>
        <div class=" bg-transparent jumbotron ">
            <br><br><br><br><br><br><br>
            <h1 class="display-4 d-flex justify-content-center px-5 py-3">PUSAT TUISYEN CIKGU IBRAHIM</h1>
            <h2 class="d-flex justify-content-center"> ADMIN PAGE</h2>    
        </div>
            
                <!-- Navbar brand -->
               <!-- Navbar brand -->
<!-- Navbar brand -->
<div class="text-center mt-5">
    <div class="container-fluid">
        <div class="row justify-content-center mb-3">
            <a class="btn btn-outline-danger d-flex align-items-center justify-content-center" style="font-size: 20px;width: 250px; height: 120px; margin-right: 25px;" href="manageStudentDetailsServlet"><b>Student Management</b></a>
            <a class="btn btn-danger d-flex align-items-center justify-content-center" style="font-size: 20px;width: 250px; height: 120px;" href="manageSubjectServlet" role="button">Subject Management</a>
        </div>
        <div class="row justify-content-center mb-3">
            <a class="btn btn-danger d-flex align-items-center justify-content-center text-center" style="font-size: 20px;width: 250px; height: 120px; margin-right: 25px;" type="submit" href="managePayment">Validate Payment</a>
            <a class="btn btn-outline-danger d-flex align-items-center justify-content-center" style="font-size: 20px;width: 250px; height: 120px;" type="button" href="adminSignup.jsp" ><b>Admin Signup</b></a>
        </div>
    </div>
</div>

        <%
            } else {

        %>
        
        <div class=" bg-transparent jumbotron ">
            <br><br><br><br><br><br><br><br><br><br><br><br>
            <h1 class="display-4 d-flex justify-content-center px-5 py-3">PUSAT TUISYEN CIKGU IBRAHIM</h1>
            <h2 class="d-flex justify-content-center"> ADMIN PAGE</h2><br>
            <h5 class=" d-flex justify-content-center">To access administration features, Please LOGIN!</h5>
            
           
            
        </div>
        <%            }
        %>

        <!-- Navbar -->

        <!--bootstrap-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </body>
</html>
