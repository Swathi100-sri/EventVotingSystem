<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*" %>
<%@page import ="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type ="text/css" href="${pageContext.request.contextPath}/Resources/Css/AddCandidate.css"/>
    <link href="https://cdn.rawgit.com/michalsnik/aos/2.1.1/dist/aos.css" rel="stylesheet">
    <script src="https://cdn.rawgit.com/michalsnik/aos/2.1.1/dist/aos.js"></script>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>

  <div class="sidebar">
    	
    <a href="AdminDashboard.jsp" >Admin DashBoard</a>
    <a href="AddCandidate.jsp"  class="active-section">Add a Candidate</a>
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

  <div class="content" >
  <h2>Aspire Systems Admin DashBoard</h2>
    <br><br>
    
    <div class="container text-center" >
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
            <h1 class="text-center text-md-left" data-aos="fade-right"id="myText">Add a Candidate</h1>
        <form action ="CandidateServlet" id="myForm" method="post" >
            <div class="user-details">
            
                <div class="input-box">
                <label id="labelStyle">Candidate Id </label>
                  <input type="text" name="CandidateId" id="CandidateId" >
                  
                  <%
                    	String candidateId = request.getParameter("CandidateId");
                    	if(candidateId == null)
						{
							request.setAttribute("candidateIdEmpty", "");
						}
                    %>
                    <p><%= request.getAttribute("candidateIdEmpty")%></p>
                    
                    
                  <p class="CandidateIdError"  id="CandidateIdError" style="color:red; display:none;">
                  Candidate Id should start with " ASPC " followed with Five Digit Numbers
                  </p>   
                  <p class="CandidateIdError" id="CandidateIdempty">This is the required Field</p>
                </div>
                <div class="input-box">
                    <label id="labelStyle">Candidate Name</label>
                    <input type="text" name ="Name" id="userName" >
                    
                    <%
                    	String candidateName = request.getParameter("Name");
                    	if(candidateName == null)
						{
							request.setAttribute("candidateNameEmpty", "");
						}
                    %>
                    <p><%= request.getAttribute("candidateNameEmpty")%></p>
                    
                    <p class="NameError"  id="NameError">Numerics and special characters are not allowed</p>
                    <p class="NameError" id="NameLengthError"><%= request.getAttribute("candidateName")%></p>
                </div>
                <div class="input-box">  
                    <label id="labelStyle">Email Id : </label>
                    <input type = "email" name="emailId" id="emailId" />
                    
                    <%
                    	String candidateEmail = request.getParameter("emailId");
                    	if(candidateEmail == null)
						{
							request.setAttribute("candidateEmail", "");
						}
                    %>
                    <p><%= request.getAttribute("candidateEmail")%></p>
                    <p class="emailError"  id="emailEmpty">This is the required Field</p>
                    <p class="emailError"  id="emailError">Enter a Valid Email Id and Domain Name should contain only alphabets</p>
                </div>
                <div class="input-box">                        
                    <label id="labelStyle" >Title: </label>
                    <input type="text" name="title" id="Password" />
                    <%
                    	String candidateTitle = request.getParameter("title");
                    	if(candidateTitle == null)
						{
							request.setAttribute("candidateTitleEmpty", "");
						}
                    %>
                    <p><%= request.getAttribute("candidateNameEmpty")%></p>
                    <p class="PasswordError"  id="PasswordError">Title should be valid</p>
                    <p class="PasswordError"  id="PasswordEmpty">Title Field is Required</p>
                </div> 
            </div>
            <input type="submit" value="Add Candidate" class="submitButton" >
        </form>
        
			<p style="color:red"><%=(request.getAttribute("successMessage") == null) ? ""
         				: request.getAttribute("successMessage")%></p>		
         	<p style="color:red"><%=(request.getAttribute("errorMessage") == null) ? ""
         				: request.getAttribute("errorMessage")%></p>        
        
    </div>
    <%
  		}
    %>

    </div>
    <script>
        AOS.init();
      </script>  

</body>
</html>
