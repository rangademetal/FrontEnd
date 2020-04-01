<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" type="text/css" href="style.css">

</head>
<body>

	<nav>
		<ul>
			<li style="float:right"><a href="/FrontEnd/logout" >Logout</a></li>
		</ul>
		
	</nav>
	<form action="add" method="post">
		<input type="text" name="title" placeholder="Title" required/>
		<input type="text" name="description" placeholder="Description" required/>
		<textarea name="html" placeholder="HTML code" ></textarea>
		<textarea name="css" placeholder="CSS code"></textarea>
		<textarea name="js" placeholder="JS code"></textarea>
		<input type="submit" value="Add"/>
	</form>
</body>
</html>