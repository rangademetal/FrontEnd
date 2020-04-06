package server;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet("/logout")
public class UserLogoutServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {

		HttpSession session = req.getSession();
				
		session.invalidate();

		RequestDispatcher rd = req.getRequestDispatcher("/index.jsp");
		rd.forward(req, res);
	}
	
	

}
