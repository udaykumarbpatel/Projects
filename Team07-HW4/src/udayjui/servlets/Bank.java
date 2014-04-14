package udayjui.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serializable;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import udayjui.javaclasses.Accounts;
import udayjui.javaclasses.Cart;

/**
 * Servlet implementation class Bank
 */
public class Bank extends HttpServlet implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Bank() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		int accountno = Integer.parseInt(request.getParameter("ano"));
		int routingno = Integer.parseInt(request.getParameter("rno"));
		name = name.toLowerCase();
		Accounts accnt = new Accounts(accountno, name, routingno);
		HttpSession session = request.getSession(true);
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
		response.setContentType("text/plain;charset=UTF-8");
		PrintWriter out = response.getWriter();

		if (accnt.isAccountExist()) {
			if ((accnt.getBalance() - total_cost) >= 0) {
				for (int i = 0; i < cart.size(); i++) {
					new Accounts().updateBalance(accountno, name, routingno,
							cart.get(i).getTotal_amt());
				}
				out.println(true);
			} else {
				JOptionPane.showMessageDialog(null,
						"Please put some money in your account!!!!",
						"Transaction error", JOptionPane.ERROR_MESSAGE);
			}
		} else {
			JOptionPane.showMessageDialog(null, "Account Doesnot Exist!!!! ",
					"Transaction error", JOptionPane.ERROR_MESSAGE);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

	}

}
