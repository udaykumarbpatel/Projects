package udayjui.servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import udayjui.javaclasses.Cart;
import udayjui.javaclasses.Flights;

/**
 * Servlet implementation class ViewandBook
 */
public class ViewandBook extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ViewandBook() {
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

		HttpSession session = request.getSession(true);
		Flights flight = (Flights) session.getAttribute("selectflight");

		int seats = Integer.parseInt(request.getParameter("adult"));
		Flights obj = new Flights();
		Flights latest_data = obj.getAvailableSeats(flight.getFlightnumber(),
				flight.getOperator(),flight.getDot());
		obj.closeConnection();
		int total_cost = 0;
		if ((latest_data.getTotal() - latest_data.getTaken()) >= seats) {
			session.setAttribute("error", "Seats Available");
			@SuppressWarnings("unchecked")
			ArrayList<Cart> cart = (ArrayList<Cart>) session
					.getAttribute("cart");
			if (cart == null) {
				cart = new ArrayList<Cart>();
				session.setAttribute("cart", cart);
			}
			Cart c = new Cart();
			c.setFlight(flight);
			c.setSeats(seats);
			total_cost = seats * latest_data.getCost();
			c.setTotal_amt(total_cost);
			cart.add(c);
			String encodedURL = response.encodeRedirectURL("transaction.jsp");
			response.sendRedirect(encodedURL);
			//response.encodeRedirectURL("transaction.jsp");
		}
		else
		{
			session.setAttribute("error", "No Seats");
			String encodedURL = response.encodeRedirectURL("transaction.jsp");
			response.sendRedirect(encodedURL);
			//response.encodeRedirectURL("transaction.jsp");
		}

	}

}
