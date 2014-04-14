package udayjui.javaclasses;

public class Cart {
	@Override
	public String toString() {
		return "Cart [flight=" + flight + ", seats=" + seats + ", total_amt="
				+ total_amt + ", bookid=" + bookid + "]";
	}
	Flights flight;
	int seats;
	int total_amt;
	int bookid;
	
	public int getBookid() {
		return bookid;
	}
	public void setBookid(int bookid) {
		this.bookid = bookid;
	}
	public Flights getFlight() {
		return flight;
	}
	public void setFlight(Flights flight) {
		this.flight = flight;
	}
	public int getSeats() {
		return seats;
	}
	public void setSeats(int seats) {
		this.seats = seats;
	}
	public int getTotal_amt() {
		return total_amt;
	}
	public void setTotal_amt(int total_amt) {
		this.total_amt = total_amt;
	}
	
	
	
}
