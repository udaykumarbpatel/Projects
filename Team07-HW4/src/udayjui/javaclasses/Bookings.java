package udayjui.javaclasses;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

@SuppressWarnings("serial")
public class Bookings implements Serializable {

	private int bookingid;
	private String username;
	private String flightid;
	private String dot;
	private int seats;
	private int accountid;
	private int totalcost;

	ArrayList<Bookings> bflights = new ArrayList<Bookings>();
	DBClass d;

	public int getBookingid() {
		return bookingid;
	}

	public Bookings() {
		d = new DBClass();
		d.connectMeIn();
	}

	public Bookings(String username, String flightid, String dot, int seats,
			int accountid, int totalcost) {
		d = new DBClass();
		d.connectMeIn();
		this.username = username;
		this.flightid = flightid;
		this.dot = dot;
		this.seats = seats;
		this.accountid = accountid;
		this.totalcost = totalcost;
	}

	public void closeConnection() {
		d.closeConnection();
	}

	public void insert() {
		String SQL = "INSERT INTO BOOKINGS VALUES (SEQ.nextval , '" + username
				+ "', '" + flightid + "', '" + dot + "', '" + seats + "', '"
				+ accountid + "', '" + totalcost + "')";
		d.insert(SQL);
	}

	public int bookid(String username, String flightid, String dot, int seats, int accountid, int totalcost) {
		String SQL = "SELECT BOOKINGID FROM BOOKINGS WHERE USERNAME = '"
				+ username + "'AND FLIGHTID = '" + flightid + "'AND \"DATE1\" = '" + dot
				+ "'AND NUMBEROFSEATS = '" + seats
				+ "'AND ACCOUNTID = '" + accountid + "'AND TOTALCOST = '"+ totalcost + "'";
		ResultSet rs = d.execute(SQL);
		int id = 0;
		try {
			rs.next();
			id = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return id;
	}

	public ArrayList<Bookings> selectBookings(String uname) {
		String SQL = "SELECT COUNT(*) as cnt FROM BOOKINGS WHERE BOOKINGS.USERNAME = "
				+ "'" + uname + "'";
		ResultSet rs = d.execute(SQL);
		try {
			while (rs.next()) {
				if (rs.getInt(1) > 0) {
					SQL = "SELECT * FROM BOOKINGS WHERE BOOKINGS.USERNAME = "
							+ "'" + uname + "' ORDER BY BOOKINGS.BOOKINGID ASC";
					ResultSet rs1 = d.execute(SQL);
					try {
						while (rs1.next()) {
							Bookings b = new Bookings();
							b.setBookingid(rs1.getInt(1));
							b.setUsername(rs1.getString(2));
							b.setFlightid(rs1.getString(3));
							b.setDot(rs1.getString(4));
							b.setSeats(rs1.getInt(5));
							b.setAccountid(rs1.getInt(6));
							b.setTotalcost(rs1.getInt(7));
							bflights.add(b);
						}
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return bflights;
	}

	public void setBookingid(int bookingid) {
		this.bookingid = bookingid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getFlightid() {
		return flightid;
	}

	public void setFlightid(String flightid) {
		this.flightid = flightid;
	}

	public String getDot() {
		return dot;
	}

	public void setDot(String dot) {
		this.dot = dot;
	}

	public int getSeats() {
		return seats;
	}

	public void setSeats(int seats) {
		this.seats = seats;
	}

	public int getAccountid() {
		return accountid;
	}

	public void setAccountid(int accountid) {
		this.accountid = accountid;
	}

	public int getTotalcost() {
		return totalcost;
	}

	public void setTotalcost(int totalcost) {
		this.totalcost = totalcost;
	}
}
