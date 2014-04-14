package udayjui.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import udayjui.javaclasses.Flights;

/**
 * Servlet implementation class SearchResults
 */
public class SearchResults extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SearchResults() {
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

		String value = request.getParameter("selectedflight");
		Flights obj = new Flights();
		Flights flight = obj.selectFlight(
				value.charAt(0) + "" + value.charAt(1), value.charAt(2) + ""
						+ value.charAt(3) + "" + value.charAt(4) + "");
		HttpSession session = request.getSession(true);
		session.setAttribute("selectflight", flight);
		obj.closeConnection();
		request.getRequestDispatcher("viewandbook.jsp").forward(request,
				response);
	}
}
