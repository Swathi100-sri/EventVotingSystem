<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="${pageContext.request.contextPath}/Resources/Css/UserLogin.css" rel="stylesheet">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.rawgit.com/michalsnik/aos/2.1.1/dist/aos.css" rel="stylesheet">
    <script src="https://cdn.rawgit.com/michalsnik/aos/2.1.1/dist/aos.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/Resources/Javascript/UserLogin.js"></script>
    <title>Sign In Page</title>
  </head>
  <body >
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
          <li class="nav-item" > <a class="nav-link" href="Index.jsp" id="tags">Services</a>
          </li>
          <li>
          <a class="nav-link" href="Index.jsp" id="tags">Contact Us</a>   
                 </li>
          </ul>
      </nav>

    <br>
    <br>

    <div class="container text-center text-md-left" data-aos="fade-right">
      <h1>Login in as User</h1>
      </div>
    <div class="container" class="container align-items-center">
        <form action ="UserLoginCode.jsp" method="post" return="UserValidate()">
            <div class="user-details">
                <div class="input-box">
                    <label id="labelStyle">Employee Id</label>
                    <input type="text" name="userNumber" id="userNumber" onkeyup="UserIdvalidate()" >
                    <p class="usererror" id="userempty">user Number should not be Empty</p>   
                    <p class="usererror" id="errorHighlight">user Number should start with " SBIACC " followed with Six Digit Numbers</p>   
                </div>
                <div class="input-box">  
                    <label id="labelStyle" >Password : </label>
                    <input type="password" name="Password" id="Password" onkeyup="validatePassword()">
                    <p class="PasswordError" id="PasswordEmpty">Password should not be Empty</p>
                    <p class="PasswordError" id="PasswordHighLight">Password Must Contain atleast 1 Small Character 1 Numeric 1 Special Characters</p>
                </div>
                
            </div>
            
            <input type="submit" value="Sign In" class="submitButton" >
            <a href="SignUp.jsp">Create a new user </a>
            
            <p style="color:red"><%=(request.getAttribute("errorMessage") == null) ? ""
         				: request.getAttribute("errorMessage")%></p>
        </form>
    </div>
    

    <script>
        AOS.init();
    </script>
    
  </body>
</html>