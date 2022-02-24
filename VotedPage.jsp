<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    <%@page import="java.sql.DriverManager"%>
	<%@page import="java.sql.ResultSet"%>
	<%@page import="java.sql.Statement"%>
	<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type ="text/css" href="${pageContext.request.contextPath}/Resources/Css/UserDashboard.css"/>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>

  <div class="sidebar">
    <a href="UserDashboard.jsp" >User Profile</a>
    <a href="UserLogout.jsp"  >Edit Profile</a>
    <a href="VotePage.jsp" class="active-section">Voting Page</a>    
    <a href="UserLogout.jsp" style="color:red">Log Out</a>
    
<footer id="footer">
    <div  >
      <a href="#">©2021 Copyright:<br>AspireSystems.com</a>
    </div>
    <!-- Copyright -->
  </footer>
  <!-- Footer -->
  </div>
  	<div class="content">
    	<h2>Aspire Systems - Voting Page</h2>
    	<br><br>
    	<div class="container-fluid bg-3 text-center">
      	<div class="container mt-3" >
		<div class="row">
			<div class="col">
			</div>
			<div class="card" style="width: 18rem;">
	  			<img src="${pageContext.request.contextPath}/Resources/Images/voted.png" class="card-img-top" alt="Already Voted" style="height:15rem;">
		  		<div class="card-body">
		    		<h5 class="card-title">You have been <br> Already Voted</h5>
		    		<a href="UserDashboard.jsp" class="btn btn-primary">Go to User Dashboard</a>
		  		</div>
			</div>
			<div class="col"></div>
		</div>
		</div>
	</div>
</div>
</body>
</html>
