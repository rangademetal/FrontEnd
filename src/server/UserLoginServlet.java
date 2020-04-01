package server;

import java.io.IOException;
import java.io.PrintWriter;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/admin")
public class UserLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public UserLoginServlet() {
        super();
    }
	
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException,IOException {
		User user = new User();
		PrintWriter out = res.getWriter();
		
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		String urlDb = "jdbc:mysql://localhost:3306/FrontEnd";
		String usernameDb = "root";
		String passwordDb="Sad1996.";
		
		try {
			String sql = "SELECT * FROM account WHERE email=? AND password=?";
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(urlDb,usernameDb,passwordDb);
			PreparedStatement pst = con.prepareStatement(sql);
			
			pst.setString(1, email);
			pst.setString(2, password);
		
			ResultSet rs = pst.executeQuery();
			
			if(rs.next()) {
				out.println("Wok");
				user.setEmail(rs.getString("email"));
				user.setName(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setId(rs.getInt("id"));
				
				HttpSession session = req.getSession();
				session.setAttribute("username", user.getName());
				session.setAttribute("email", user.getEmail());
				session.setAttribute("id", user.getId());
				session.setAttribute("password", user.getPassword());
				
				RequestDispatcher rd = req.getServletContext().getRequestDispatcher("/admin.jsp");
				rd.forward(req, res);
			}
		}
		catch(Exception e) {
			out.println(e.getMessage());
		}
	}	
}