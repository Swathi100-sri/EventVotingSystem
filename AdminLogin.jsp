<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*" %>
<%@page import ="java.io.*" %>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="${pageContext.request.contextPath}/Resources/Css/AdminLogin.css" rel="stylesheet">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
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

    <div class="container text-center text-md-left" data-aos="fade-up">
      <h1>Login in as Admin</h1>
    </div>
    <div class="container">
            
        <form action ="AdminLoginCode.jsp" method="post" >
            <div class="user-details">
                <div class="input-box">
                    <label id="labelStyle">Admin Id</label>
                    <input type="text" name="adminNumber" id="adminNumber"/>
                    <% 
						String adminId = request.getParameter("adminNumber");
						if(adminId == null)
						{
							request.setAttribute("iderrorMessage", "");
						}
					%>
                    <h5 style="color:blue"><%= request.getAttribute("iderrorMessage")%></h5>
                    
                    <p class="adminerror" id="adminempty">Admin Id should not be Empty</p>   
                    <p class="adminerror" id="errorHighlight">Admin Number should start with " ASD" followed with Four Digit Numbers</p>   
                </div>
                <div class="input-box">  
                    <label id="labelStyle" >Password : </label>
                    <input type="password" name="Password" id="Password"/>
                    <% 
						String adminPassword = request.getParameter("Password");
						if(adminPassword == null)
						{
							request.setAttribute("passworderrorMessage", "");
						}
					%>
                    <h5 style="color:blue"><%= request.getAttribute("passworderrorMessage")%></h5>
                    <p class="PasswordError" id="PasswordEmpty"><%= request.getAttribute("passworderrorMessage")%></p>
                    <p class="PasswordError" id="PasswordHighLight">Password Must Contain atleast 1 Small Character 1 Numeric 1 Special Characters</p>
                </div>
            </div>
            <p style="color:red"><%=(request.getAttribute("errorMessage") == null) ? ""
         				: request.getAttribute("errorMessage")%></p>
            <input type="submit" value="Sign In" class="submitButton" >
            <a href="SignUp.jsp">Create a new User </a>
        </form>
    </div>


    <script>
        AOS.init();
    </script>

    
  </body>
</html>