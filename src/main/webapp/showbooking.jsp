<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.entities.Gift"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@ page import="java.sql.*"%>
<%@page errorPage="error.jsp" %>  
    
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
						<a href="adm-page.jsp"><h2>Profile</h2></a>
						<a href="gift.jsp"><h2>Products</h2></a>
                        <a class="active" href="showbooking.jsp?"><h2>Orders</h2></a>
						<%-- <a href="account.jsp"><h2>Account</h2></a> --%>
						<a href="viewfeedback.jsp"><h2>Feedback</h2></a>
					</div>
				</div>
			</div>
		
	           
			<div class="content-area">
                            
                            <div class="panel" style="max-width: 700px;">
                                <div class="title">
                                   All Bookings
                                </div>
                                <table id="one-column-emphasis" style="min-width: 400px;margin: 5px; margin-top: 35px" >
    <colgroup>
    	<col class="oce-first" />
    </colgroup>
    <thead>
    	<tr>
        	
                
            <th scope="col">Booking ID</th>
            <th scope="col">Booking Date</th>
            <th scope="col">Product ID</th>
                
            <th scope="col">Price</th>
         <th scope="col">Quantity</th>
         <th scope="col">Total Amount</th>
         <th scope="col">Status</th>
        </tr>
    </thead>
          <% 
                     try
                     {
                      Connection con;
                      Statement stmt;
                      String sql="select bid, bookdate,gid,price,quantity,total,status from booking";
                      Class.forName("com.mysql.jdbc.Driver");
                      con= DriverManager.getConnection("jdbc:mysql://localhost:3306/bakery","root","Rscl_1166");
                      stmt= con.createStatement();
                      PreparedStatement pstm=con.prepareStatement(sql);
                      ResultSet rs = pstm.executeQuery();
                      while(rs.next())
                       {
                          %>    
                          
                          
                              <tr>
       
        <td><%=rs.getString(1) %></td>
          <td><%=rs.getString(2) %></td>
           <td><%=rs.getString(3) %></td>
            <td><%=rs.getString(4) %></td>
            <td><%=rs.getString(5) %></td>
            <td><%=rs.getString(6) %></td>
            <td><%=rs.getString(7) %></td>
            <%--controller.jsp?page=gift&operation=book&id=<%=rs.getString(1)%> --%>
            <td ><a  href="DelgiftServlet?id=<%=rs.getString(1) %>"
                 class="del" onclick="return confirm('Are you sure you want to delete this ?');">
                <div class="delete-btn" style="max-width: 57px;font-size: 15px; padding: 3px">Cancel Booking</div>
            </a></td>
            </tr>
            <%
            }
                     }catch(Exception e){
            }
            %>	
                                       
        
            </table>
                        
                   
            </div>
       <div  class="panel form-style-6" style="max-width: 450px" >
           <div class="title">
                                   Update Status
                                </div>
            <center>
               <form action="statusUpdate.jsp" enctype="multipart/form-data">
                   <br>
                   <table >
                       <tr>
                           <td><label>Booking ID</label></td>
                           <td> <input type="text" name="bookingid" class="text" placeholder="Booking ID"  style="width: 150px;"></td>
                           
                       </tr>
                       <tr>
                           <td><label>Status</label></td>
                                   <td><select name = status style="width: 150px;">
                                           <option value = "Ordered Placed">Ordered Placed</option>
                                           <option value = "In Delivery">In Delivery</option>
                                           <option value = "Delivered">Delivered</option>
                               </select></td>
                           
                       </tr>
                      
                       
                        
                       
                        
                       <tr>
                           <td colspan="2"><input type="hidden" name="page" value="bookUpdate">
                                 <input type="hidden" name="operation" value="addnew">
                                     <center><input type="submit" class="form-button" value="Submit" name="submit" style = "width : 200px"></center>
                           </td>
                       </tr>
                   </table>

                </form>
            </center>
           
    </div>
        
</body>
</html>