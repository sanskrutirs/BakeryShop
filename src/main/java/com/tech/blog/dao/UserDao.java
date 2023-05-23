package com.tech.blog.dao;
import java.sql.*;
import java.util.*;

import com.tech.blog.entities.*;




public class UserDao {
	
	private Connection conn;
	
	public UserDao(Connection conn) {
		this.conn = conn;
	}
	
	//insert user to database
	
	public boolean addUser(User user) {
		boolean f = false;
		
		try {
			
			String sql="insert into user(fname, lname, uname, email, pass, contactno, city, address,status) values(?,?,?,?,?,?,?,?,?)";
            
            PreparedStatement pstm=this.conn.prepareStatement(sql);
            pstm.setString(1,user.getFirstName() );
            pstm.setString(2,user.getLastName() );
            pstm.setString(3,user.getUserName() );
            pstm.setString(4,user.getEmail() );
            pstm.setString(5,user.getPassword() );
            pstm.setString(6,user.getContact());
            pstm.setString(7,user.getCity() );
            pstm.setString(8,user.getAddress());
            pstm.setString(9,user.getStatus());
            
            pstm.executeUpdate();
            f = true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
	}
	
	//getuser by uname and pass
	
	public User getUser(String userName, String password) {
		User user = null;
		
		try {
			
			String sql = "select * from user where uname=? and pass=?";
			
			PreparedStatement pstm=this.conn.prepareStatement(sql);
			pstm.setString(1, userName);
			pstm.setString(2, password);
			
			ResultSet rs = pstm.executeQuery();
			
			if (rs.next()) {
				user=new User();
				
				user.setFirstName(rs.getString("fname"));
				user.setLastName(rs.getString("lname"));
				user.setUserName(rs.getString("uname"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("pass"));
				user.setContact(rs.getString("contactno"));
				user.setCity(rs.getString("city"));
				user.setAddress(rs.getString("address"));
				
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return user;
	}
	
	//user type
	
	public String getUserType(String userName){
        String str="";
        PreparedStatement pstm;
        try {
            pstm = conn.prepareStatement("Select * from user where uname=?");
            pstm.setString(1, userName);
            ResultSet rs=pstm.executeQuery();
            while(rs.next()){
                str= rs.getString("status");
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            str= "error";
        }
        return str;
    }

	
	public boolean updateUser(User user) {
		boolean f = false;
		try {
			
			String sql= "update user set fname=? , lname=? , uname=? , email=? , pass=? , contactno=? , city=? , address=? where user_id=?";
			
			PreparedStatement pstm=this.conn.prepareStatement(sql);
            pstm.setString(1,user.getFirstName() );
            pstm.setString(2,user.getLastName() );
            pstm.setString(3,user.getUserName() );
            pstm.setString(4,user.getEmail() );
            pstm.setString(5,user.getPassword() );
            pstm.setString(6,user.getContact());
            pstm.setString(7,user.getCity() );
            pstm.setString(8,user.getAddress());
			pstm.setInt(9, user.getUserId());
			
			pstm.executeUpdate();
			f = true;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
	}
	
	

	//get gift
	
	public ArrayList getAllGift() {
		ArrayList list = new ArrayList();
		Gift gift = null;
		try {
			String sql = "SELECT * from gift";
			PreparedStatement pstm = this.conn.prepareStatement(sql);
	            ResultSet rs=pstm.executeQuery();
	            while(rs.next()){
	                list.add(rs.getString(1));
	                list.add(rs.getString(2));
	                list.add(rs.getBlob(3));
	                list.add(rs.getString(4));
	                list.add(rs.getString(5));
	                list.add(rs.getString(6));
	            }
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
		
	}
	
	
	
	public Gift getGiftByCategory(String category){
       Gift gift = null;
		
		try {
			
			String sql = "select * from gift where category=?";
			
			PreparedStatement pstm=this.conn.prepareStatement(sql);
			pstm.setString(1,category);
			
			ResultSet rs = pstm.executeQuery();
	     
	     
	         if(rs.next()){
	             gift = new Gift();
	             gift.setname(rs.getString("pname"));
	             gift.setcategory(rs.getString("category"));
	             gift.setprice(rs.getString("price"));
	             gift.setdescription(rs.getString("desp"));
	                    
	         }
	         pstm.close();
	     }catch(Exception e){
	          e.printStackTrace();
	     }
	     
	     return gift;
	    }
	
	
	
	
	public Gift getGiftById(int Id){
	    Gift gift = null;
	     try{
	         PreparedStatement pstm=conn.prepareStatement("select prod_id,price from gift where prod_id=?");
	        pstm.setInt(1,Id);
	         ResultSet rs=pstm.executeQuery();
	         
	         while(rs.next()){
	             gift = new Gift();
	             
	             gift.setid(rs.getInt("prod_id"));
//	             gift.setname(rs.getString("pname"));
//	             gift.setcategory(rs.getString("category"));
	             gift.setprice(rs.getString("price"));
//	             gift.setdescription(rs.getString("desp"));
	               
	         }
	         pstm.close();
	     }catch(Exception e){
	    	 e.printStackTrace();
	     }
	     
	     return gift;
	    }
	    






//Add Booking
	
	public boolean addBooking(Booking booking) {
		boolean f = false;
		
		try {
			String sql="INSERT into booking(cname,email,contact,city,address,gid,price,quantity,total) values(?,?,?,?,?,?,?,?,?)";
            
            PreparedStatement pstm=conn.prepareStatement(sql);
            pstm.setString(1,booking.getFirstName());
            pstm.setString(2,booking.getEmail());
            pstm.setString(3,booking.getContact());
            pstm.setString(4,booking.getCity());
            pstm.setString(5,booking.getAddress() );  
            pstm.setString(6,booking.getGiftId());
            pstm.setString(7,booking.getPrice());
            pstm.setString(8,booking.getQuantity());
            pstm.setString(9,booking.getTotal());
            pstm.executeUpdate();
            f = true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
	}
	
	
	
	//delete booking
	
	public boolean delBooking(int Id){
		boolean f = false;
        try {
            String sql="DELETE from booking where bid=?";
            PreparedStatement pstm=conn.prepareStatement(sql);
            pstm.setInt(1,Id);
            pstm.executeUpdate();
            pstm.close();
            f = true;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return f;
    }
	
	public boolean delGift(int Id){
		boolean f = false;
        try {
            String sql="DELETE from gift where prod_id=?";
            PreparedStatement pstm=conn.prepareStatement(sql);
            pstm.setInt(1,Id);
            pstm.executeUpdate();
            pstm.close();
            f = true;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return f;
    }
	
	
	public boolean addProduct(Gift product) {
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
		}
		
		return f;
	}
	


}












