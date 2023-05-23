<%@page import="com.tech.blog.entities.User"%>
<%@ page import="java.sql.*"%>

<%@ page import="java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    //String id = request.getParameter();
User user = (User)session.getAttribute("currentuser");
if(user==null){
	response.sendRedirect("login.jsp");
}
              
    %>
    <%
    try
    {
              String name = request.getParameter("name").toString();
              String mobile = request.getParameter("mobileno").toString();
              String email = request.getParameter("emailid").toString();
              String date = request.getParameter("date").toString();
              String msg = request.getParameter("message").toString();
              Connection con=null;
    
    
              Class.forName("com.mysql.jdbc.Driver");
	          con= DriverManager.getConnection("jdbc:mysql://localhost:3306/bakery","root","Rscl_1166");
	            
   
   
   
            String sql="INSERT into feedback(name,contact,email,date,message) Values(?,?,?,?,?)";
            PreparedStatement pstm=con.prepareStatement(sql);
            pstm.setString(1, name);
            pstm.setString(2,mobile);
            pstm.setString(3,email);
            pstm.setString(4, date);
            pstm.setString(5,msg);
          int n=  pstm.executeUpdate();
            pstm.close();
   if(n>0)
   {
       response.sendRedirect("Feedback.jsp");
   }
   else
   {
       response.sendRedirect("error.jsp");
   }
   
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
    %>
