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
	<%
		int id =(int) session.getAttribute("id");
		out.println(id);
		
		try{
			
		}
		catch(Exception e) {
			
		}
	%>
</body>
</html>