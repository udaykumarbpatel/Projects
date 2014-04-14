package udayjui.servlets;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import udayjui.javaclasses.Accounts;
import udayjui.javaclasses.Bookings;
import udayjui.javaclasses.Cart;
import udayjui.javaclasses.Flights;
import udayjui.javaclasses.Users;

/**
 * Servlet implementation class Transaction
 */
public class Transaction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Transaction() {
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

		String name = request.getParameter("name");
		int accountno = Integer.parseInt(request.getParameter("accountno"));
		int routingno = Integer.parseInt(request.getParameter("routingno"));
		name = name.toLowerCase();
		Accounts accnt = new Accounts(accountno, name, routingno);
		HttpSession session = request.getSession(true);
		Flights flight = (Flights) session.getAttribute("selectflight");
		@SuppressWarnings("unchecked")
		ArrayList<Cart> cart = (ArrayList<Cart>) session.getAttribute("cart");
		if (cart == null) {
			cart = new ArrayList<Cart>();
			session.setAttribute("cart", cart);
		}
		int total_cost = 0;
		for (int i = 0; i < cart.size(); i++) {
			total_cost = total_cost + cart.get(i).getTotal_amt();
		}
		if (accnt.isAccountExist()) {
			if ((accnt.getBalance() - total_cost) >= 0) {

				for (int i = 0; i < cart.size(); i++) {
					flight.updateSeats(cart.get(i).getFlight()
							.getFlightnumber(), cart.get(i).getFlight()
							.getOperator(), cart.get(i).getSeats());
					new Accounts().updateBalance(accountno, name, routingno,
							cart.get(i).getTotal_amt());
					Users u = (Users) session.getAttribute("nametodisplay");
					Bookings b = new Bookings(u.getUsername(), cart.get(i)
							.getFlight().getOperator()
							+ "" + cart.get(i).getFlight().getFlightnumber(),
							cart.get(i).getFlight().getDot(), cart.get(i)
									.getSeats(), accountno, cart.get(i)
									.getTotal_amt());
					b.insert();
					cart.get(i).setBookid(b.bookid(u.getUsername(), cart.get(i)
							.getFlight().getOperator()
							+ "" + cart.get(i).getFlight().getFlightnumber(),
							cart.get(i).getFlight().getDot(), cart.get(i)
									.getSeats(), accountno, cart.get(i)
									.getTotal_amt()));
				}
				session.setAttribute("flightdetails", flight);
				response.sendRedirect("confirmtransaction.jsp");
			} else {
				session.setAttribute("isAccountExist", "t");
				response.sendRedirect("confirmtransaction.jsp");
			}
		} else {
			session.setAttribute("isAccountExist", "f");
			response.sendRedirect("confirmtransaction.jsp");
		}
	}
}
