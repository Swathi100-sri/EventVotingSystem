<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>  
<%@page import="java.sql.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.*" %>
<%@page import ="java.io.*" %>
<body>

	<% 
	String adminId = request.getParameter("adminNumber");
	String password = request.getParameter("Password");	
	if(adminId.length()== 0 || password.length() == 0)
	{
		request.setAttribute("iderrorMessage", "User Name is Empty");
		request.setAttribute("passworderrorMessage", "Password is Empty");
		request.getRequestDispatcher("/AdminLogin.jsp").forward(request,response);
	}
	Class.forName("com.mysql.jdbc.Driver");
	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/VotingSystem", "root", "sssrnsSai9*");	
	Statement statement = connection.createStatement();
	ResultSet result = statement.executeQuery("select * from adminTable where AdminId = '"+adminId+"' and Password = '"+password+"'");
	if(result.next())
	{
		session.setAttribute("adminId", adminId);
		request.setAttribute("errorMessage", " ");
		response.sendRedirect("AdminDashboard.jsp");
	}
	else
	{
		request.setAttribute("iderrorMessage", "");
		request.setAttribute("passworderrorMessage", "");
		request.setAttribute("errorMessage", "Invalid User Name or Password");
		request.getRequestDispatcher("/AdminLogin.jsp").forward(request,response);
	}
	%>
</body>