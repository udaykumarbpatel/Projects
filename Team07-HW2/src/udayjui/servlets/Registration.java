package udayjui.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import udayjui.javaclasses.Users;

/**
 * Servlet implementation class Registration
 */
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Registration() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("username");
		String pass = request.getParameter("pword");
		String dob = request.getParameter("dob");
		String sex = request.getParameter("sex");
		String email = request.getParameter("email");
		String fname = request.getParameter("fname");
		name = name.toLowerCase();
		String visit = "0";
		Users usr = new Users(name, pass, email, dob, sex, visit, fname);

		if (!usr.checkUsername()) {
			usr.insert();
			usr.closeConnection();
			response.sendRedirect("login.jsp");
		} else {
			JOptionPane.showMessageDialog(null, "Username already exist!!!!!",
					"Username error", JOptionPane.ERROR_MESSAGE);
			usr.closeConnection();
			response.sendRedirect("register.jsp");
		}
	}
}
