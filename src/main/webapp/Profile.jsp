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
		<center><h2>Customer Panel</h2></center> 
		<a href="LogoutServlet" class="button" style="float: right;background:crimson;color:white">Logout</a>
	</div>

      <div class="sidebar"">
				<div class="sidebar-background" >
					<h2 class="logo-text">
						Online Bakery Shop
					</h2>

					<div class="left-menu">
						<a class="active" href="Edit.jsp"><h2>Profile</h2></a>
						<a href="product.jsp"><h2>Products</h2></a>
                        <a href="viewcart.jsp"><h2>View Cart</h2></a>
						<a href="Feedback.jsp"><h2>Feedback</h2></a>
                                             <%--<a href="Profile.jsp?pgprt=4"><h2>Edit Profile</h2></a> --%>  
					</div>
				</div>
			</div>
			
			<div class="content-area">
                            <div class="panel" style="float: left;max-width: 600px">
           
           <div id = "editprofile" style="">
                  <div class="title">Edit Profile</div>
                  <br>
               <div class="central-div form-style-6" style="position:inherit;margin-top: 70px;" >
                    <form action="EditServlet" method="post">
					
					<tr>
						<td>
							<label>First Name</label>
						</td>
						<td>
                                                    <input type="text" name="fname" value="<%=user.getFirstName() %>" class="text" placeholder="First Name">
						</td>
					</tr>
					<tr>
						<td>
							<label>Last Name</label>
						</td>
						<td>
                                                    <input type="text"  name="lname" value="<%=user.getLastName() %>" class="text" placeholder="Last Name">
						</td>
					</tr>
					
					<tr>
						<td>
							<label>User Name</label>
						</td>
						<td>
                                                    <input type="text" name="uname" value="<%=user.getUserName() %>" class="text" placeholder="User Name">
						</td>
					</tr>
					<tr>
						<td>
							<label>Email</label>
						</td>
						<td>
                                                    <input type="email" name="email" value="<%=user.getEmail() %>" class="text" placeholder="Email">
						</td>
					</tr>
					
					<tr>
						<td>
							<label>Password</label>
						</td>
						<td>
                                                    <input type="password" value="<%=user.getPassword() %>" name="pass" class="text" placeholder="Password">
						</td>
					</tr>
                                        <tr>
						<td>
							<label>Contact No</label>
						</td>
						<td>
                                                    <input type="text" name="contactno" value="<%=user.getContact() %>" class="text" placeholder="Contact No">
						</td>
					</tr>
                                        <tr>
						<td>
							<label>City</label>
						</td>
						<td>
                                                    <input type="text" name="city" value="<%=user.getCity() %>" class="text" placeholder="City">
						</td>
					</tr>
                                        <tr>
						<td>
							<label>Address</label>
						</td>
						<td>
                                                    <input type="text" name="address" value="<%=user.getAddress() %>" class="text" placeholder="Address">
						</td>
					</tr>
					<tr>
						<td>
						</td>
						<td>
							<center>
							
							<input type="submit" value="Done" class="button">
							</center>
						</td>
					</tr>
				</table>
			</form>
		</div>
           
           </div>
           
        
</body>
</html>