package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.mvc.bean.RegisterBean;
import com.mvc.util.DBConnection;

public class RegisterDao {

	public String registerUser(RegisterBean registerUser)
    {
        String userId = registerUser.getEmployeeId();
        String userName = registerUser.getEmployeeName();
        String birthDate = registerUser.getDateOfBirth();
        String mobile = registerUser.getMobileNumber();
        String emailId = registerUser.getEmailId();
        String password = registerUser.getPassword();
        
        Connection connection = null;
        PreparedStatement preparedStatement = null;         
        try
        {
            connection = DBConnection.createConnection();
            String query = "insert into userTable(EmployeeId,EmployeeName,DateOfBirth,PhoneNumber,EmailId,Password,voteStatus) values (?,?,?,?,?,?,?)"; //Insert user details into the table 'USERS'
            preparedStatement = connection.prepareStatement(query); //Making use of prepared statements here to insert bunch of data
            preparedStatement.setString(1, userId);
            preparedStatement.setString(2, userName);
            preparedStatement.setString(3, birthDate);
            preparedStatement.setString(4, mobile);
            preparedStatement.setString(5, emailId);
            preparedStatement.setString(6, password);
            preparedStatement.setString(7, "notVoted");
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
