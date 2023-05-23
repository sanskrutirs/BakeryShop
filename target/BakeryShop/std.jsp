<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.helper.ConnProvider"%>

<%@page errorPage="error.jsp" %>  

<%
    User user = (User)session.getAttribute("currentuser");
    //if(user==null){
    //	response.sendRedirect("login.jsp");
   // }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>
<!DOCTYPE html>
<html lang="en-US">
    <head>
        
        <meta charset="UTF-8">
	<meta http-equiv="X-UA-compatible" content = "IE-edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel ="stylesheet" type ="text/css" href="bootstrap.min.css">
        <script src="jquery-3.3.1.min.js"></script>
        <script type = text/javascript src="bootstrap.min.js"></script>
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
        
        <title>Bakery Shop</title>
        <style>
           
  /* Make the image fully responsive */
  .carousel-inner img {
      width: 100%;
      height: 400px;
      
      
      
   
 
        </style>
    </head>
    <body style = "background-color: #DEDEDE">
    
    <%
    Connection conn=ConnProvider.getConnection();
    %>
    <h1><%= conn %></h1>
        <!-- Start Nagigation -->
  <nav class="navbar navbar-expand-sm navbar-dark bg-danger pl-5 fixed-top">
    <a href="Edit.jsp" class="navbar-brand"><%=  "Welcome " +  user.getFirstName()+" " %><%=user.getLastName() %></a>
    <%--<span class="navbar-text">Cheap And Best</span> --%>
    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#myMenu">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="myMenu">
      <a href="LogoutServlet" class="button" style="float: right;background:crimson;color:white">Logout</a>
    </div>
  </nav> <!-- End Navigation -->
  
  
  
  <div id="demo" class="carousel slide" data-ride="carousel">

  <!-- Indicators -->
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
    <li data-target="#demo" data-slide-to="3"></li>
    <li data-target="#demo" data-slide-to="4"></li>
  </ul>
  
  <!-- The slideshow -->
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="myimages/1.jpg" alt="Los Angeles" width="1100" height="200">
    </div>
    <div class="carousel-item">
      <img src="myimages/2.jpg" alt="Chicago" width="1100" height="200">
    </div>
    <div class="carousel-item">
      <img src="myimages/3.jpg" alt="New York" width="1100" height="200">
    </div>
      <div class="carousel-item">
      <img src="myimages/4.jpg" alt="New York" width="1100" height="200">
    </div>
      <div class="carousel-item">
      <img src="myimages/5.jpg" alt="New York" width="1100" height="200">
    </div>
  </div>
  
  <!-- Left and right controls -->
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>
</div>
  
  
  <div class="container" style = "margin-top : 60px">
      <div class = row>
          <div class = col-sm-3>
  
  <h2 class = text-center style = "font-family : Monotype Corsiva ; color : red">Breads</h2>          
  <a href = "giftbycategory.jsp?category=b"><img src="myimages/breads.jpg" class="img-thumbnail" alt="Breads" style = "width:304px; height : 236px"> </a>
      </div>
          
          
          <div class = col-sm-3>
  <h2 class = text-center style = "font-family : Monotype Corsiva ; color : red">Cakes</h2>          
  <a href = "giftbycategory.jsp?category=c"><img src="myimages/cakes.jpg" class="img-thumbnail" alt="Cakes" style = "width:304px; height : 236px"> </a>
      </div>
          
                  <div class = col-sm-3>
  <h2 class = text-center style = "font-family : Monotype Corsiva ; color : red">Pastries</h2>          
  <a href = "giftbycategory.jsp?category=p"><img src="myimages/pastries.jpg" class="img-thumbnail" alt="Pastries" style = "width:304px; height : 236px"> </a>
      </div>
        
          <div class = col-sm-3>
  <h2 class = text-center style = "font-family : Monotype Corsiva ; color : red">Cookies</h2>          
  <a href = "giftbycategory.jsp?category=coo"><img src="myimages/cookies.jpg" class="img-thumbnail" alt="cookies" style = "width:304px; height : 236px"> </a>
      </div>
          
      </div>
</div>
  
  
  
  
          
   
  
  
  
  
  
  
  
  
  
  
  
  
  
 
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
    </body>
</html>
