<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    <%@page import="java.sql.DriverManager"%>
	<%@page import="java.sql.ResultSet"%>
	<%@page import="java.sql.Statement"%>
	<%@page import="java.sql.Connection"%>
	<%@page import="java.util.*" %>
<%@page import ="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type ="text/css" href="${pageContext.request.contextPath}/Resources/Css/Voting.css"/>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>

  <div class="sidebar">
    <a href="AdminDashboard.jsp" >Admin DashBoard</a>
    <a href="AddCandidate.jsp"  >Add a Candidate</a>
    <a href="DeleteCandidate.jsp">Delete a Candidate</a>
    <a href="ViewCandidate.jsp">View all Candidates</a>
    <a href="SearchCandidate.jsp" >Search a Candidate</a>
    <a href="Voting.jsp">View Votings</a>
    <a href="Voting.jsp" class="active-section">View Users</a>    
    <a href="Index.jsp" style="color:red">Log Out</a>
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
	  			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/VotingSystem?allowMultiQueries=true","root","sssrnsSai9*");
			  	PreparedStatement prepareStatement = null;
			  	Statement statement = connection.createStatement();
	      		int count;
	      		String votedCandidate;
	      		int votes;
	      		int countVote;
	      		String userId;
	      		String statusOfVote;
	      		String votedStatus = "Voted";
      			votedCandidate = request.getParameter("voteCandidate");// CandidateId
				userId = (String)session.getAttribute("userId"); 
      			String increaseVoteStatus = "select voteCount from candidateTable where candidateId = '"+votedCandidate+"';"+"select voteStatus from userTable where EmployeeId = '"+userId+"';";
      			ResultSet resultSet = statement.executeQuery(increaseVoteStatus);
      			while(resultSet.next())
      			{
      				countVote = resultSet.getInt("voteCount");
      				count = countVote;
              		count = count+1;
              		String sql="update candidateTable set voteCount = ? where candidateId = '"+votedCandidate+"';"+"update userTable set voteStatus = ? where EmployeeId = '"+userId+"';";
    			  	prepareStatement = connection.prepareStatement(sql);
    			  	prepareStatement.setInt(1,count);
    			  	prepareStatement.setString(2,votedStatus);    			  	
    			  	int updateVote = prepareStatement.executeUpdate();
      			}
			  	
				response.sendRedirect("VotingSuccess.jsp");
	      }
	      catch(Exception except)
	      {
	    	  System.out.println(except);
	  		  response.sendRedirect("VotePage.jsp");
	      }
      	%>
    </div>
  </div>

</body>
</html>
