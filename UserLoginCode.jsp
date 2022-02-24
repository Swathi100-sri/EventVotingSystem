<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<body>
	<% 
	String userId = request.getParameter("userNumber");
	String password = request.getParameter("Password");	
	Class.forName("com.mysql.jdbc.Driver");
	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/VotingSystem", "root", "sssrnsSai9*");	
	Statement statement = connection.createStatement();
	ResultSet result = statement.executeQuery("select * from userTable where EmployeeId = '"+userId+"' and Password = '"+password+"'");
	if(result.next())
	{
		session.setAttribute("userId", userId);
		response.sendRedirect("UserDashboard.jsp");
	}
	else
	{
	%>
	<% 
		request.setAttribute("errorMessage", "Invalid User Name or Password");
		request.getRequestDispatcher("/UserLogin.jsp").forward(request,response);
	}
	%>
</body>