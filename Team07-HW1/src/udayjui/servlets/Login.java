package udayjui.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import udayjui.javaclasses.User;

/**
 * Servlet implementation class Login
 */
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login() {
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
		// TODO Auto-generated method stub

		String name = request.getParameter("username");
		String pass = request.getParameter("password");

		User obj = new User();

		if (obj.userExist_login(name, pass)) {
			request.setAttribute("name", name);
			request.getRequestDispatcher("flightsearch.jsp").forward(request,
					response);
		} else {
			JOptionPane.showMessageDialog(null,
					"Username doesnot exist", "Username error",
					JOptionPane.ERROR_MESSAGE);
			response.sendRedirect("register.jsp");
		}

	}

}
