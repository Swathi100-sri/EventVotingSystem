package com.mvc.controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.mvc.bean.SearchCandidateBean;
import com.mvc.dao.SearchDao;
public class SearchCandidateServlet {
	public SearchCandidateServlet() {
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       //Copying all the input parameters in to local variables
        String candidateId = request.getParameter("employeeId");
        
        SearchCandidateBean searchCandidateBean = new SearchCandidateBean();
       //Using Java Beans - An easiest way to play with group of related data
        searchCandidateBean.setCandidateId(candidateId);
        SearchDao searchDao = new SearchDao();
       //The core Logic of the Registration application is present here. We are going to insert user data in to the database.
        String userCandidate = searchDao. searchCandidate(searchCandidateBean);
        
        if(userCandidate.equals("SUCCESS"))   //On success, you can display a message to user on Home page
        {
           request.getRequestDispatcher("/SearchCandidate.jsp").forward(request, response);
        }
        else   //On Failure, display a meaningful message to the User.
        {
           request.setAttribute("errorMessage", userCandidate);
           request.getRequestDispatcher("/AdminDashboard.jsp").forward(request, response);
        }
    }

}
