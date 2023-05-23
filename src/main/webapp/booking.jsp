<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.entities.Gift"%>


<%
    User user = (User)session.getAttribute("currentuser");
    if(user==null){
    	response.sendRedirect("login.jsp");
    }
%>

<%
    Gift gift = (Gift)session.getAttribute("currentgift");
    if(user==null){
	      response.sendRedirect("error.jsp");
    }
    
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
    function calc()
    {
        
     var quantity1 = document.getElementById("quantity").value;
     
     var price1 = document.getElementById("sprice").value;
     var totalprice = parseInt(quantity1)*parseInt(price1);
     
     document.getElementById("total").value = totalprice;
    }
</script>


<link rel="stylesheet" type="text/css" href="style-backend.css">
</head>
<body style = "background-image: url(bg1.jpg); background-size : 100%">

<div class="top-area">
		<center><h2>Customer Panel</h2></center> 
		<a href="LogoutServlet" class="button" style="float: right;background:crimson;color:white">Logout</a>
	</div>

      <div class="sidebar">
				<div class="sidebar-background" >
					<h2 class="logo-text">
						Online Bakery Shop
					</h2>

					<div class="left-menu">
						<a  href="Edit.jsp"><h2>Profile</h2></a>
						<a class="active" href="product.jsp"><h2>Products</h2></a>
                        <a href="viewcart.jsp"><h2>View Cart</h2></a>
						<a href="Feedback.jsp"><h2>Feedback</h2></a>
                                             <%--<a href="Profile.jsp?pgprt=4"><h2>Edit Profile</h2></a> --%>  
					</div>
				</div>
			</div>
			
			 <!-- CONTENT AREA -->
			<div class="content-area">
                            <div class="panel" style="float: left;max-width: 600px">
        
                                
        
           
           <div class="title">Profile</div>
           <div class="profile ">
               <form action="BookServlet" method="POST">
                        <input type="hidden" name="page" value="booking"> 
               <h2><span class="tag">Your Name</span><input type="text" value="<%=user.getFirstName()%>" name = "fname"><br/>
               <span class="tag">Email</span><input type="text" value="<%=user.getEmail()%>" name="email"><br/>
               <span class="tag">Contact No</span><input type="text" value="<%=user.getContact()%>" name="contact"><br/>
               <span class="tag">City</span><input type="text" value="<%=user.getCity()%>" name="city"><br/>
               <span class="tag">Address</span><input type="text" value="<%=user.getAddress()%>" name="address"></h2>
               <span class="tag">Product Id</span><input type="text" value="<%=gift.getid()%>" name="giftid"><br/>
               <span class="tag">Price</span><input type="text" value="<%=gift.getprice()%>" name="sprice" id="sprice"><br/>
               <span class="tag">Quantity</span><span class="val"><input type = "text" name = "quantity" id = "quantity" onkeyup="calc()" required></span><br/>
               <span class="tag">Total Amount</span><span class="val"><input type="text" value="0" name="total" id="total"></span>
               <span class="add-btn"><a href = "https://rzp.io/l/ZfLFnMzL" target="_blank"><input type = submit value="Confirm Booking"></a></span>            
               </form>

           </div>
              
               <br/>
               
             
           
               
			

</body>
</html>