<%@ page import="java.sql.*"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.entities.Gift"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@ page import="java.io.*"%>
<%@page import="java.util.ArrayList"%>

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
						<a href="adm-page.jsp"><h2>Profile</h2></a>
						<a href="gift.jsp"><h2>Products</h2></a>
                        <a href="showbooking.jsp?"><h2>Orders</h2></a>
						<%-- <a href="account.jsp"><h2>Account</h2></a> --%>
						<a class="active" href="viewfeedback.jsp"><h2>Feedback</h2></a>  
					</div>
				</div>
			</div>
			
			
			<div class="content-area">
                            <div class="inner" style="margin-top: 50px">
                                <div class="title" style="margin-top: -30px">List of All Feedbacks</div>
                                
           <br>
           
           
                       <table id="one-column-emphasis" >
    <colgroup>
    	<col class="oce-first" />
    </colgroup>
    <thead>
    	<tr>
            <th scope="col">ID</th>
        	<th scope="col">Name</th>
                
            <th scope="col">Contact</th>
            <th scope="col">Email ID</th>
            <th scope="col">Date</th>
            <th scope="col">Message</th>
            
        </tr>
    </thead>
    <tbody>
           <%
              try
    {
        
        Connection con=null;
    ResultSet rs = null;
    
    Class.forName("com.mysql.jdbc.Driver");
    con= DriverManager.getConnection("jdbc:mysql://localhost:3306/bakery","root","Rscl_1166");
   
   
   
   String sql="select * from feedback";
            Statement stmt=con.createStatement();
            
           rs =  stmt.executeQuery(sql);
            while(rs.next())
            {
                %>
                
                <tr>
                    <td><%=rs.getString("fid") %></td>
        	<td><%=rs.getString("name") %></td>
            <td><%=rs.getString("contact") %></td>
            <td><%=rs.getString("email") %></td>
            <td><%=rs.getString("date") %></td>
            <td><%=rs.getString("message") %></td>
            <td><a href="feedbackdelete.jsp?id=<%=rs.getString("id") %>" 
                  onclick="return confirm('Are you sure you want to delete this ?');">
                <div class="delete-btn" style="max-width: 40px;font-size: 17px; padding: 3px">X</div>
                </a></td>
            
        </tr>
                
                
                <%
            }
   
   
    }
    catch(Exception e)
    {
        
    }
    %>
   
    	
         
               
               
               
               
                </tbody>
</table>
           
    
                            </div>
                        </div>
			
			
</body>
</html>
            <!-- CONTENT AREA -->
			