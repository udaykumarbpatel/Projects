package udayjui.javaclasses;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Organization {

	private String username;
	private String org_name = "UNCC";
	private String org_state = "NC";
	DBClass d;

	public Organization() {
		d = new DBClass();
		d.connectMeIn();
	}

	public Organization(String username, String org_name, String org_state) {
		d = new DBClass();
		d.connectMeIn();
		this.username = username;
		setOrg_name(org_name);
		setOrg_state(org_state);
	}

	public Organization(String username) {
		d = new DBClass();
		d.connectMeIn();
		this.username = username;
		getorginfo();
	}

	public void getorginfo() {
		String SQL = "SELECT count(*) as cnt FROM ORGANIZATION WHERE USERNAME = '"
				+ username + "'";
		ResultSet rs = d.execute(SQL);
		try {
			while (rs.next()) {
				if (rs.getInt(1) == 1) {
					SQL = "SELECT * FROM ORGANIZATION WHERE USERNAME = '"
							+ username + "'";
					ResultSet rs1 = d.execute(SQL);
					try {
						while (rs1.next()) {
							this.org_name = rs1.getString("ORGNAME");
							this.org_state = rs1.getString("ORGSTATE");
						}
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void insert() {
		String SQL = "INSERT INTO Organization VALUES ('" + username + "', '"
				+ org_name + "', '" + org_state + "')";
		d.insert(SQL);
	}

	public void closeConnection() {
		d.closeConnection();
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getOrg_name() {
		return org_name;
	}

	public void setOrg_name(String org_name) {
		if (!isMissing(org_name)) {
			this.org_name = org_name;
		}
	}

	public String getOrg_state() {
		return org_state;
	}

	public void setOrg_state(String org_state) {
		if (!isMissing(org_state)) {
			this.org_state = org_state;
		}
	}
	
	private boolean isMissing(String value) {
	    return((value == null) || (value.trim().equals("")));
	  }

}
