package com.mvc.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import com.mvc.bean.CandidateBean;
import com.mvc.dao.CandidateDao;
public class CandidateServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public CandidateServlet() {
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       //Copying all the input parameters in to local variables
        String candidateId = request.getParameter("CandidateId");
        String candidateName = request.getParameter("Name");
        String emailId = request.getParameter("emailId");
        String title = request.getParameter("Password");
        
        CandidateBean candidateBean = new CandidateBean();
       //Using Java Beans - An easiest way to play with group of related data
        candidateBean.setCandidateId(candidateId);
        candidateBean.setCandidateName(candidateName);
        candidateBean.setEmailId(emailId);
        candidateBean.setPassword(title); 
        
        CandidateDao candidateDao = new CandidateDao();
        
       //The core Logic of the Registration application is present here. We are going to insert user data in to the database.
        String userCandidate = candidateDao. registerCandidate(candidateBean);
        
        if(userCandidate.equals("SUCCESS"))   //On success, you can display a message to user on Home page
        {
            request.setAttribute("successMessage", "Candidate Inserted Successfully");
           request.getRequestDispatcher("/AddCandidate.jsp").forward(request, response);
        }
        else   //On Failure, display a meaningful message to the User.
        {
           request.setAttribute("errorMessage", userCandidate);
           request.getRequestDispatcher("/AddCandidate.jsp").forward(request, response);
        }
    }

}
