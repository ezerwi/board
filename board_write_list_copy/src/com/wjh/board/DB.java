package com.wjh.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DB {

	static Connection conn = null;

	public static void mySQLCon() {

		String driver_name = "com.mysql.jdbc.Driver";
		String db_url = "jdbc:mysql://localhost:3306/board_db";
		String db_id = "root";
		String db_pw = "1234";
		try {
			Class.forName(driver_name);
			System.out.println("Success_Driver Connection");
			conn = DriverManager.getConnection(db_url, db_id, db_pw);
			System.out.println("Success_DB_Connection");
		} catch (ClassNotFoundException e) {
			System.out.println("ERR_Can't Load Drvier__" + e.getMessage());
		} catch (SQLException e) {
			System.out.println("ERR_Can't Connect DB__" + e.getMessage());
		}

	}

	public static String datatInsert(String w, String t, String c) {
		mySQLCon();
		String status = null;
		String queryInsert = "insert into board_table (writer, title, contents) values (?,?,?)";
		PreparedStatement pstmt = null;

		try {
			pstmt = conn.prepareStatement(queryInsert);
			pstmt.setString(1, ChangeEncode.toLatin(w));
			pstmt.setString(2, ChangeEncode.toLatin(t));
			pstmt.setString(3, ChangeEncode.toLatin(c));
			int n = pstmt.executeUpdate();

			status = (n > 0) ? "SUCCESS" : "FAIL";

		} catch (SQLException e) {
			System.out.println("Can't insert data into mySQL_ERR : " + e.getMessage());
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				System.out.println("Closing ERR_" + e.getMessage());
			}
		}
		return status;
	}
	
	
	public static ResultSet showRS(){
		mySQLCon();
		ResultSet rs = null;
		try {
			rs = conn.createStatement().executeQuery("select * from board_table order by idx desc");
			return rs;
		} catch (SQLException e) {
			System.out.println("showRS method ERR_" + e.getMessage());
			return null;
		}
	}
	
	public static String hitUp(String s){
		String status = null;
		mySQLCon();
		
		Statement stmt = null;
		try {
			stmt = conn.createStatement();
			int n = stmt.executeUpdate("update board_table set hit = hit+1 where idx = "+s);
			status = (n>0) ? "SUCCESS" : "FAIL";
			return status;
		} catch (SQLException e) {
			System.out.println("hitUp method ERR_"+e.getMessage());
		} finally {
			try {
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				System.out.println("hitUp method finally ERR_"+e.getMessage());
			}
			
		}
		
		
		return status;
	}
	
	public static ResultSet oneRS(String num){
		mySQLCon();
		ResultSet rs=null;
		try {
			rs = conn.createStatement().executeQuery("select * from board_table where idx = "+num);
			return rs;
		} catch (SQLException e) {
			System.out.println("oneRS method ERR_" + e.getMessage());
			return null;
		}
	}

	// update board_table set title =title, contents =contents where idx = num
	public static boolean modRS(String num, String title, String contents){
		mySQLCon();
		boolean status = false;
		Statement stmt = null; 
		try {
			stmt = conn.createStatement();
			int n = stmt.executeUpdate("update board_table set title = "+title+", contents = "+contents+" where idx = "+num);
			
			status = (n >0) ? true : false; 
			
		} catch (SQLException e) {
			System.out.println("modRS method ERR_" + e.getMessage());
		} finally{
			try {
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				System.out.println("modRS method finally ERR_"+e.getMessage());
			}
		}	
		
		return status;
		
	}	// modRS
	
	public static boolean linkMod(String num){
		mySQLCon();
		boolean status = false;
		ResultSet rs = null;
		try {
			rs = conn.createStatement().executeQuery("select * from where idx = "+num);
			status =(rs.getString("idx").equals(num)) ? true : false;
		} catch (SQLException e) {
			System.out.println("linkMod method ERR_" + e.getMessage());
		} finally{
			try {
				conn.close();
			} catch (SQLException e) {
				System.out.println("modRS method finally ERR_" + e.getMessage());			}
		}
		return status;
		
	}	//linkMod

}


