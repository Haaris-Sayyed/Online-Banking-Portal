package com.bank;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;



public class ValidateUser {

	public User checkLogin(String username, String password) throws SQLException,ClassNotFoundException {

    	  
            Connection conn = null;
            conn = DBConnector.getConnection();
  String sql = "SELECT * FROM tbl_users  WHERE username = ? " + "and password = ?";
  PreparedStatement statement = conn.prepareStatement(sql);
  statement.setString(1, username);
  statement.setString(2, password);

  ResultSet result = statement.executeQuery();

  User user = null;

  if (result.next()) {
      user = new User();
      user.setUsername(result.getString("username"));
      user.setPassword(result.getString("password"));
  }
   
  conn.close();

  return user;
    	
	}
}
