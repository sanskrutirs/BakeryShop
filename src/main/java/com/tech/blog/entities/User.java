package com.tech.blog.entities;

public class User {
	

	   private int userId;
	   private String firstName,lastName,userName,email,password,contact,city,address,status;
	 
	   
	   public User(){
	       
	   }
	   
	   public User(int userId, String firstName, String lastName, String userName, String email, String password,String status, String contact, String city, String address) {
			super();
			this.userId = userId;
			this.firstName = firstName;
			this.lastName = lastName;
			this.userName = userName;
			this.email = email;
			this.password = password;
			this.status = status;
			this.contact = contact;
			this.city = city;
			this.address = address;
		}
	   
	   public User(String firstName, String lastName, String userName, String email, String password,String status,
				String contact, String city, String address) {
			super();
			this.firstName = firstName;
			this.lastName = lastName;
			this.userName = userName;
			this.email = email;
			this.password = password;
			this.status = status;
			this.contact = contact;
			this.city = city;
			this.address = address;
		}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	   
	   //getters and setters
	   
	   
	   
	   
	   
	   

}
