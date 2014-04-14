package udayjui.servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import udayjui.javaclasses.Bookings;
import udayjui.javaclasses.Clients;

/**
 * Servlet implementation class BookingHistory
 */
public class BookingHistory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookingHistory() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Bookings> bflights = new ArrayList<Bookings>();
		HttpSession session = request.getSession(true);
		
		Clients name = (Clients) session.getAttribute("Clients");
		Bookings obj = new Bookings();
		bflights = obj.selectBookings(name.getUser().getUsername());
		session.setAttribute("Bookedflights", bflights);
		obj.closeConnection();
		String encodedURL = response.encodeRedirectURL("bookinghistory.jsp");
		response.sendRedirect(encodedURL);
		
		//response.encodeRedirectURL("bookinghistory.jsp");
//		response.sendRedirect("bookinghistory.jsp");
	}

}
