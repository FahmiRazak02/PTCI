<%-- 
    Document   : index
    Created on : Jul 26, 2023, 4:19:46 PM
    Author     : HP
--%>

<%@page import="Model.Student"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
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

        <% String adminName = (String) session.getAttribute("adminName"); %>
        <%
            if (adminName != null) {
        %>
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg bg-danger navbar-dark">
            <!-- Container wrapper -->
            <div class="container-fluid">
                <!-- Navbar brand -->
                <a class="navbar-brand" href="adminHomepage.jsp">PTCI</a>
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
                <div class="navbar-nav d-flex justify-content-center  ">
                    <a class="nav-link active" aria-current="page" href="adminHomepage.jsp">Home</a>
                    <a class="nav-link" href="manageStudentDetailsServlet">Student Management</a>
                    <a class="nav-link" href="manageSubject.jsp">Subject Management</a>

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


<br><br><br><br><br>
        <section class="deliveryInfo py-5 px-5 ">
            <div class="row d-flex justify-content-center">
                <div class="col-md-12 mb-6">
                    <div class="card mb-6">
                        <div class="card-header py-3">
                            <h5 class="mb-0 d-flex justify-content-center">Student Details</h5>
                        </div>
                        <div class="">

                            <table class="table">
                                <thead class="thead-dark ">
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">IC Number</th>
                                        <th scope="col">Student Name</th>
                                        <th scope="col">Email Address</th>
                                        <th scope="col">phone Number</th>
                                        <th scope="col">Address</th>
                                        <th scope="col">Username</th>
                                        <th scope="col">Password</th>
                                        <th scope="col">Edit</th>
                                        <th scope="col">Delete</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        List studentList = (List) request.getAttribute("studentList");
                                        if (studentList != null) {
                                            Iterator iterator = studentList.iterator();
                                            while (iterator.hasNext()) {
                                                Student student = (Student) iterator.next();


                                    %>
                                    <tr>

                                        <td><%= student.getStudentID()%></td>
                                        <td><%= student.getIcNumber()%></td>
                                        <td><%= student.getStudentName()%></td>
                                        <td><%= student.getEmailAddress()%></td>
                                        <td><%= student.getPhoneNumber()%></td>
                                        <td><%= student.getAddress()%></td>
                                        <td><%= student.getUsername()%></td>
                                        <td><%= student.getPassword()%></td>
                                        <td><a href="updateStudentServlet?studentID=<%= student.getStudentID()%>"><input class="bg-info btn btn-primary" type="button" value="Edit" /></a></td>
                                        <td><a href="deleteStudentServlet?studentID=<%= student.getStudentID()%>"><input class="bg-info btn btn-primary" type="button" value="Delete" /></a></td>

                                    </tr>
                                    <%
                                        }
                                    } else {
                                    %>
                                    <tr>
                                        <td colspan="8">No student records found.</td>
                                    </tr>
                                    <%
                                        }
                                    %>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                                    
            </div>
                                    <input type="button" value="Back" class="btn btn-primary btn-lg btn-block" onclick="history.back()" > 
                                    
        </section>







        <!-- Navbar -->

        <!--bootstrap-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </body>
</html>
