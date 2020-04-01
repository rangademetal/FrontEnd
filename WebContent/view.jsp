<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>



<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="style.css">
	
	<title>View</title>

</head>

<body>
	<nav>
		<ul>
			<li style="float:right"><a href="/FrontEnd/logout" >Logout</a></li>
		</ul>
	</nav>
</body>

	<%	
			try{
				int id = Integer.parseInt(request.getParameter("id"));
				
				String urlDb = "jdbc:mysql://localhost:3306/FrontEnd";
				String usernameDb = "root";
				String passwordDb="Sad1996.";
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection(urlDb,usernameDb, passwordDb);
				String sql = "SELECT html_code, css_code, js_code from FrontEnd where id=?";
				PreparedStatement pst = con.prepareStatement(sql);
				
				pst.setInt(1,id);
				ResultSet rs = pst.executeQuery();
				
				if(rs.next()) {
					out.println(
							"<div class='full-container'>"+
								"<textarea>"+
									rs.getString("html_code")+
								"</textarea>"+
								"<textarea>"+
									rs.getString("css_code")+
								"</textarea>"+
								"<textarea>"+
									rs.getString("js_code")+
								"</textarea>"+
							"</div>");
					out.println(
							"<div class='full-container'>"+
								"<div class='view'>"+
										rs.getString("html_code")+
										"<style>"+
											rs.getString("css_code")+
										"</style>"+
								"</div>"+
							"</div>");
				}
			}
	
			catch (Exception e) {
				out.println(e.getMessage());
			}
		%>
		</body>
</html>
