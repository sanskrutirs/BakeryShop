<!DOCTYPE html>
<html>
<head>
	<title></title>
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<center>
		<div class="central-div" style="top:10%">
                    <form action="RegServlet" method="post" name="form">
                        
				<table>
					<tr>
						<td colspan="2">
							<center><h2>SignUp</h2></center>
						</td>
					</tr>
					<tr>
						<td>
							<label>First Name</label>
						</td>
						<td>
                                                    <input type="text" name="fname" class="text" placeholder="First Name" required>
						</td>
					</tr>
					<tr>
						<td>
							<label>Last Name</label>
						</td>
						<td>
                                                    <input type="text"  name="lname" class="text" placeholder="Last Name" required>
						</td>
					</tr>
					
					<tr>
						<td>
							<label>User Name</label>
						</td>
						<td>
                                                    <input type="text" name="uname" class="text" placeholder="User Name" required>
						</td>
					</tr>
					<tr>
						<td>
							<label>Email</label>
						</td>
						<td>
                                                    <input type="email" name="email" class="text" placeholder="Email" required>
						</td>
					</tr>
					
					<tr>
						<td>
							<label>Password</label>
						</td>
						<td>
                                                    <input type="password" name="pass" class="text" placeholder="Password" required>
						</td>
					</tr>
					<tr>
                           <td><label>Register As</label></td>
                           <td>
                                <!--<input type="text" name="category" class="text" placeholder="Category" style="width: 230px;" >-->
                                <select name="status">
                                    <option value="adm">adm</option>
                                    <option value="std">std</option>
                                    
                                </select>
                           </td>
                           
                       </tr>
                     <tr>
						<td>
							<label>Contact No</label>
						</td>
						<td>
                                                    <input type="text" name="contactno" class="text" placeholder="Contact No" required>
						</td>
					</tr>
                                        <tr>
						<td>
							<label>City</label>
						</td>
						<td>
                                                    <input type="text" name="city" class="text" placeholder="City" required>
						</td>
					</tr>
                                        <tr>
						<td>
							<label>Address</label>
						</td>
						<td>
                                                    <input type="text" name="address" class="text" placeholder="Address" required>
						</td>
					</tr>
					<tr>
						<td>
						</td>
						<td>
							<center>
							
							<input type="submit" value="Register Now" class="button">
							</center>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</center>
</body>
</html>
