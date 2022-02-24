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
    <link rel="stylesheet" type ="text/css" href="${pageContext.request.contextPath}/Resources/Css/SearchCandidate.css"/>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>

  <div class="sidebar">
    	
    <a href="AdminDashboard.jsp">Admin DashBoard</a>
    <a href="AddCandidate.jsp"  >Add a Candidate</a>
    <a href="DeleteCandidate.jsp">Delete a Candidate</a>
    <a href="ViewCandidate.jsp">View all Candidates</a>
    <a href="SearchCandidate.jsp"class="active-section" >Search a Candidate</a>
    <a href="VoteAnalysis.jsp">View Votings</a>
    <a href="viewUsers.jsp">View Users</a>    
    <a href="Index.jsp">Log Out</a>
  <!-- Footer -->
  <footer id="footer">
    <div  >
      <a href="#">©2021 Copyright:<br>AspireSystems.com</a>
    </div>
    <!-- Copyright -->
  </footer>
  </div>

  <div class="content" >
    <h2>Aspire Systems Admin DashBoard</h2>
    <br><br>
    
    <div class="row">
    
    <div class="col-md-3">
    </div>
    
    <div class="col-md-6">
    <% 
  	if(( session.getAttribute("adminId")== null ) || (session.getAttribute("adminId") == ""))
	  {
	  %>	
	  	<h1>You are not logged in<br/></h1>
	  <%
	  } 
  	else
  	{
  	%>
    <form action="" method="get">
        <input type="text" class="form-control" name="search" placeholder="Search Here ........"/>
    </form>    
    </div>
    </div>
    <table class="table table-bordered table-striped table-hover">
    <thead>
    <tr>
    <th>Candidate Id</th>
    <th>Candidate Name</th>
    <th>Email Id</th>
    <th>Title</th>
    </tr>
    </thead>
    
    <tbody>
    	<%

    	Class.forName("com.mysql.jdbc.Driver");
    	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/VotingSystem", "root", "sssrnsSai9*");
    		Statement state = null;
    		ResultSet result = null;
    		state = connection.createStatement();
    		String query = request.getParameter("search");
    		String data;
    		if(query!=null)
    		{
    			data =  " select * from candidateTable where Name like '%" +query+"%' or candidateId like '%" +query+"%' or Email like '%" +query+"%' or Title like '%" +query+"%'" ;
    		}
    		else
    		{
    			data = "select * from candidateTable ";
    		}
    		result = state.executeQuery(data);
    		while(result.next())
    		{
		    	%>
		    	<tr>
		    	
		    	<td><%=result.getString("candidateId")%></td>
		      	<td><%=result.getString("Name")%></td>
		    	<td><%=result.getString("Email")%></td>
		    	<td><%=result.getString("Title")%></td>
		    	</tr>
		    	<%
		    		}
		    	%>
       	
    </tbody>
    </table>
  </div>
  <%
  	}
  %>
  
  
     

</body>
</html>
