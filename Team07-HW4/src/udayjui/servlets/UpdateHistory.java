package udayjui.servlets;

import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import udayjui.javaclasses.Bookings;
import udayjui.javaclasses.Cart;
import udayjui.javaclasses.Clients;
import udayjui.javaclasses.Flights;

/**
 * Servlet implementation class UpdateHistory
 */
public class UpdateHistory extends HttpServlet implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateHistory() {
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
		HttpSession session = request.getSession(true);
		Flights flight = (Flights) session.getAttribute("selectflight");
		int accountno = Integer.parseInt(request.getParameter("ano"));
		@SuppressWarnings("unchecked")
		ArrayList<Cart> cart = (ArrayList<Cart>) session.getAttribute("cart");

		if (cart == null) {
			cart = new ArrayList<Cart>();
			session.setAttribute("cart", cart);
		}
		for (int i = 0; i < cart.size(); i++) {
			flight.updateSeats(cart.get(i).getFlight().getFlightnumber(), cart
					.get(i).getFlight().getOperator(), cart.get(i).getSeats(),
					cart.get(i).getFlight().getDot());
			Clients client = (Clients) session.getAttribute("Clients");
			Bookings b = new Bookings(client.getUser().getUsername(), cart.get(i).getFlight()
					.getOperator()
					+ "" + cart.get(i).getFlight().getFlightnumber(), cart
					.get(i).getFlight().getDot(), cart.get(i).getSeats(),
					accountno, cart.get(i).getTotal_amt());
			b.insert();
			cart.get(i).setBookid(
					b.bookid(client.getUser().getUsername(), cart.get(i).getFlight()
							.getOperator()
							+ "" + cart.get(i).getFlight().getFlightnumber(),
							cart.get(i).getFlight().getDot(), cart.get(i)
									.getSeats(), accountno, cart.get(i)
									.getTotal_amt()));
		}

		session.setAttribute("flightdetails", flight);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		// Have to get the account number while this function is called.

	}
}
