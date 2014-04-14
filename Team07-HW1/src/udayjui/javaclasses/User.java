package udayjui.javaclasses;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import java.util.Properties;

public class User {
	Properties p;
	FileInputStream fis = null;

	public User() {

		p = new Properties();

		try {
			fis = new FileInputStream("C://Uday Patel//users.properties");
			p.load(fis);
		} catch (FileNotFoundException e) {
			System.out.println("FileNotFound");
		} catch (IOException e) {
			System.out.println("IOEXCeption");
		} finally {
			if (null != fis) {
				try {
					fis.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}

	}

	public boolean userExist_login(String user, String passp) {
		boolean exists = false;
		String pass = p.getProperty(user);
		System.out.println("Pass is :" + pass);

		try {
			if (pass.equals(passp)) {
				exists = true;
			}
		} catch (NullPointerException e) {
			System.out.print("Null");
		}

		return exists;
	}

	public boolean userExist_reg(String user, String passp) {
		boolean exists = false;
		if (p.containsKey(user)) {
			exists = true;
		}
		return exists;

	}

	public void addUser(String usr, String password) {

		p.setProperty(usr, password);
		try {
			p.store(new FileOutputStream("C://Uday Patel//users.properties"),
					null);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
