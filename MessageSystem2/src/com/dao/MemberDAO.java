package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDAO {
	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;
	
	private void getConnection() {
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "system";
			String password = "1234";

			conn = DriverManager.getConnection(url, user, password);
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	private void close() {
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
	
	public void memberInsert(MemberDTO dto) {
		getConnection();
		try {
			System.out.println(dto.getClass());
			String sql = "INSERT INTO web_member2 VALUES (?, ?, ?)";
			pst = conn.prepareStatement(sql);
			pst.setString(1, dto.getEmail());
			pst.setString(2, dto.getTel());
			pst.setString(3, dto.getAddress());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}
}
