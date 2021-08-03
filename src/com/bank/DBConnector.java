package com.bank;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnector {
	
	final static  String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
	public static String DB_URL="jdbc:mysql://localhost/bankdb";
	public static String USER="root";
	public static String PASS="root";
	public static String cuser;
	public static String accholder;
	public static String accno;
	public static String transpin;
	public static String email;
	public static String mno;
	public static String brname;
	//@suppressWarnings("deprecation")
	
	public static Connection getConnection() {
		Connection connection=null;
		
		try {
			
			Class.forName(JDBC_DRIVER);
			System.out.println("Connecting to a selected database...");
			connection=DriverManager.getConnection(DB_URL,USER,PASS);
			System.out.println("Connected database successfully...");
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return connection;
	}

}
