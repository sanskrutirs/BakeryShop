<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.entities.Gift"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@ page import="java.sql.*"%>

<%@page import="java.util.ArrayList"%>

<%@ page import="java.io.*"%>
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
                  <div class="title">All Products</div>
                  <br>
               <div class="central-div form-style-6" style="position:inherit;margin-top: 10px;" >
                    
                <input type="hidden" name="pgprt" value="4">
                
                
                 <table id="one-column-emphasis" style="min-width: 400px;margin: 5px; margin-top: 35px" >
    <colgroup>
    	<col class="oce-first" />
    </colgroup>
    <thead>
    	<tr>
        	
                
            <th scope="col">Product Name</th>
            <th scope="col">Image</th>
            <th scope="col">Category</th>
                
            <th scope="col">Price</th>
         <th scope="col">Description</th>
        </tr>
    </thead>
              <%  if(request.getParameter("category")!=null){
            	  String category = request.getParameter("category");
                     try
                     {
                      Connection con;
                      Statement stmt;
                      String sql="select prod_id,pname,category,price,desp from gift where category=?";
                      Class.forName("com.mysql.jdbc.Driver");
                      con= DriverManager.getConnection("jdbc:mysql://localhost:3306/bakery","root","Rscl_1166");
                      stmt= con.createStatement();
                      PreparedStatement pstm=con.prepareStatement(sql);
          			  pstm.setString(1, category);
                      ResultSet rs = pstm.executeQuery();
                      while(rs.next())
                       {
                          %>    
                          
                                    
        
        <tr>
       
        <td><%=rs.getString(2) %></td>
         <td></td>
          <td><%=rs.getString(3) %></td>
           <td><%=rs.getString(4) %></td>
            <td><%=rs.getString(5) %></td>
            <%--controller.jsp?page=gift&operation=book&id=<%=rs.getString(1)%> --%>
            <td ><a  href="Product?id=<%=rs.getString(1) %>"
                 class="del">
                <div class="delete-btn" style="max-width: 40px;font-size: 15px; padding: 3px">Book Now</div>
            </a></td>
            </tr>
            <%
            }
                     }catch(Exception e){
            }
            }%>	
            </table>
            
            
            </div>
           
           </div>
           
        
</body>
</html>