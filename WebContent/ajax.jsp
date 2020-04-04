<%@ page import="java.sql.*"%>
<table class="roundedTable">
			<tr>
				<th>Title</th>
				<th>Description</th>
				<th>Autor</th>
				<th>Date</th>
				<th>Code</th>
			</tr>
			<%	
			String search = (String)request.getParameter("val");
			
			try{
				String urlDb = "jdbc:mysql://localhost:3306/FrontEnd";
				String usernameDb = "root";
				String passwordDb="Sad1996.";
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection(urlDb,usernameDb, passwordDb);

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