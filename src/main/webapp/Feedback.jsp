<%@page import="com.tech.blog.entities.User"%>

<%@page errorPage="error.jsp" %>  
    
<%
    User user = (User)session.getAttribute("currentuser");
    if(user==null){
    	response.sendRedirect("login.jsp");
    }
%>
<%@ page import="java.util.Date"%>

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
					
					<% Date date = new Date(); %>

					<div class="left-menu">
						<a href="Edit.jsp"><h2>Profile</h2></a>
						<a href="product.jsp"><h2>Products</h2></a>
                        <a href="viewcart.jsp?"><h2>View Cart</h2></a>
						<a class="active" href="Feedback.jsp"><h2>Feedback</h2></a>
                                               
                                           <%-- <a href="Profile.jsp?pgprt=4"><h2>Edit Profile</h2></a> --%>  
					</div>
				</div>
			</div>
			
			<div class="content-area">
                            <div class="panel" style="float: left;max-width: 600px">
           
           <div id = "editprofile" style="">
                  <div class="title">Feedback</div>
                  <br>
               <div class="central-div form-style-6" style="position:inherit;margin-top: 10px;" >
                   
               <form action="myfeedback.jsp"  method="post">
                   <table >
                       <tr>
                           <td><label>Name</label></td>
                           <td> <input type="text" name="name" class="text" placeholder="Name" value="<%=user.getFirstName()+" " %><%=user.getLastName() %>"  style="width: 230px;"></td>
                       </tr>
                       <tr>
                           <td><label>Mobile No.</label></td>
                           <td><input type="text" name="mobileno" value="<%=user.getContact() %>" style="width: 230px;" ></td>
                       </tr>
                       <tr>
                           <td><label>Email Id</label></td>
                           <td>
                                <input type="text" name="emailid" value="<%=user.getEmail() %>" class="text" placeholder="Email ID" style="width: 230px;" >
                           </td>
                           
                       </tr>
                        <tr>
                           <td><label>Date</label></td>
                           <td>
                               <%--java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MM/yyyy"); --%>
                               <!-- input type="date" name="date" class="text" value="<%-- df.format(new java.util.Date())--%>" style="width: 230px;" readonly> -->
                               <input type="text" name="date" class="text" id="dateInput" style="width: 230px;" readonly>

<script>
  var today = new Date();
  var day = today.getDate();
  var month = today.getMonth() + 1; // January is month 0
  var year = today.getFullYear();

  if (day < 10) {
    day = "0" + day;
  }
  if (month < 10) {
    month = "0" + month;
  }

  var formattedDate = day + "/" + month + "/" + year;
  document.getElementById("dateInput").value = formattedDate;
</script>
                               
                  
                           </td>
                           
                       </tr>
                       
                        <tr>
                           <td><label>Message</label></td>
                           <td>
                               <textarea name="message" class="text" placeholder="Message" style="width: 230px;" required></textarea>
                           </td>
                           
                       </tr>
                       <tr>
                        <td colspan="2"><!--<input type="hidden" name="page" value="gift">
                    <input type="hidden" name="operation" value="addnew">-->
                       <center><input type="submit" class="form-button" value="Submit" name="submit"></center></td>
                       </tr>
                   </table>  
                           
                           
                </form>
		       </div>
           
           </div>
           
        
</body>
</html>