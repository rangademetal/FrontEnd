<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>

<!DOCTYPE html>
<html>
<head>
<script>
var request;
function sendInfo()
{
var v=document.vinform.t1.value;
var url="ajax.jsp?val="+v;

if(window.XMLHttpRequest){
request=new XMLHttpRequest();
}
else if(window.ActiveXObject){
request=new ActiveXObject("Microsoft.XMLHTTP");
}

try
{
request.onreadystatechange=getInfo;
request.open("GET",url,true);
request.send();
}
catch(e)
{
alert("Unable to connect to server");
}
}

function getInfo(){
if(request.readyState==4){
var val=request.responseText;
document.getElementById('amit').innerHTML=val;
}
}

</script>
  <link rel="stylesheet" type="text/css" href="style.css">
  
<meta charset="utf-8">
<title>Admin CPanel</title>
</head>
	<body>
	<nav>
		<ul>
			<li style="float:right"><a href="/FrontEnd/logout" >Logout</a></li>
			<li><a href="/FrontEnd/profile">Profile</a>
		</ul>
		
	</nav>
	<div class="searchbar">
		<form name="vinform" class ="searchClass" method="get">
			<a href="addComponent.jsp">Add Component</a>
			<input type="text" name="t1" onkeyup="sendInfo()">
		</form>
	</div>
	<div class="container">
		<span id="amit"> </span>
	</div>
	
	</body>
</html>