package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.mvc.bean.SearchCandidateBean;
import com.mvc.util.DBConnection;

public class SearchDao {
	
	public String searchCandidate(SearchCandidateBean searchCandidate)
    {
        String candidateId = searchCandidate.getCandidateId();
        
        
        Connection con = null;
        PreparedStatement preparedStatement = null;         
        try
        {
            con = DBConnection.createConnection();
            String query = "select * from CandidateTable where candidateId = '"+candidateId+"';"; 
            //Insert user details into the table 'USERS'
            
            preparedStatement = con.prepareStatement(query); //Making use of prepared statements here to insert bunch of data
            preparedStatement.setString(1, candidateId);
            
            int value= preparedStatement.executeUpdate();
            
            if (value!=0)  //Just to ensure data has been inserted into the database
            	
            return "SUCCESS"; 
        }
        catch(SQLException e)
        {
           e.printStackTrace();
        }       
        return "No such Details Found ......!";  // On failure, send a message from here.
    }

}
