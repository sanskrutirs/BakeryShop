<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
	<meta http-equiv="X-UA-compatible" content = "IE-edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel ="stylesheet" type ="text/css" href="bootstrap.min.css">
        <script src="jquery-3.3.1.min"></script>
        <script src="bootstrap.min.js"></script>
        <title>Online Bakery Shop</title>
    </head>
    <body>
        <div class = container style = "margin-top: 100px">
        <nav class="navbar navbar-expand-sm navbar-dark bg-danger pl-5 fixed-top">
    <a href="index.jsp" class="navbar-brand">Online Bakery Shop</a>
    <span class="navbar-text">Cheap And Best</span>
    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#myMenu">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="myMenu">
      <ul class="navbar-nav pl-5 custom-nav">
        <li class="nav-item"><a href="index.jsp" class="nav-link">Home</a></li>
        <li class="nav-item"><a href="login.jsp" class="nav-link">Login</a></li>
        <li class="nav-item"><a href="#Team" class="nav-link">Team</a></li>
        <li class="nav-item"><a href="#Contact" class="nav-link">Contact</a></li>
      </ul>
    </div>
  </nav> <!-- End Navigation -->
        </div>
              
        
       <div class="container">
			<form action="LoginServlet" method="post" name="form">
				<table>
					<tr>
						<td colspan="2">
							<center><h2>Login Form</h2></center>
						</td>
					</tr>
					<tr>
						<td>
							<label>User Name</label>
						</td>
						<td>
                                                    <input type="text" class="text" placeholder="User Name" name="uname">
						</td>
					</tr>
					<tr>
						<td>
							<label>Password</label>
						</td>
						<td>
                                                    <input type="password" class="text" placeholder="Password" name="pass">
						</td>
					</tr>
					<tr>
						<td>
							
						</td>
						<td>
                                                   
                                                    
                                                    
                                                 <!--   <a href="">Forgot Passowrd</a></td>-->
					</tr>
					<tr>
						<td>
						</td>
						<td>
							<center>
							<input type="submit" value="Login" class="button">
                                                       <!-- <input type="submit" value="Sign Up" class="button">-->
							</center>
						</td>
					</tr>
				</table>
			</form>
			<h2><a href ="signup.jsp">Signup</a></h2>
		</div> 
    </body>
</html>
    