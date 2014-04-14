package udayjui.javaclasses;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;

@SuppressWarnings("serial")
public class Accounts implements Serializable {

	private int accountId;
	private String holderName;
	private int routingNo;
	private int balance;
	DBClass d;
	private boolean accountExist = false;

	public Accounts() {
		d = new DBClass();
		d.connectMeIn();
	}

	public Accounts(int accountId, String holderName, int routingNo) {
		d = new DBClass();
		d.connectMeIn();
		this.accountId = accountId;
		this.holderName = holderName;
		this.routingNo = routingNo;
		retriveBalance();
	}

	public void closeConnection() {
		d.closeConnection();
	}

	private void retriveBalance() {
		String SQL = "SELECT count(*) as cnt FROM ACCOUNTS WHERE ACCOUNTID = '"
				+ accountId + "' AND HOLDERNAME='" + holderName
				+ "' AND ROUTINGNUMBER='" + routingNo + "'";
		ResultSet rs = d.execute(SQL);
		try {
			while (rs.next()) {
				if (rs.getInt(1) == 1) {
					accountExist = true;
					SQL = "SELECT BALANCE FROM ACCOUNTS WHERE ACCOUNTID = '"
							+ accountId + "' AND HOLDERNAME='" + holderName
							+ "' AND ROUTINGNUMBER='" + routingNo + "'";
					ResultSet rs1 = d.execute(SQL);
					try {
						while (rs1.next()) {
							this.balance = rs1.getInt("BALANCE");
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
	
	public void updateBalance(int ano, String name, int rno, int bal) {
		String SQL = "SELECT BALANCE FROM ACCOUNTS WHERE ACCOUNTID = '"
				+ ano + "' AND HOLDERNAME='" + name
				+ "' AND ROUTINGNUMBER='" + rno + "'";
		
		try {
			ResultSet rs = d.execute(SQL);
			while (rs.next()) {
				int balance_db = Integer.parseInt(rs.getString(1));
				balance_db = balance_db - bal;
				String SQL2 = "UPDATE ACCOUNTS SET ACCOUNTS.BALANCE=" + balance_db
						+ " WHERE ACCOUNTID = '"
				+ ano + "' AND HOLDERNAME='" + name
				+ "' AND ROUTINGNUMBER='" + rno + "'";
				d.update(SQL2);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	public boolean isAccountExist() {
		return accountExist;
	}

	public void setAccountExist(boolean accountExist) {
		this.accountExist = accountExist;
	}

	public int getAccountId() {
		return accountId;
	}

	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}

	public String getHolderName() {
		return holderName;
	}

	public void setHolderName(String holderName) {
		this.holderName = holderName;
	}

	public int getRoutingNo() {
		return routingNo;
	}

	public void setRoutingNo(int routingNo) {
		this.routingNo = routingNo;
	}

	public int getBalance() {
		return balance;
	}

	public void setBalance(int balance) {
		this.balance = balance;
	}

}
