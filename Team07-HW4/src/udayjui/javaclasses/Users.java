package udayjui.javaclasses;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;

@SuppressWarnings("serial")
public class Users implements Serializable {

	private String username;
	private String password;
	private String email;
	private String dob;
	private String novisits;
	private String fname;
	private String lname;
	private String sex;
	private boolean logged_in;
	DBClass d;

	public Users() {
		logged_in = false;
		d = new DBClass();
		d.connectMeIn();
	}

	public Users(String username, String password, String email, String dob,
			String sex, String i, String fname, String lname) {
		logged_in = false;
		d = new DBClass();
		d.connectMeIn();
		this.username = username;
		this.password = password;
		this.email = email;
		this.dob = dob;
		this.sex = sex;
		this.fname = fname;
		this.lname = lname;
		this.novisits = i;
	}

	public Users(String username, String password) {
		logged_in = false;
		d = new DBClass();
		d.connectMeIn();
		this.username = username;
		this.password = password;
		this.logged_in = check();
	}

	public void insert() {
		String SQL = "INSERT INTO USERS VALUES ('" + username + "', '"
				+ password + "', '" + email + "', '" + dob + "', '" + sex
				+ "', '" + novisits + "', '" + fname + "', '" + lname + "')";
		d.insert(SQL);
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public void closeConnection() {
		d.closeConnection();
	}

	public void setNoofVisits(String usrName) {
		int visit = 0;
		String SQL1 = "SELECT USERS.NOVISITS FROM USERS WHERE USERS.USERNAME = "
				+ "'" + usrName + "'";
		ResultSet rs = d.execute(SQL1);
		try {
			rs.next();
			visit = Integer.parseInt(rs.getString(1));
			visit = visit + 1;
			String SQL2 = "UPDATE USERS SET USERS.NOVISITS=" + visit
					+ " WHERE USERS.USERNAME= '" + usrName + "'";
			d.update(SQL2);
		} catch (SQLException e) {
			System.out.println("set novisits      " + e);
		}
	}

	public boolean check() {
		String SQL = "SELECT count(*) as cnt FROM USERS WHERE USERNAME = '"
				+ username + "' AND PASSWORD='" + password + "'";
		ResultSet rs = d.execute(SQL);
		try {
			while (rs.next()) {
				if (rs.getInt(1) == 1) {
					logged_in = true;
					setNoofVisits(username);
					SQL = "SELECT * FROM USERS WHERE USERNAME = '" + username
							+ "' AND PASSWORD='" + password + "'";
					ResultSet rs1 = d.execute(SQL);
					try {
						while (rs1.next()) {
							this.email = rs1.getString("EMAIL");
							this.dob = rs1.getString("DOB");
							this.fname = rs1.getString("FIRSTNAME");
							this.novisits = rs1.getString("NOVISITS");
							this.sex = rs1.getString("SEX");
							this.lname = rs1.getString("LASTNAME");
						}
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return logged_in;
	}

	public boolean checkUsername() {
		boolean exists = false;
		String SQL = "SELECT count(*) as cnt FROM users WHERE USERNAME = '"
				+ username + "'";
		ResultSet rs = d.execute(SQL);
		try {
			while (rs.next()) {
				if (rs.getInt(1) == 1) {
					exists = true;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return exists;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUsername() {
		return username;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPassword() {
		return password;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEmail() {
		return email;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getDob() {
		return dob;
	}

	public boolean getLoggedIn() {
		return logged_in;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getNovisits() {
		return novisits;
	}

	public void setNovisits(String novisits) {
		this.novisits = novisits;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}
}