package com.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConn {

	private static Connection conn = null;

	public static Connection getConnection() {

		String url = "jdbc:mariadb://localhost:3306/gyrms93";
		String user = "gyrms93";
		String pwd = "chfha213!@!";
		
//jdbc:mariadb://umj7-003.cafe24.com:3306/gyrms93
//jdbc:mariadb://localhost:3306/gyrms93
		
		if (conn == null) {
			try {

				Class.forName("org.mariadb.jdbc.Driver");
				conn = DriverManager.getConnection(url, user, pwd);
			} catch (Exception e) {
				System.out.println(e.toString());
			}
		}
		return conn;
	}

	public static void close() {
		if(conn == null) {
			return;
		}
		
		try {
			if(!conn.isClosed()) {
				conn.close();
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		conn = null;
	}
	
	
	
	
}
