<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

        <link rel ="stylesheet" type ="text/css" href="bootstrap.min.css">
<title>Sorry something went wrong....</title>
</head>
<body>

<div class= "container text-center">
    <img src = "error-message.png">
    
    <h1>Sorry something went wrong...</h1>
    <%= exception %>
    
    <h2 class="button"><a href ="login.jsp">Login Again</a></h2>
</div>

</body>
</html>