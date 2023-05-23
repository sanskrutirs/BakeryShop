<%@ page import="java.sql.*"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.entities.Gift"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@ page import="java.io.*"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.LocalTime"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
    int bid = Integer.parseInt(request.getParameter("bookingid"));
    String status = request.getParameter("status");
    
    
    
    
     try
    {
        Connection con=null;
    Statement stmt=null;
    String sql="update booking set status='"+status+"' where bid="+bid;
    Class.forName("com.mysql.jdbc.Driver");
    con= DriverManager.getConnection("jdbc:mysql://localhost:3306/bakery","root","Rscl_1166");
   stmt= con.createStatement();
   int n = stmt.executeUpdate(sql);
   //out.print();
   response.sendRedirect("showbooking.jsp");
    }
    catch(Exception e)
    {
        out.print("Hello");
    }
            
    
    
    
    
    
   

%>