<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="style.css">
	<script type="text/javascript">
		function refresh() {
			var textContentHTML = document.getElementById("html").value;
			document.getElementById("viewer").srcdoc = textContentHTML;
		}
	</script>
</head>
<body>
	<nav>
		<ul>
			<li style="float:right"><a href="/FrontEnd/logout" >Logout</a></li>
		</ul>
	</nav>
	<form action="add" class="form-add" method="post">
		
		<input type="text" name="title" placeholder="Title" required/>
		<div class="form-add-description">
			<input type="text" name="description" placeholder="Description" required/>
		</div>
		<div class="components">
			<textarea name="html" placeholder="HTML code" id="html" onkeyup="refresh()"></textarea>
			<iframe id="viewer"></iframe>
		</div>
		<input type="submit" value="Add"/>
	</form>
	
</body>
</html>