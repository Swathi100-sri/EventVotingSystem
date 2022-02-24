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
    <a href="UserDashboard.jsp"class="active-section" >User Profile</a>
    <a href="UserLogout.jsp"  >Edit Profile</a>
    <a href="VotePage.jsp">Voting Content</a>    
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
    <h2>Aspire Systems User DashBoard</h2>
    <br><br>
    <div class="container-fluid bg-3 text-center">
      <div class="container mt-3" >
      
  	<%
  	if(( session.getAttribute("userId")== null ) || (session.getAttribute("userId") == ""))
  		{
  	%>	
  		<h1>You are not logged in<br/></h1>
  	<%
  		}
  	%> 
 
  		<%
  			String loggedUser = (String)session.getAttribute("userId"); 
  		%>
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
  <% 
  try
  {
  Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/VotingSystem","root","sssrnsSai9*");
  
  Statement statement = connection.createStatement();
  String sql="select * from userTable where EmployeeId ='"+loggedUser+"';";
  ResultSet resultSet = statement.executeQuery(sql);
  while(resultSet.next())
  {
  %>
  
  <div class="row">
  	<div class="col">
    <div class="card" style="width: 18rem;">
			  <img class="card-img-top" src="${pageContext.request.contextPath}/Resources/Images/profile.jpg" alt="Card image cap">
			  <div class="card-body">
			    <h3 class="card-title"><%=resultSet.getString("EmployeeId")%></h3>
			    <h4 class="card-text"><%=resultSet.getString("EmployeeName")%></h4>
			  </div>
			  <ul class="list-group list-group-flush">
			    <li class="list-group-item"><%=resultSet.getString("EmailId")%></li>
			    <li class="list-group-item"><%=resultSet.getString("DateOfBirth")%></li>
			    <li class="list-group-item"><%=resultSet.getString("PhoneNumber")%></li>
			  </ul>
		</div>
	</div>
	<div class="col">
		<div class="card mb-3" style="max-width: 540px;">
  			<div class="row g-0">
    			<div class="col-md-4">
                    <img src="${pageContext.request.contextPath}/Resources/Images/features-2.png" alt="" class="img-fluid">
    			</div>
	    		<div class="col-md-8">
	      			<div class="card-body">
	        			<h5 class="card-title">Number of Visits</h5>
	        			<%
		         			Integer hitsCount = (Integer)application.getAttribute("hitCounter");
		         			if( hitsCount ==null || hitsCount == 0 ) 
		         			{
		            	%>
	        			<h6 class="card-text">Welcome to your DashBoard</h6>
	        			<% 
	        				hitsCount = 1;
	        				application.setAttribute("hitCounter", hitsCount);
	        			%>
	        			<h6>Total Number of Visits <br><%= hitsCount%></h6>
	        			<%
		         		}
		         		else
		         		{
		         			hitsCount++;
		         		%>
			        	<h6 class="card-text">Welcome Back to your DashBoard</h6>
			        	<% 
			   				application.setAttribute("hitCounter", hitsCount);
			        	%>
			        	<h6>Total Number of Visits <br><%= hitsCount%></h6>
		         		<% 
		         		}
	        			%>	
	        				
	      			</div>
	    		</div>
  			</div>
		</div>
			<div class="card mb-3" style="max-width: 540px;">
  			<div class="row g-0">
				<%
  					String voteStatus = resultSet.getString("voteStatus");
  					if(voteStatus.equals("notVoted"))
  					{
  				%>
  						<div class="card" style="color:#f87364">
  		  				<h1><%=resultSet.getString("voteStatus") %></h1>
  		  				</div>
  				<% 
  					}
  					else
  					{
  				%>
  					<div class="card" style="color:#73fbb4">
  		  			<h1><%=resultSet.getString("voteStatus") %></h1>
  		  			</div>
  				<% 
  					}
  				%>
  				</div>
  			</div>
			
	</div>	 
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
