<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>

<!DOCTYPE html>
<html>
<head>
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
		<form action="admin.jsp" class ="searchClass" method="get">
			<a href="addComponent.jsp">Add Component</a>
			<input type="text" name="searchbar" placeholder="Search" />
			<input type="submit" name="submitBtn" value="Search"/>
		</form>
	</div>
	<div class="container">
	
		<table class="roundedTable">
			<tr>
				<th>Title</th>
				<th>Description</th>
				<th>Autor</th>
				<th>Date</th>
				<th>Code</th>
			</tr>
			<%	
			String search = (String)request.getParameter("searchbar");
			
			try{
				String urlDb = "jdbc:mysql://localhost:3306/FrontEnd";
				String usernameDb = "root";
				String passwordDb="Sad1996.";
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection(urlDb,usernameDb, passwordDb);
				String sql = "Select * FROM FrontEnd WHERE description LIKE '"+search+"%'";
				String sql2= "SELECT  FD.id as id ,FD.title AS tit, FD.description, root.username, FD.date_create FROM account root LEFT JOIN FrontEnd FD ON root.ID = FD.id_account where FD.Description like '"+search+"%'";
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery(sql2);
				while(rs.next()) {
					out.println(
							"<tr>"+
								"<td>"+
									rs.getString("tit")+
								"</td>"+
								"<td>"+
									rs.getString("FD.description")+
								"</td>"+
								"<td>"+
									rs.getString("root.username")+
								"</td>"+
								"<td>"+
									rs.getString("FD.date_Create")+
								"</td>"+
								"<td><a href=view.jsp?id="+rs.getInt("id")+" target='_blank'>View</a></td>"+
							"</tr>");	
				}
			}
			catch (Exception e) {
				out.println(e.getMessage());
			}
		%>
		</table>
	</div>
	
	 <script>
function showCustomer(str)
{
var xmlhttp;   
if (str=="")
  {
  document.getElementById("txtHint").innerHTML="";
  return;
  }
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    document.getElementById("div1").innerHTML=xmlhttp.responseText;
    }
  }
xmlhttp.open("GET","retrieve.jsp?search="+str,true);
xmlhttp.send();
}
</script>
	</body>
</html>