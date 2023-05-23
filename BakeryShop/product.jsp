<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.entities.Gift"%>
<%@ page import="java.sql.*"%>

<%@ page import="java.io.*"%>
<%@page errorPage="error.jsp" %>  
    
<%--
    User user = (User)session.getAttribute("currentuser");
    if(user==null){
    	response.sendRedirect("login.jsp");
    }
--%>

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
						<a  href="Edit.jsp"><h2>Profile</h2></a>
						<a class="active" href="product.jsp"><h2>Products</h2></a>
                        <a href="viewcart.jsp"><h2>View Cart</h2></a>
						<a href="Feedback.jsp"><h2>Feedback</h2></a>
                                             <%--<a href="Profile.jsp?pgprt=4"><h2>Edit Profile</h2></a> --%>  
					</div>
				</div>
			</div>
			
			<div class="content-area">
                            <div class="panel" style="float: left;max-width: 600px">
           
           <div id = "editprofile" style="">
                  <div class="title">Show All Products for</div>
                  <br>
               <div class="central-div form-style-6" style="position:inherit;margin-top: 10px;" >
                    <form action="gift1.jsp">
                <label>Select Category</label>
                <input type="hidden" name="pgprt" value="4">
                <select name="category" class="text">
                
                
                <% 
                     try
                     {
                      Connection con;
                      Statement stmt;
                      String sql="select distinct category from gift";
                      Class.forName("com.mysql.jdbc.Driver");
                      con= DriverManager.getConnection("jdbc:mysql://localhost:3306/bakery","root","Rscl_1166");
                      stmt= con.createStatement();
                      ResultSet rs = stmt.executeQuery(sql);
                      while(rs.next())
                       {
                          %>
                         <option value="<%=rs.getString("category")%>"><%=rs.getString("category")%></option>
                       <%
                       }
   
                      }
                       catch(Exception e)
                        {
        
                        }
                 %>
                
                </select>
            <input type="submit" value="Show" class="form-button">
            </form>
		</div>
           
           </div>
           
        
</body>
</html>