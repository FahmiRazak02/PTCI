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
        <style>
            .form-container{
    background-color: #fff;
    font-family: 'Titillium Web', sans-serif;
    font-size: 0;
    padding: 30px;
    border-radius: 20px;
    box-shadow: 0 0 25px -15px rgba(0, 0, 0, 0.3);
}
.form-container .title{
    color: #000;
    font-size: 25px;
    font-weight: 600;
    text-transform: capitalize;
    margin: 0 0 25px;
}
.form-container .title:after{
    content: '';
    background-color: #00A9EF;
    height: 3px;
    width: 60px;
    margin: 10px 0 0;
    display: block;
    clear: both;
}
.form-container .sub-title{
    color: #333;
    font-size: 18px;
    font-weight: 600;
    text-align: center;
    text-transform: uppercase;
    margin: 0 0 20px;
}
.form-container .form-horizontal{ font-size: 0; }
.form-container .form-horizontal .form-group{
    color: #333;
    width: 50%;
    padding: 0 8px;
    margin: 0 0 15px;
    display: inline-block;
}
.form-container .form-horizontal .form-group:nth-child(4){ margin-bottom: 30px; }
.form-container .form-horizontal .form-group label{
    font-size: 17px;
    font-weight: 600;
}
.form-container .form-horizontal .form-control{
    color: #888;
    background: #fff;
    font-weight: 400;
    letter-spacing: 1px;
    height: 40px;
    padding: 6px 12px;
    border-radius: 10px;
    border: 2px solid #e7e7e7;
    box-shadow: none;
}
.form-container .form-horizontal .form-control:focus{ box-shadow: 0 0 5px #dcdcdc; }
.form-container .form-horizontal .check-terms{
    padding: 0 8px;
    margin: 0 0 25px;
}
.form-container .form-horizontal .check-terms .check-label{
    color: #333;
    font-size: 14px;
    font-weight: 500;
    font-style: italic;
    vertical-align: top;
    display: inline-block;
}
.form-container .form-horizontal .check-terms .checkbox{
    height: 17px;
    width: 17px;
    min-height: auto;
    margin: 2px 8px 0 0;
    border: 2px solid #d9d9d9;
    border-radius: 2px;
    cursor: pointer;
    display: inline-block;
    position: relative;
    appearance: none;
    -moz-appearance: none;
    -webkit-appearance: none;
    transition: all 0.3s ease 0s;
}
.form-container .form-horizontal .check-terms .checkbox:before{
    content: '';
    height: 5px;
    width: 9px;
    border-bottom: 2px solid #00A9EF;
    border-left: 2px solid #00A9EF;
    transform: rotate(-45deg);
    position: absolute;
    left: 2px;
    top: 2.5px;
    transition: all 0.3s ease;
}
.form-container .form-horizontal .check-terms .checkbox:checked:before{ opacity: 1; }
.form-container .form-horizontal .check-terms .checkbox:not(:checked):before{ opacity: 0; }
.form-container .form-horizontal .check-terms .checkbox:focus{ outline: none; }
.form-container .signin-link{
    color: #333;
    font-size: 14px;
    width: calc(100% - 190px);
    margin-right: 30px;
    display: inline-block;
    vertical-align: top;
}
.form-container .signin-link a{
    color: #00A9EF;
    font-weight: 600;
    transition: all 0.3s ease 0s;
}
.form-container .signin-link a:hover{ text-decoration: underline; }
.form-container .form-horizontal .signup{
    color: #fff;
    background: #00A9EF;
    font-size: 15px;
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: 1px;
    width: 160px;
    padding: 8px 15px 9px;
    border-radius: 10px;
    transition: all 0.3s ease 0s;
}
.form-container .form-horizontal .btn:hover,
.form-container .form-horizontal .btn:focus{
    text-shadow: 0 0 5px rgba(0,0,0,0.5);
    box-shadow: 3px 3px rgba(0,0,0,0.15),5px 5px rgba(0,0,0,0.1);
    outline: none;
}
@media only screen and (max-width:479px){
    .form-container .form-horizontal .form-group{ width: 100%; }
    .form-container .signin-link{
        width: 100%;
        margin: 0 10px 15px;
    }
}
        </style>
        <title>JSP Page</title>
    </head>
    <body>

        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg bg-info navbar-dark">
            <!-- Container wrapper -->
            <div class="container-fluid">
                <!-- Navbar brand -->
                <a class="navbar-brand" href="index.jsp">PTCI</a>
 
                    </div>
                

                <!-- Icons -->
                <ul class="navbar-nav d-flex flex-row me-1">
                     <a data-mdb-ripple-init type="button" href="login.jsp"  class="btn btn-light me-3" style="border-radius: 20px;" >
                        Login
                    </a>
                   
                    <li class="navbar-nav">
                       
                        
                       
                    </li>
                </ul>
            </div>

            <!-- Container wrapper -->
        </nav>


        <div class="form-bg">
    <div class="container">
        <div class="row justify-content-center mt-4">
            <div class="col-md-offset-3 col-md-8">
                <div class="form-container">
                    <h3 class="title">REGISTER</h3>
                    <form class="form-horizontal" action="signupServlet" method="POST">
                        <h4 class="sub-title">Student Information</h4>
                        <br>
                        <div class="form-group">
                            <label>Student Name</label>
                            <input type="text" class="form-control" name="studentName" placeholder="Student Name" required>
                        </div>
                        <div class="form-group">
                            <label>NRIC</label>
                            <input type="number" class="form-control" name="icNumber" placeholder="NRIC" required>
                        </div>
                        <div class="form-group">
                        <label>Email Address</label>
                                <input type="email" class="form-control" name="emailAddress" id="email" placeholder="Email Address" required>
                        </div>

                        <div class="form-group">
                            <label>Phone No.</label>
                            <input type="number" class="form-control" name="phoneNumber" placeholder="Phone Number" required>
                        </div>
                        <div class="form-group">
                            <label>Student Address</label>
                            <input type="text" class="form-control" name="address" placeholder="Student Address" required>
                        </div>
                        <div class="form-group">
                            <label>Username</label>
                            <input type="text" class="form-control" name="username" placeholder="Username" required>
                        </div>
                        <div class="form-group">
                            <label>Password</label>
                            <input type="password" class="form-control" name="password" placeholder="Password" id="password" required>
                        </div>
                        <div class="form-group">
                            <label>Confirm Password</label>
                            <input type="password" class="form-control" placeholder="Confirm Password"  id="confirmPassword" required>
                        </div>
                        <div class="form-group">
                            <input type="checkbox" id="showPasswords">
                            <label for="showPasswords">Show Passwords</label>
                        </div>
                        <br><br>
                        <h4 class="sub-title">Parent Information</h4>
                        <div class="form-group">
                            <label>Parent Name</label>
                            <input type="text" class="form-control" name="parentName" placeholder="Parent Name" required>
                        </div>
                        <div class="form-group">
                            <label>Phone No.</label>
                            <input type="number" class="form-control" name="pphoneNumber" placeholder="Phone Number" required>
                        </div>
                        <button class="btn signup">Create Account</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        var showPasswordsCheckbox = document.getElementById("showPasswords");
        var passwordField = document.getElementById("password");
        var confirmPasswordField = document.getElementById("confirmPassword");
        var signupButton = document.querySelector(".btn.signup");
        var emailField = document.getElementsByName("emailAddress")[0];

        showPasswordsCheckbox.addEventListener('change', function() {
            if (showPasswordsCheckbox.checked) {
                passwordField.type = 'text';
                confirmPasswordField.type = 'text';
            } else {
                passwordField.type = 'password';
                confirmPasswordField.type = 'password';
            }
        });

        signupButton.addEventListener("click", function(event) {
            var password = passwordField.value;
            var confirmPassword = confirmPasswordField.value;
            var nric = document.getElementsByName("icNumber")[0].value; // Get the NRIC value
            var phoneNumber = document.getElementsByName("phoneNumber")[0].value;
            var pphoneNumber = document.getElementsByName("pphoneNumber")[0].value;

            // Check if NRIC is exactly 12 digits
            if (!/^\d{12}$/.test(nric)) {
                alert("NRIC must be exactly 12 digits.");
                event.preventDefault(); // Prevent form submission
                return; // Exit the function early
            }

            
            if (!validateEmail(emailField.value)) {
                alert("Invalid email address");
                event.preventDefault() // Prevent form submission
                return;
            }
            
            if (!validatePhoneNumber(phoneNumber)) {
                 alert("Invalid Student phone number format");
                 event.preventDefault(); // Prevent form submission
                 return; // Exit the function early
                }
            // Check if the password meets all criteria
            var passwordFeedback = getPasswordFeedback(password);
            if (passwordFeedback !== '') {
                alert(passwordFeedback);
                event.preventDefault(); // Prevent form submission
                return; // Exit the function early
            }

            // Check if passwords match
            if (password !== confirmPassword) {
                alert("Passwords do not match.");
                event.preventDefault() // Prevent form submission
                return;
            }
            // Validate Secondary Phone Number
            if (!validatePhoneNumber(pphoneNumber)) {
                 alert("Invalid Parent phone number format");
                 event.preventDefault(); // Prevent form submission
                 return; // Exit the function early
                 }
        });

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
        return /^01\d{8,9}$/.test(phoneNumber);
    }
    });
</script>





        <!-- Navbar -->

        <!--bootstrap-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </body>
</html>
