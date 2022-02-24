<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type ="text/css" href="${pageContext.request.contextPath}/Resources/Css/ViewCandidate.css"/>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>

  <div class="sidebar">
    <a href="AdminDashboard.jsp">Admin DashBoard</a>
    <a href="AddCandidate.jsp"  >Add a Candidate</a>
    <a href="DeleteCandidate.jsp">Delete a Candidate</a>
    <a href="ViewCandidate.jsp"class="active-section">View all Candidates</a>
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
  	if(( session.getAttribute("adminId")== null ) || (session.getAttribute("adminId") == ""))
	  {
	  %>	
	  	<h1 >You are not logged in<br/></h1>
	  <%
	  } 
  	else
  	{
  	%>
      <%@page import="java.sql.*" %>
      <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
      <%
      try
      {
    	  Class.forName("com.mysql.jdbc.Driver");
      }
      catch(Exception except)
      {
    	  System.out.println(except);
      }
      %>
      <table class="table table-info table-striped table-hover">
  <thead>
    <tr>
      <th scope="col">Candidate Id</th>
      <th scope="col">Candidate Name</th>
      <th scope="col">Email Id</th>
      <th scope="col">Title</th>
    </tr>
  </thead>
  
  
  
  <% 
  try
  {
  Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/VotingSystem","root","sssrnsSai9*");
  
  Statement statement = connection.createStatement();
  String sql="select * from candidateTable";
  ResultSet resultSet = statement.executeQuery(sql);
  
  while(resultSet.next())
  {
  %>
    <tr>
      <td><%=resultSet.getString("candidateId")%></td>
      <td><%=resultSet.getString("Name")%></td>
      <td><%=resultSet.getString("Email")%></td>
      <td><%=resultSet.getString("title")%></td>
    </tr>
   <%
  	}
  } 
  catch (Exception e) {
	  e.printStackTrace();
	  }
   %> 
   
</table>
    </div>
    <%
  	}
    %>
  </div>

</body>
</html>
