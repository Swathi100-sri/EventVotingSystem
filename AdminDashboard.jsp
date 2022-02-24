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
    <link rel="stylesheet" type ="text/css" href="${pageContext.request.contextPath}/Resources/Css/AdminDashboard.css"/>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>

  <div class="sidebar">
    <a href="AdminDashboard.jsp"class="active-section" >Admin DashBoard</a>
    <a href="AddCandidate.jsp"  >Add a Candidate</a>
    <a href="DeleteCandidate.jsp">Delete a Candidate</a>
    <a href="ViewCandidate.jsp">View all Candidates</a>
    <a href="SearchCandidate.jsp" >Search a Candidate</a>
    <a href="VoteAnalysis.jsp">View Votings</a>
	<a href="viewUsers.jsp" >View Users</a> 
	<a href="Index.jsp">Log Out</a>
  <!-- Footer -->
  <footer id="footer">
    <div  >
      <a href="#">©2021 Copyright:<br>AspireSystems.com</a>
    </div>
    <!-- Copyright -->
  </footer>
  </div>

  <div class="content">
    <h2>Aspire Systems Admin DashBoard</h2>
    <br><br>
    <div class="container-fluid bg-3 text-center">
      <%
      try
      {
    	  Class.forName("com.mysql.jdbc.Driver");
      }
      catch(Exception exception)
      {
    	  System.out.println(exception);
      }
      %>
      <%
  	if(( session.getAttribute("adminId")== null ) || (session.getAttribute("adminId") == ""))
	  {
	  %>	
	  	<h1>You are not logged in<br/></h1>
	  <%
	  } 
      %>
	<% 
		  try
		  {
			  String adminCode = (String)session.getAttribute("adminId");
			  Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/VotingSystem","root","sssrnsSai9*");
			  
			  Statement statement = connection.createStatement();
			  String sql="select * from adminTable where adminId = '"+adminCode+"';";
			  ResultSet resultSet = statement.executeQuery(sql);
		  
		  while(resultSet.next())
		  {
		  %>
		  
		  <div class="row">
		  	<div class="col"></div>
		  	<div class="col">
		    <div class="card" style="width: 18rem;">
					  <img class="card-img-top" src="${pageContext.request.contextPath}/Resources/Images/profile.jpg" alt="Card image cap">
					  <div class="card-body">
					    <h3 class="card-title"><%=resultSet.getString("AdminId")%></h3>
					    <h4 class="card-text"><%=resultSet.getString("Name")%></h4>
					  </div>
					  <ul class="list-group list-group-flush">
					    <li class="list-group-item"><%=resultSet.getString("Email")%></li>
					    <li class="list-group-item"><%=resultSet.getString("Password")%></li>
					  </ul>
				</div>
			</div>
			<div class="col"></div>	 
			</div>
       		<%
  				}
  			} 
  			catch (Exception e) {
	  				e.printStackTrace();
	  			}
			%> 
   </div>

    </div>
  </div>
</body>
</html>
