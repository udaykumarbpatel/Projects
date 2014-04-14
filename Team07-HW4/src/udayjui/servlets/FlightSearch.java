package udayjui.servlets;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import udayjui.javaclasses.Flights;

/**
 * Servlet implementation class FlightSearch
 */
public class FlightSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FlightSearch() {
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
		ArrayList<Flights> flights = new ArrayList<Flights>();
		String from = request.getParameter("leave");
		String to = request.getParameter("going");
		String fdate = request.getParameter("date");
		from = from.toUpperCase();
		to = to.toUpperCase();		
		Flights obj = new Flights();
		flights = obj.selectAllFlights(from, to, fdate);
		HttpSession session = request.getSession(true);
		session.setAttribute("flightResult", flights);
		obj.closeConnection();
		String encodedURL = response.encodeRedirectURL("searchresults.jsp");
		response.sendRedirect(encodedURL);
	//	response.encodeRedirectURL("searchresults.jsp");
	}

}
