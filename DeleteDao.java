package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.mvc.bean.DeleteCandidateBean;
import com.mvc.util.DBConnection;
public class DeleteDao {
	public String deleteCandidate(DeleteCandidateBean deleteCandidate)
    {
        String candidateId = deleteCandidate.getCandidateId();
        
        
        Connection connection= null;
        PreparedStatement preparedStatement = null;         
        try
        {
            connection= DBConnection.createConnection();
            String query = "delete from candidateTable where candidateId = ?;"; 
            //Insert user details into the table 'USERS'
            
            preparedStatement = connection.prepareStatement(query); //Making use of prepared statements here to insert bunch of data
            preparedStatement.setString(1, candidateId);
            
            int value= preparedStatement.executeUpdate();
            
            if (value!=0)  //Just to ensure data has been inserted into the database
            	
            return "SUCCESS"; 
        }
        catch(SQLException e)
        {
           e.printStackTrace();
        }       
        return "No Such Candidate Found";  // On failure, send a message from here.
    }
}

