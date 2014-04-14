package udayjui.javaclasses;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

@SuppressWarnings("serial")
public class Flights implements Serializable {

	private String flightnumber;
	private String operator;
	private String source;
	private String destination;
	private int total;
	private int taken;
	private int cost;
	private int stops;
	private String departure;
	private String arrival;
	private String dot;
	DBClass d;
	ArrayList<Flights> flights = new ArrayList<Flights>();

	@Override
	public String toString() {
		return flightnumber + "," + operator + "," + source + "," + destination
				+ "," + total + "," + taken + "," + cost + "," + departure
				+ "," + arrival + "," + dot;
	}

	public Flights() {
		d = new DBClass();
		d.connectMeIn();
	}

	public void closeConnection() {
		d.closeConnection();
	}

	public ArrayList<Flights> selectAllFlights(String leaving, String going,
			String date) {
		String SQL = "SELECT * FROM FLIGHTS WHERE FLIGHTS.SOURCE = " + "'"
				+ leaving + "'" + " AND FLIGHTS.DESTINATION = '" + going
				+ "' AND FLIGHTS.DATEOFTRAVEL ='" + date + "'";

		try {
			ResultSet rs = d.execute(SQL);
			while (rs.next()) {
				Flights flight = new Flights();
				flight.setFlightnumber(rs.getString(1));
				flight.setOperator(rs.getString(2));
				flight.setSource(rs.getString(3));
				flight.setDestination(rs.getString(4));
				flight.setTotal(rs.getInt(5));
				flight.setTaken(rs.getInt(6));
				flight.setCost(rs.getInt(7));
				flight.setDeparture(rs.getString(8));
				flight.setArrival(rs.getString(9));
				flight.setDot(rs.getString(10));
				flight.setStops(rs.getInt(11));
				flights.add(flight);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flights;
	}

	public int getStops() {
		return stops;
	}

	public void setStops(int stops) {
		this.stops = stops;
	}

	public Flights selectFlight(String operator, String number) {
		String SQL = "SELECT * FROM FLIGHTS WHERE FLIGHTS.OPERATOR = " + "'"
				+ operator + "'" + " AND FLIGHTS.FLIGHTNUMBER = '" + number
				+ "'";
		Flights flight = new Flights();
		try {
			ResultSet rs = d.execute(SQL);
			while (rs.next()) {
				flight.setFlightnumber(rs.getString(1));
				flight.setOperator(rs.getString(2));
				flight.setSource(rs.getString(3));
				flight.setDestination(rs.getString(4));
				flight.setTotal(rs.getInt(5));
				flight.setTaken(rs.getInt(6));
				flight.setCost(rs.getInt(7));
				flight.setDeparture(rs.getString(8));
				flight.setArrival(rs.getString(9));
				flight.setDot(rs.getString(10));
				flight.setStops(rs.getInt(11));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flight;
	}

	public Flights getAvailableSeats(String flightnumber, String operator) {
		String SQL = "SELECT * FROM FLIGHTS WHERE FLIGHTS.OPERATOR = " + "'"
				+ operator + "'" + " AND FLIGHTS.FLIGHTNUMBER = '"
				+ flightnumber + "'";
		Flights flight = new Flights();
		try {
			ResultSet rs = d.execute(SQL);
			while (rs.next()) {
				flight.setFlightnumber(rs.getString(1));
				flight.setOperator(rs.getString(2));
				flight.setSource(rs.getString(3));
				flight.setDestination(rs.getString(4));
				flight.setTotal(rs.getInt(5));
				flight.setTaken(rs.getInt(6));
				flight.setCost(rs.getInt(7));
				flight.setDeparture(rs.getString(8));
				flight.setArrival(rs.getString(9));
				flight.setDot(rs.getString(10));
				flight.setStops(rs.getInt(11));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flight;
	}

	public void updateSeats(String flightnumber, String operator, int seats) {
		String SQL = "SELECT SEATS_TAKEN FROM FLIGHTS WHERE FLIGHTS.OPERATOR = " + "'"
				+ operator + "'" + " AND FLIGHTS.FLIGHTNUMBER = '"
				+ flightnumber + "'";
		
		try {
			ResultSet rs = d.execute(SQL);
			while (rs.next()) {
				int seats_db = Integer.parseInt(rs.getString(1));
				seats_db = seats_db + seats;
				String SQL2 = "UPDATE FLIGHTS SET FLIGHTS.SEATS_TAKEN=" + seats_db
						+ " WHERE FLIGHTS.OPERATOR = " + "'"
				+ operator + "'" + " AND FLIGHTS.FLIGHTNUMBER = '"
				+ flightnumber + "'";
				d.update(SQL2);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	
	
	public String getFlightnumber() {
		return flightnumber;
	}

	public void setFlightnumber(String flightnumber) {
		this.flightnumber = flightnumber;
	}

	public String getOperator() {
		return operator;
	}

	public void setOperator(String operator) {
		this.operator = operator;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getTaken() {
		return taken;
	}

	public void setTaken(int taken) {
		this.taken = taken;
	}

	public int getCost() {
		return cost;
	}

	public void setCost(int cost) {
		this.cost = cost;
	}

	public String getDeparture() {
		return departure;
	}

	public void setDeparture(String departure) {
		this.departure = departure;
	}

	public String getArrival() {
		return arrival;
	}

	public void setArrival(String arrival) {
		this.arrival = arrival;
	}

	public String getDot() {
		return dot;
	}

	public void setDot(String dot) {
		this.dot = dot;
	}
}
