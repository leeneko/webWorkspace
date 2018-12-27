package DAO;

import java.sql.*;

public class DBConnection {
	public Connection conn;
	public PreparedStatement pst;
	public ResultSet rs;
	
	public DBConnection() {
		conn = null;
		pst = null;
		rs = null;
	}
	
	public Connection getConnection() {
		try {
			String user = "leeneko";
			String password = "15746";
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, password);
			
//			System.out.println("DB에 연결되었습니다.");
		} catch(ClassNotFoundException cnfe) {
			System.out.println("DB 드라이버 로딩 실패 : " + cnfe.toString());
		} catch (SQLException sqle) {
			System.out.println("DB 접속 실패 : " + sqle.toString());
		} catch (Exception e) {
			System.out.println("Unknown error");
			e.printStackTrace();
		}
		return conn;
	}
	
	public void close() {
		try {
			if (pst != null) {
				pst.close();
			}
			if (conn != null) {
				conn.close();
			}
			if (rs != null) {
				rs.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
