package com.mvc.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mvc.bean.RegisterBean;
import com.mvc.dao.RegisterDao;

public class RegisterServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public RegisterServlet() {
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       //Copying all the input parameters in to local variables
        String employeeId = request.getParameter("employeeId");
        String employeeName = request.getParameter("Name");
        String dateOfBirth = request.getParameter("dateOfBirth");
        String mobileNumber = request.getParameter("mobileNumber");
        String emailId = request.getParameter("emailId");
        String password = request.getParameter("Password");
        
        RegisterBean registerBean = new RegisterBean();
       //Using Java Beans - An easiest way to play with group of related data
        registerBean.setEmployeeId(employeeId);
        registerBean.setEmployeeName(employeeName);
        registerBean.setDateOfBirth(dateOfBirth);
        registerBean.setMobileNumber(mobileNumber);
        registerBean.setEmailId(emailId);
        registerBean.setPassword(password); 
        
        
        RegisterDao registerDao = new RegisterDao();
        
       //The core Logic of the Registration application is present here. We are going to insert user data in to the database.
        String userregister = registerDao.registerUser(registerBean);
        
        if(userregister.equals("SUCCESS"))   //On success, you can display a message to user on Home page
        {
           request.setAttribute("successMessage", "User is created Successfully");
           request.getRequestDispatcher("/UserLogin.jsp").forward(request, response);
        }
        else   //On Failure, display a meaningful message to the User.
        {
           request.setAttribute("errMessage", userregister);
           request.getRequestDispatcher("/UserSignUp.jsp").forward(request, response);
        }
    }

}
