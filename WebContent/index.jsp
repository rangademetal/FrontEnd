<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%

	session.removeAttribute("username");
	session.removeAttribute("id");
	


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
   <link rel="stylesheet" type="text/css" href="style.css">
<title>Login</title>
</head>
<body>
	<form action="admin" method="post" class="form-area">
		<input type="email" name="email" placeholder="Email" required/>
		<input type="password" name="password" placeholder="Password" required/>
		<input type="submit" value="Login"/> 
		
	</form>
</body>
</html>