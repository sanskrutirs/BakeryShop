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
	<style type="text/css">
	   .prod-file input[type="file"]{
	      
	   }
	   
	   .prod-file label{
	      cursor : pointer;
	      background: #ed1c24;
	      display :inline-block;
	      color: #fff;
	      padding: 10px 20px;
	      text-align: center;
	      
	   }
	
	</style>
	
	 <script src=
"https://code.jquery.com/jquery-1.12.4.min.js">
    </script>
	
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
						<a  href="adm-page"><h2>Profile</h2></a>
						<a class="active" href="gift.jsp"><h2>Products</h2></a>
                        <a href="showbooking.jsp"><h2>Orders</h2></a>
						<a href="viewfeedback.jsp"><h2>Feedback</h2></a>
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
              <%  
                     try
                     {
                      Connection con;
                      Statement stmt;
                      String sql="select prod_id,pname,category,price,desp from gift ";
                      Class.forName("com.mysql.jdbc.Driver");
                      con= DriverManager.getConnection("jdbc:mysql://localhost:3306/bakery","root","Rscl_1166");
                      stmt= con.createStatement();
                      PreparedStatement pstm=con.prepareStatement(sql);
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
            <td ><a  href="DelGift?id=<%=rs.getString(1)%>" 
                onclick="return confirm('Are you sure you want to delete this ?');" class="del">
                <div class="delete-btn" style="max-width: 40px;font-size: 17px; padding: 3px">X</div>
            </a></td>
            </tr>
            <%
            }
                     }catch(Exception e){
            }
            %>	
            </table>
            
            
            </div>
           
           </div>
           
        
        <div  class="panel form-style-6" style="max-width: 450px" >
           <div class="title">
                                   Add New Product
                                </div>
           
               <form action="UploadImage" enctype="multipart/form-data" method="post">
                   <br>
                   <table >
                       <tr>
                           <td><label>Product Name</label></td>
                           <td> <input type="text" name="name" class="text" placeholder="Product Name"  style="width: 230px;"></td>
                       </tr>
                       <tr>
                           <td><label>Image</label></td>
                               <td> <input type="file" name="image" id="file-id" onchange="theimage();" style="width: 230px;" > </td>
                       </tr>
                       <tr>
                           <td><label>Category</label></td>
                           <td>
                                <!--<input type="text" name="category" class="text" placeholder="Category" style="width: 230px;" >-->
                                <select name="category">
                                    <option value="cake">Cake</option>
                                    <option value="pastries">Pastries</option>
                                    <option value="cookies">Cookies</option>
                                    <option value="breads">Breads</option>
                                    
                                </select>
                           </td>
                           
                       </tr>
                        <tr>
                           <td><label>Price</label></td>
                           <td>
                                <input type="text" name="price" class="text" placeholder="Price" style="width: 230px;" >
                           </td>
                           
                       </tr>
                       
                        <tr>
                           <td><label>Description</label></td>
                           <td>
                                <input type="text" name="description" class="text" placeholder="Description" style="width: 230px;" >
                           </td>
                           
                       </tr>
                       <tr>
                        <td colspan="2"><!--<input type="hidden" name="page" value="gift">
                    <input type="hidden" name="operation" value="addnew">-->
                       <center><input type="submit" class="form-button" value="Add" name="submit"></center></td>
                       </tr>
                   </table>

                </form>
            
           
    </div>
     </div>
             
        <script type="text/javascript">
        document.getElementById("file-id").files[0].name;
        	 
    </script>
        
        </script>
</body>
</html>