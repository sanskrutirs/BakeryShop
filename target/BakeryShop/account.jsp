<%@page import="com.tech.blog.entities.User"%>

<%@page errorPage="error.jsp" %>  
    
<%
    User user = (User)session.getAttribute("currentuser");
    if(user==null){
    	response.sendRedirect("login.jsp");
    }
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<link rel="stylesheet" type="text/css" href="style-backend.css">
</head>
<body style = "background-image: url(bg1.jpg); background-size : 100%"">
<div class="top-area">
		<center><h2>Admin Panel</h2></center> 
		<a href="LogoutServlet" class="button" style="float: right;background:crimson;color:white">Logout</a>
	</div>

      <div class="sidebar"">
				<div class="sidebar-background" >
					<h2 class="logo-text">
						Online Bakery Shop
					</h2>

					<div class="left-menu">
						<a class="active" href="Edit.jsp?pgprt=0"><h2>Profile</h2></a>
						<a href="product.jsp"><h2>Products</h2></a>
                        <a href="viewcart.jsp?"><h2>Booking</h2></a>
						<a href="account.jsp"><h2>Account</h2></a>
						<a href="viewfeedback.jsp"><h2>Feedback</h2></a>
                                               
                                           <%-- <a href="Profile.jsp?pgprt=4"><h2>Edit Profile</h2></a> --%>  
					</div>
				</div>
			</div>
			
			<div class="content-area">
                            
           
           <div class="inner" style="margin-top: 50px">
                                <div class="title" style="margin-top: -30px">List of All Registered Persons</div>
       
                  <br>
               <div class="central-div form-style-6" style="position:inherit;margin-top: 70px;" >
                    <form action="EditServlet" method="post">
                    
                   <div class="profile ">
               <h2><span class="tag">Your Name</span><span class="val"><%=user.getFirstName()+" " %><%=user.getLastName() %></span><br/>
               <span class="tag">Email</span><span class="val"><%=user.getEmail() %></span><br/>
               <span class="tag">Contact No</span><span class="val"><%=user.getContact() %></span><br/>
               <span class="tag">City</span><span class="val"><%=user.getCity() %></span><br/>
               <span class="tag">Address</span><span class="val"><%=user.getAddress() %></span></h2>
           </div>
					
			<a href="Profile.jsp?pgprt=0&pedt=1"><span class="add-btn">Edit Profile</span></a>
		</div>
           
           </div>
           
        
</body>
</html>