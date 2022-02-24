<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type ="text/css" href="${pageContext.request.contextPath}/Resources/Css/DeleteCandidate.css"/>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>

  <div class="sidebar">
    <a href="AdminDashboard.jsp" >Admin DashBoard</a>
    <a href="AddCandidate.jsp"  >Add a Candidate</a>
    <a href="DeleteCandidate.jsp" class="active-section">Delete a Candidate</a>
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
  	if(( session.getAttribute("adminId")== null ) || (session.getAttribute("adminId") == ""))
	  {
	  %>	
	  	<h1>You are not logged in<br/></h1>
	  <%
	  } 
  	else
  	{
  	%>
        <div class="container" id="myText">
            <div class="container text-center text-md-left" data-aos="fade-right" id="myText">
                <h1 id="delete">Delete a Candidate</h1>
              </div>
            <form action ="DeleteCandidateServlet" id="myForm" method="post" >
                <div class="user-details">
                    <div class="input-box">
                      <label id="labelStyle">Candidate Id </label>
                      <input type="text" name="employeeId" id="employeeId" >
                      <p class="employeeIderror"  id="employeeIdError">Candidate Id should start with " ASPC " followed with Six Digit Numbers</p>   
                      <p class="employeeIderror" id="employeeIdempty">This is the required Field</p>
                    </div>
                </div>
                
                <p style="color:green"><%=(request.getAttribute("successMessage") == null) ? ""
         				: request.getAttribute("successMessage")%></p>
                <p style="color:red"><%=(request.getAttribute("errorMessage") == null) ? ""
         				: request.getAttribute("errorMessage")%></p>
                
                <input type="submit" value="Delete a Candidate" class="submitButton" >
            </form>
        </div>
        <%
  			}
        %>
    </div>
  </div>

</body>
</html>