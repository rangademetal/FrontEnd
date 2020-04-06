<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@page import="java.sql.*" %>
    

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
	<%@ page import="server.User" %>
	<%
		User user = (User)session.getAttribute("user");

		int id = user.getId();
		String urlDb = "jdbc:mysql://localhost:3306/FrontEnd";
		String usernameDb = "root";
		String passwordDb="Sad1996.";
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			String sql = "SELECT COUNT(id) AS Count FROM FrontEnd where id_account=?";
			Connection con = DriverManager.getConnection(urlDb,usernameDb, passwordDb);
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setInt(1, id);
			
			ResultSet rs = pst.executeQuery();
			if(rs.next()) {
				out.println("You created "+rs.getInt("Count")+" components");
			}
			pst.close();
			con.close();
		
		}
		
		catch(Exception e) {
			
		}
	%>
</body>
</html>