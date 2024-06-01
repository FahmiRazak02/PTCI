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
       <script>
    function validateSubjectCode() {
        var subjectCode = document.getElementById('subjectCode').value;
        var regex = /^[A-Za-z0-9]+$/; // Regex for letters and numbers only

        if (!regex.test(subjectCode)) {
            alert("Subject Code must consist only of letters and numbers and should not contain blank spaces.");
            return false;
        }
        return true;
    }

    function validateSubjectName() {
        var subjectName = document.getElementById('subjectName').value;
        var regex = /^[A-Za-z\s]+$/; // Regex for letters and spaces only

        if (!regex.test(subjectName)) {
            alert("Subject Name must not contain numbers, symbols, or special characters.");
            return false;
        }
        return true;
    }
</script> 
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
                    <a class="nav-link active" aria-current="page" href="adminHomepage.jsp" >Home</a>
                    <a class="nav-link" href="manageStudentDetails.jsp">Manage Student Details</a>
                    <a class="nav-link" href="manageSubjectServlet">Manage Subject</a>


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
        <br><br><br><br><br><br>
        <section class="deliveryInfo py-5 px-5 ">
            <div class="row d-flex justify-content-center">
                <div class="col-md-8 mb-4">
                    <div class="card mb-4">
                        <div class="card-header py-3">
                            <h5 class="mb-0 d-flex justify-content-center">Add Subject</h5>
                        </div>
                        <div class="card-body">

                            <form action="addSubjectServlet" method="POST" onsubmit="return validateSubjectCode() && validateSubjectName()">

                                <!-- Email input -->
                                <div class="form-outline">
                                    <label for="exampleInputEmail1">Subject Code</label>
                                    <input type="text" class="form-control" id="subjectCode"  name="subjectCode" required><br>

                                </div>

                                <!-- Email input -->
                                <div class="form-outline">
                                    <label for="exampleInputEmail1">Subject Name</label>
                                    <input type="text" class="form-control" id="subjectName"  name="subjectName" required><br>

                                </div>
                                
                                <div class="form-outline">
                                    <label for="exampleInputEmail1">Subject Price</label>
                                    <input type="number" class="form-control" id=""  name="subjectPrice" required><br>

                                </div>


                                <input type="hidden" name="subjectCode" value="">
                                <input  type="submit" value="Submit" class="btn btn-primary btn-lg btn-block ">
                                <input type="button" value="Back" class="btn btn-primary btn-lg btn-block" onclick="history.back()" >


                            </form>
                        </div>
                    </div>
                </div>


            </div>

        </section>



        <!-- Navbar -->

        <!--bootstrap-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        
    </body>
</html>
