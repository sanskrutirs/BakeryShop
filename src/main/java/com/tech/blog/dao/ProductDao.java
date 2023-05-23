package com.tech.blog.dao;

import java.sql.*;

import com.tech.blog.entities.Gift;

public class ProductDao {
	
    private Connection conn;
	
	public ProductDao(Connection conn) {
		this.conn = conn;
	}
	
	public boolean saveProduct(Gift product) {
		boolean f = false;
		
		try {
			
           String sql="INSERT into gift(pname,image,category,price,desp) values(?,?,?,?,?)";
            
            PreparedStatement pstm=conn.prepareStatement(sql);
            pstm.setString(1, product.getname());
            pstm.setString(2, product.getimage());
            pstm.setString(3, product.getcategory());
            pstm.setString(4, product.getprice());
            pstm.setString(5, product.getdescription());
            pstm.executeUpdate();
            pstm.close();
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return f;
	}
}
