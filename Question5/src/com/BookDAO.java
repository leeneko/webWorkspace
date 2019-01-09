package com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BookDAO {
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

	public int join(BookDTO dto) {
		getConnection();
		int result = 0;
		// INSERT INTO book_member values('user', '1234', 'user', 'user@user.com', '000-0000-0000')
		try {
			String sql = "INSERT INTO book_member values(?, ?, ?, ?, ?)";
			pst = conn.prepareStatement(sql);
			pst.setString(1, dto.getId());
			pst.setString(2, dto.getPw());
			pst.setString(3, dto.getNick());
			pst.setString(4, dto.getEmail());
			pst.setString(5, dto.getTel());
			result = pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}

	public int login(BookDTO dto) {
		getConnection();
		int result = 0;
		// SELECT * FROM book_member WHERE id='user'
		try {
			String sql = "SELECT * FROM book_member WHERE id=? AND pw=?";
			pst = conn.prepareStatement(sql);
			pst.setString(1, dto.getId());
			pst.setString(2, dto.getPw());
			result = pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return result;
	}
}
