package server;

import java.io.IOException;
import java.io.PrintWriter;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;


import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/add")
public class AddFrontEndServlet extends HttpServlet{ 
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest req, HttpServletResponse res ) throws IOException {
		HttpSession session = req.getSession();
		PrintWriter out = res.getWriter();
		
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		System.out.println(dateFormat.format(date));
		
		int id = (int)session.getAttribute("id");
		
		try {
			String urlDb = "jdbc:mysql://localhost:3306/FrontEnd";
			String usernameDb = "root";
			String passwordDb="Sad1996.";
			String sql = "INSERT INTO FrontEnd (title, description, html_code, css_code, js_code, date_create, id_account)\n" + 
					"values (?,?,?,?,?,?,?)";
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(urlDb,usernameDb, passwordDb);
	
			PreparedStatement pst =  con.prepareStatement(sql);
			pst.setString(1, req.getParameter("title"));
			pst.setString(2, req.getParameter("description"));
			pst.setString(3, req.getParameter("html"));
			pst.setString(4, req.getParameter("css"));
			pst.setString(5, req.getParameter("js"));
			pst.setString(6, dateFormat.format(date));
			pst.setInt(7, id);
			
			pst.executeUpdate();
			
			pst.close();
			con.close();						

			res.sendRedirect("admin.jsp");
		}
		catch(Exception e) {
			out.println(e.getMessage());
		}
		
	}
}
