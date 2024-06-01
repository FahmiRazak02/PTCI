<%-- 
    Document   : inquiry
    Created on : Aug 1, 2023, 12:58:27 AM
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
        <title>Inquiry Form</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg bg-info navbar-dark">
            <!-- Container wrapper -->
            <div class="container-fluid">
                <!-- Navbar brand -->
                <a class="navbar-brand" href="#">PTCI</a>


                <div class="navbar-nav d-flex justify-content-center  ">
                    <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
                    <a class="nav-link" href="inquiry.jsp">Inquiry</a>

                </div>


                <!-- Icons -->
                <ul class="navbar-nav d-flex flex-row me-1">
                    <a class="nav-link" href="#">Login</a>

                    <li class="navbar-nav">



                    </li>
                </ul>
            </div>

            <!-- Container wrapper -->
        </nav>

        <form class="d-flex justify-content-center align-center mt-5" action="InquiryServlet" method="POST">
            <div class="login-container">
                <div class="form-group">
                    <h2 class="d-flex justify-content-center fw-bold mb-2 text-uppercase"> Inquiry</h2>
                    <p class="text-dark-50 mb-5">Please enter your login and password!</p>
                    <label for="exampleInputEmail1">Name</label>
                    <input type="text" class="form-control" id="" aria-describedby="emailHelp" name="name"><br>
                    
                    <label for="exampleInputEmail1">Email</label>
                    <input type="text" class="form-control" id="" aria-describedby="emailHelp" name="email"><br>
                    
                    <label for="exampleInputEmail1">Question</label>
                    <input type="text" class="form-control" id="" aria-describedby="emailHelp" name="question"><br>
                   
                    <div class="d-flex justify-content-center ">
                        <button type="submit" class="btn btn-primary w-50 " value="Submit">Login</button>
                    </div>

                </div>
            </div>
        </form>
    </body>
</html>
