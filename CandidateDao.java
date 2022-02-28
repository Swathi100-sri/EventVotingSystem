package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.mvc.bean.CandidateBean;
import com.mvc.util.DBConnection;

public class CandidateDao {

	public String registerCandidate(CandidateBean registerCandidate)
    {
        String candidateId = registerCandidate.getCandidateId();
        String candidateName = registerCandidate.getCandidateName();
        String emailId = registerCandidate.getEmailId();
        String title = registerCandidate.getPassword();
        
        Connection connection = null;
        PreparedStatement preparedStatement = null;         
        try
        {
            connection = DBConnection.createConnection();
            String query = "insert into candidateTable(candidateId,Name,Email,Title,voteCount) values (?,?,?,?,?)"; //Insert user details into the table 'USERS'
            preparedStatement = connection.prepareStatement(query); //Making use of prepared statements here to insert bunch of data
            preparedStatement.setString(1, candidateId);
            preparedStatement.setString(2, candidateName);
            preparedStatement.setString(3, emailId);
            preparedStatement.setString(4,title);
            preparedStatement.setInt(5, 0);
            int value= preparedStatement.executeUpdate();
            
            if (value!=0)  //Just to ensure data has been inserted into the database
            	
            return "SUCCESS"; 
        }
        catch(SQLException e)
        {
           e.printStackTrace();
        }       
        return "Oops.. Something went wrong there..!";  // On failure, send a message from here.
    }
}
