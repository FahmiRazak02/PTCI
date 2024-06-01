<%-- 
    Document   : signup
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
                <a class="navbar-brand" href="adminHomepage.jsp">PTCI</a>
                <div class="navbar-nav d-flex justify-content-center  ">

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
        <form class="d-flex justify-content-center align-center mt-5" action="adminSignupServlet" method="POST">
            <div class="login-container">
                <div class="form-group">
                    <h2 class="d-flex justify-content-center fw-bold mb-2 text-uppercase">Admin Sign UP</h2>
                    <p class="text-dark-50 mb-4">"Create an account on our signup page."</p>
                    <input type="hidden" name="choice" value="admin"/>
                    
                     
                    
                    <label for="exampleInputEmail1">Admin Name</label>
                    <input type="text" class="form-control" id=""  name="adminName"><br>
                    
                    <label for="exampleInputEmail1">Email Address</label>
                    <input type="email" class="form-control" id=""  name="emailAddress" ><br>
                    
                     <label for="exampleInputEmail1">Phone Number</label>
                    <input type="number" class="form-control" id=""  name="phoneNumber" ><br>
                    
                    
                    <label for="exampleInputEmail1">Username</label>
                    <input type="text" class="form-control" id=""  name="username" ><br>
                    
                    <label for="exampleInputPassword1">Password</label>
                    <input type="password" class="form-control mb-3" id="" name="password" ><br>
                    
                    
                    
                    <div class="d-flex justify-content-center mb-4 ">
                      
                        <input type="submit" class="btn btn-primary w-50 " value="Submit"/>
                    </div>

                </div>
            </div>
        </form>
        
        <script>
            document.addEventListener("DOMContentLoaded", function() {
                var signupForm = document.querySelector("form[action='adminSignupServlet']");
                var usernameField = document.querySelector("input[name='username']");
                var passwordField = document.querySelector("input[name='password']");
                var emailField = document.querySelector("input[name='emailAddress']");
                var phoneNumberField = document.querySelector("input[name='phoneNumber']");  // Assuming the field is named 'phoneNumber'

        signupForm.addEventListener("submit", function(event) {
            var username = usernameField.value;
            var password = passwordField.value;
            var email = emailField.value;
            var phoneNumber = phoneNumberField.value;  // Get the phone number value
            var passwordFeedback = getPasswordFeedback(password);
            var isEmailValid = validateEmail(email);
            var isPhoneNumberValid = validatePhoneNumber(phoneNumber);  // Validate phone number
            var isUsernameValid = validateUsername(username);   
            

               if (!isEmailValid) {
                 alert("Invalid email address");
                 event.preventDefault(); // Prevent form submission
            } else if (!isPhoneNumberValid) {
                 alert("Invalid phone number format");
                  event.preventDefault(); // Prevent form submission
            } else if (!isUsernameValid) {
                  alert("Invalid username");
                  event.preventDefault();
                } else if (passwordFeedback !== '') {
             alert(passwordFeedback);
              event.preventDefault(); // Prevent form submission
               }
              
            
        });     function validateUsername(username) {
                    var reservedNames = ["admin", "root", "guest"];
                    var usernameRegex = /^[A-Za-z0-9]+$/; // Only letters and numbers
                    
                    if (username.length < 6 || username.length > 15) {
                    return false; // Check length
                   }
                    if (reservedNames.includes(username.toLowerCase())) {
                        return false; // Check reserved names
                      }
                     if (!usernameRegex.test(username)) {
                           return false; // Check for invalid characters
                        }
                        return true;
                        }


                function getPasswordFeedback(password) {
                    var feedback = '';
                    if (password.length < 8) {
                        feedback += 'Password must be at least 8 characters long.\n';
                    }
                    if (!/[A-Z]/.test(password)) {
                        feedback += 'Password must include uppercase letters.\n';
                    }
                    if (!/[a-z]/.test(password)) {
                        feedback += 'Password must include lowercase letters.\n';
                    }
                    if (!/\d/.test(password)) {
                        feedback += 'Password must include at least one number.\n';
                    }
                    if (!/[!@#$%^&*(),.?":{}|<>]/.test(password)) { 
                        feedback += 'Password must include at least one special character.\n';
                    }
                    return feedback;
                }

                function validateEmail(email) {
                    var emailRegex = /^[a-zA-Z0-9]+([._-][a-zA-Z0-9]+)*@[a-zA-Z0-9-]+\.(com|org)$/;
                    return emailRegex.test(email);
                }
                function validatePhoneNumber(phoneNumber) {
                      // Validation for phone number: 10 or 11 digits and starts with '01'
                     return /^01\d{8,9}$/.test(phoneNumber);
                }
            });
        </script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </body>
</html>
