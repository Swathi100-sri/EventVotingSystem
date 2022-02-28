package com.mvc.controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import com.mvc.bean.DeleteCandidateBean;
import com.mvc.dao.DeleteDao;
public class DeleteCandidateServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public DeleteCandidateServlet() {
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       //Copying all the input parameters in to local variables
        String candidateId = request.getParameter("employeeId");
        
        DeleteCandidateBean deleteCandidateBean = new DeleteCandidateBean();
       //Using Java Beans - An easiest way to play with group of related data
        deleteCandidateBean.setCandidateId(candidateId);
        DeleteDao deleteDao = new DeleteDao();
       //The core Logic of the Registration application is present here. We are going to insert user data in to the database.
        String userCandidate = deleteDao. deleteCandidate(deleteCandidateBean);
        
        if(userCandidate.equals("SUCCESS"))   //On success, you can display a message to user on Home page
        {
            request.setAttribute("successMessage", "Candidate Deleted Successfully");
           request.getRequestDispatcher("/DeleteCandidate.jsp").forward(request, response);
        }
        else   //On Failure, display a meaningful message to the User.
        {
           request.setAttribute("errorMessage", userCandidate);
           request.getRequestDispatcher("/DeleteCandidate.jsp").forward(request, response);
        }
    }

}
