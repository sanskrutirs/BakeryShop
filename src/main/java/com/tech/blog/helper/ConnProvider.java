package com.tech.blog.helper;
import java.sql.*;
public class ConnProvider {
	
	private static Connection conn;
	public static Connection getConnection() {
		
		try {
			
			//driver class load
			if (conn==null) {
				Class.forName("com.mysql.jdbc.Driver");
	            conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/bakery","root","Rscl_1166");
	            
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return conn;
	}
}
