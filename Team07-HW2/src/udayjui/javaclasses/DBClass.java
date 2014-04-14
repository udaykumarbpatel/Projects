package udayjui.javaclasses;

import java.io.Serializable;
import java.sql.*;

@SuppressWarnings("serial")
public class DBClass implements Serializable {
	Connection connection;
	Statement stat;
	
	

	public void connectMeIn() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

		} catch (ClassNotFoundException e) {
			System.err.println(e);
			System.exit(-1);
		}
		try {
			connection = DriverManager.getConnection(
					"jdbc:oracle:thin:@cci-ora02.uncc.edu:1521:class",
					"ubhupend", "qwe123");
			stat = connection.createStatement();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public ResultSet execute(String SQL) {
		ResultSet rs;
		try {
			rs = stat.executeQuery(SQL);
			return rs;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	public void insert(String SQL) {
		Statement stat;
		try {
			stat = connection.createStatement();
			stat.executeQuery(SQL);
			stat.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	

	public void update(String SQL) {
		Statement stat;
		try {
			stat = connection.createStatement();
			stat.executeUpdate(SQL);
			stat.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	

	

	public void closeConnection() {
		try {
			stat.close();
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	
}
