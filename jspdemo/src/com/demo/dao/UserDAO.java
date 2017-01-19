/**
 * 
 */
package com.demo.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.demo.model.UserBean;

/**
 * @author akhil
 *
 */
public class UserDAO {

	Connection con;

	public UserDAO() {
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection
					("jdbc:mysql://localhost:3306/sys","root","password");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	public int deleteUser(String id) {
		int x = 0;
		try{
			PreparedStatement ps = con.prepareStatement("delete from user where uname=?");
			ps.setString(1, id);
			x = ps.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return x;
	}

	public int insertUser(UserBean user) {
		int x = 0;
		try{
			PreparedStatement ps = con.prepareStatement("insert into user values(?,?)");
			ps.setString(1, user.getUsername());
			ps.setString(2, user.getPassword());
			x = ps.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return x;
	}

	public int updateUser( String id, String pass ) {
		int x = 0;
		try {
			String query = "update user set username=?, password=? where username=?";
			PreparedStatement preparedStatement = con.prepareStatement( query );
			preparedStatement.setString( 1, id);
			preparedStatement.setString( 2, pass );
			x = preparedStatement.executeUpdate();
		
			preparedStatement.close();
			
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		return x;
	
	}
}
