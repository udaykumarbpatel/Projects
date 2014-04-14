package udayjui.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import udayjui.javaclasses.Users;

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

		boolean setcookie = false;
		String name = request.getParameter("username");
		String pass = request.getParameter("password");
		String remember = request.getParameter("remember");
		if (remember != null) {
			Cookie cookie = null;
			Cookie[] cookies = null;
			cookies = request.getCookies();
			if (cookies != null) {
				for (int i = 0; i < cookies.length; i++) {
					cookie = cookies[i];
					if (cookie.getName() == "example") {
						cookie.setValue(name);
						setcookie = true;
					}
				}
			}

			if (!setcookie) {
				cookie = new Cookie("example", name);
				response.addCookie(cookie);
			}
		}

		Users u = new Users(name, pass);
		if (u.getLoggedIn()) {
			u.closeConnection();
			HttpSession session = request.getSession(true);
			String str = (String) request.getAttribute("loggedin");
			if (str == null) {
				session.setAttribute("loggedin", u.getUsername());
				session.setAttribute("nametodisplay", u);
			}
			request.getRequestDispatcher("flightsearch.jsp").forward(request,
					response);
		} else {
			u.closeConnection();
			JOptionPane.showMessageDialog(null, "Password doesnot match",
					"Username error", JOptionPane.ERROR_MESSAGE);
			response.sendRedirect("login.jsp");
		}
	}
}
