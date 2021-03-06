package com.message;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MessageDAO {

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

	public int sendMessage(MessageDTO dto) {
		getConnection();
		int cnt = 0;
		try {
			// insert into web_message values(web_num.nextval, '1', '1', '1', sysdate);
			String sql = "INSERT INTO web_message values(web_num.nextval, ?, ?, ?, sysdate)";
			pst = conn.prepareStatement(sql);
			pst.setString(1, (String) dto.getName());
			pst.setString(2, (String) dto.getEmail());
			pst.setString(3, (String) dto.getContent());
			cnt = pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
	public ArrayList<MessageDTO> messageSelect(String email) {
		getConnection();
		ArrayList<MessageDTO> list = new ArrayList<MessageDTO>();
		try {
			String sql = "SELECT * FROM web_message WHERE receive_name = ?";
			pst = conn.prepareStatement(sql);
			pst.setString(1, email);
			
			rs = pst.executeQuery();
			
			while (rs.next()) {
				list.add(new MessageDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5)));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	public boolean messageDelete(String num) {
		getConnection();
		boolean result = false;
		try {
			String sql = "DELETE FROM web_message WHERE num=?";
			pst = conn.prepareStatement(sql);
			pst.setString(1, num);
			result = pst.execute();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}

	public int messageAllDelete(String email) {
		getConnection();
		int cnt = 0;
		try {
			String sql = "DELETE FROM web_message WHERE receive_name=?";
			pst = conn.prepareStatement(sql);
			pst.setString(1, email);
			cnt = pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
	public ArrayList<MessageDTO> selectAllMessage() {
		getConnection();
		ArrayList<MessageDTO> list = new ArrayList<MessageDTO>();
		
		try {
			String sql = "SELECT * FROM web_message ORDER BY send_date";
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			while (rs.next()) {
				MessageDTO dto = new MessageDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return list;
	}
}
