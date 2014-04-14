package udayjui.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import udayjui.javaclasses.User;

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

		User obj = new User();

		if (obj.userExist_reg(name, pass)) {
			// response.setContentType("text/html");
			// PrintWriter out = response.getWriter();
			// out.println("<html> \n" + "<body> \n" +
			// "<p>Post: Registration!!!</p> \n"
			// + "User Exists" + "</body> \n" + "</html>");
			JOptionPane.showMessageDialog(null,
					"Username already exist!!!!!", "Username error",
					JOptionPane.ERROR_MESSAGE);
			response.sendRedirect("register.jsp");

		} else {
			obj.addUser(name, pass);
			response.sendRedirect("login.jsp");
		}
	}

}
