package DAO;

import java.sql.*;

public class OracleTest {
	public static void main(String[] args) {
		DBConnection dbconn = new DBConnection();
		
		try {
			String sql = "SELECT * FROM MEMBER";
			
			dbconn.conn = dbconn.getConnection();
			dbconn.pst = dbconn.conn.prepareStatement(sql);
			dbconn.rs = dbconn.pst.executeQuery();
			
			while(dbconn.rs.next()) {
				System.out.println(dbconn.rs.getString("id") + "\t" + dbconn.rs.getString("pw"));
				System.out.println(dbconn.rs.getString("nick") + "\t" + dbconn.rs.getString("email"));
			}
		} catch (SQLException sqle) {
			System.out.println("SELECT 문에서 예외 발생");
			sqle.printStackTrace();
		} finally {
			try {
				if(dbconn != null) {
					dbconn.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
