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
    <link rel="stylesheet" type ="text/css" href="${pageContext.request.contextPath}/Resources/Css/VotePage.css"/>
    
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
  <div class="content">
    <h2>Aspire Systems - Voting Page</h2>
    	<%
		  	if(( session.getAttribute("userId")== null ) || (session.getAttribute("userId") == ""))
		  	{
		 %>	
		  	<h1>You are not logged in<br/></h1>
		 <%
		  	}
			else
			{
				String loggedUser = (String)session.getAttribute("userId"); 
				try
				  {
					Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/VotingSystem","root","sssrnsSai9*");
				  	Statement statements = connect.createStatement();
				  	String voteSql="select voteStatus from userTable where employeeId = '"+loggedUser+"';";
				  	ResultSet result = statements.executeQuery(voteSql);
				  	if(result.next())
				  	{
				  		String userStatus = result.getString(1);
					  	System.out.println(userStatus);
					  	if(userStatus.equals("Voted"))
					  	{
				  		response.sendRedirect("VotedPage.jsp");
					  	}
				  		else
				  		{
				  	%>
				  		<br><br>
	    				<h2>Logged in As <%= loggedUser %></h2>
	    				<form action ="Voting.jsp" method="get">
				    	<div class="container">
				  		<div class="row">
				      	<div class="col-md-5 col-lg-6 col-sm-4 col-xl-7">	
						<% 
							int count =1;
							try
							  {
								Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/VotingSystem","root","sssrnsSai9*");
							  	Statement statement = connection.createStatement();
							  	String sql="select * from candidateTable";
							  	ResultSet resultSet = statement.executeQuery(sql);
							  	while(resultSet.next())
							  	{
						%>	
						<label>
						<input type="radio" name="voteCandidate" class="card-input-element" value="<%= resultSet.getString("candidateId")%>" />
				            <div class="panel panel-default card-input ">
				            	<div class="card-header text-center">
		    						Candidate <%= count %>
		  						</div>
				              	<div class="panel-heading text-center">
				              		<h5><%=resultSet.getString("Name")%></h5>
				              	</div>
				              	<br>
				              	<div class="panel-body text-center">
				                	<h6>
				                		<%=resultSet.getString("title")%>
				                	</h6>
				              	</div>
				              	<br>
				            </div>
						<br>
						</label>
				   		<%
				   			count++;
				  		}
				  		} 
				  		
				  		catch (Exception exception)
						{
					  		exception.printStackTrace();
						}
				   		%> 
				   		<input type="submit"/> 
				   		</div>
						</div>
	      				</div>
	      				</form>
				  	<% 
				  	}
				  	}
				  }
				catch(Exception exception)
				{
					System.out.println(exception);
				}
			%>	
	    	
	      <% 
			}
		  	%>
  	</div>
  	
</body>
</html>
