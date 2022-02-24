<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="${pageContext.request.contextPath}/Resources/Css/UserSignUp.css" rel="stylesheet">

    <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    <link href="https://cdn.rawgit.com/michalsnik/aos/2.1.1/dist/aos.css" rel="stylesheet">
    <script src="https://cdn.rawgit.com/michalsnik/aos/2.1.1/dist/aos.js"></script>
    <script src="${pageContext.request.contextPath}/Resources/Javascript/UserRegister.js"></script>

    <title>Sign Up Page</title>
  </head>
  
  <body>
    <nav class=" navbar navbar-expand-sm justify-content-center">
        <div class="container-fluid">
          <a class="navbar-brand" href="#" class="navbarList" id="bankTitle">Aspire Systems </a>
        </div>
        <ul class="navbar-nav "  >
          <li class="nav-item active" >
            <a class="nav-link" href="Index.jsp" id="tags">Home</a>
          </li>
          <ul class="navbar-nav">
                      <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="tags" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <span class="items2"> Login</span>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-light" aria-labelledby="navbarDarkDropdownMenuLink">
                          <li><a class="dropdown-item" href="UserLogin.jsp">As User</a></li>
                          <li><a class="dropdown-item" href="AdminLogin.jsp">As Admin</a></li>
                        </ul>
                      </li>
                    </ul>
          <li class="nav-item" > 
          <a class="nav-link" href="Index.jsp" id="tags">Services</a>
          </li>
          <li>
          <a class="nav-link" href="Index.jsp" id="tags">Contact Us</a>   
                 </li>
          </ul>
      </nav>
    
    <div class="container" id="myText">
        <div class="container text-center text-md-left" data-aos="fade-right" id="myText">
            <h1>Registration</h1>
          </div>
        <form action ="RegisterServlet" method="post" id="myForm" onsubmit="return userRegister();" >
            <div class="user-details">
                <div class="input-box">
                    <label id="labelStyle">Employee Id </label>
                    <input type="text" name="employeeId" id="employeeId" onkeyup="employeeIdvalidate();">
                    <p class="employeeIderror"  id="employeeIdError">Employee Id should start with " ASP " followed with Six Digit Numbers</p>   
                    <p class="employeeIderror" id="employeeIdempty">This is the required Field</p>
                </div>
                <div class="input-box">
                  <label id="labelStyle">Confirm Employee Id : </label>
                  <input type="text" name="confirmEmployeeId" id="confirmEmployeeId" onkeyup="employeeIdConfirmation();">
                  <p class="confirmEmployeeIdError"  id="confirmEmployeeIdError">Employee Id should be same as before</p>
                  <p class="confirmEmployeeIdError" id="confirmEmployeeIdempty">This is the required Field</p>
                </div>
                <div class="input-box">
                    <label id="labelStyle">Employee Name</label>
                    <input type="text" name ="Name" id="userName" onkeyup="userNameValidation();">
                    <p class="NameError"  id="NameError">Numerics and special characters are not allowed</p>
                    <p class="NameError" id="NameLengthError">Name should contain atleast 3 Letters</p>
                    <p class="NameError"  id="NameEmpty">This is a Required Field</p>

                </div>
                <div class="input-box">
                    <label id="labelStyle">Date of Birth</label>
                    <input type="text" name="dateOfBirth" id="dateOfBirth" onkeyup="birthDateValidation();">
                    <p class="BirthdateException"  id="BirthdateException"> Date of Birth should be in the format ( 01/01/2001 ) </p>
                    <p class="BirthdateException"  id="BirthdateEmpty">This is the Required Field</p>
                    <p class="BirthdateException"  id="FutureDateException">Future Date are not allowed</p>
                </div>
                <div class="input-box">
                    <label id="labelStyle">Phone Number : </label>
                    <input type="text" name="mobileNumber" id="mobileNumber" onkeyup="phoneNumberValidtaion();"/>
                    <p class="emailError"  id="mobileEmpty">This is the required Field</p>
                    <p class="MobileError"  id="MobileError">Mobile Number should contain 10 digits only </p>
                    <p class="MobileError"  id="FirstMobileError">First Digit of Mobile Number should be greater than 5</p>

                </div>
                <div class="input-box">  
                    <label id="labelStyle">Email Id : </label>
                    <input type = "email" name="emailId" id="emailId" onkeyup="emailValidation();"/>
                    <p class="emailError"  id="emailEmpty">This is the required Field</p>
                    <p class="emailError"  id="emailError">Enter a Valid Email Id and Domain Name should contain only alphabets</p>
                </div>
                <div class="input-box">
                        
                    <label id="labelStyle" >Password : </label>
                    <input type="password" name="Password" id="Password" onkeyup="passwordValidation();"/>
                    <p class="PasswordError"  id="PasswordError">Password Must Contain atleast 1 Small Character 1 Numeric 1 Special Characters</p>
                    <p class="PasswordError"  id="PassowrdEmpty">Password Field is Required</p>
                </div>
                <div class="input-box">
                    
                    <label id="labelStyle">Confirm Password : </label>
                    <input type="password" name="confirmPassword" id="confirmPassword" onkeyup="passwordConfirmation();"/>
                    <p class="confirmPasswordError"  id="confirmPasswordError">Password should be same as before</p>
                    <p class="confirmPasswordError"  id="confirmPasswordEmpty">This is the required field</p>
                </div>
            </div>
            
            <input type="submit" value="Register" class="submitButton" > 
        </form>
        <h1>
        <%=(request.getAttribute("successMessage") == null) ? ""
         				: request.getAttribute("successMessage")%>
         </h1>
    </div>


    <script>
        AOS.init();

      </script>
  </body>
</html>