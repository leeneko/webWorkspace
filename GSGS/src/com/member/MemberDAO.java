package com.member;

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

	public boolean duplicateEmail(String email) {
		getConnection();
		boolean result = false;
		try {
			// SELECT * FROM dog_member WHERE member_email='admin'
			String sql = "SELECT * FROM dog_member WHERE member_email = ?";
			pst = conn.prepareStatement(sql);
			pst.setString(1, email);
			rs = pst.executeQuery();
			if (rs.next()) { result = true; } // 아이디 중복
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}

	public boolean join(MemberDTO dto) {
		getConnection();
		boolean result = false;
		try {
			// INSERT INTO dog_member VALUES ('admin', '1234', '010-0000-0000', '관리자', 'addr')
			String sql = "INSERT INTO dog_member VALUES (?, ?, ?, ?, ?)";
			pst = conn.prepareStatement(sql);
			pst.setString(1, dto.getMember_email());
			pst.setString(2, dto.getMember_pw());
			pst.setString(3, dto.getMember_tel());
			pst.setString(4, dto.getMember_name());
			pst.setString(5, dto.getMember_addr());
			int cnt = pst.executeUpdate();
			if (cnt > 0) { result = true; } else { }
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}

	public MemberDTO login(String id, String pw) {
		getConnection();
		MemberDTO dto = new MemberDTO();
		try {
			// SELECT * FROM dog_member WHERE member_email='admin'
			String sql = "SELECT * FROM dog_member WHERE member_email=?";
			// System.out.println("ID : " + id + "\nPW : " + pw);
			pst = conn.prepareStatement(sql);
			pst.setString(1, id);
			rs = pst.executeQuery();
			if (rs.next()) {
				dto.setMember_email(rs.getString("member_email"));
				dto.setMember_pw(rs.getString("member_pw"));
				dto.setMember_tel(rs.getString("member_tel"));
				dto.setMember_name(rs.getString("member_name"));
				dto.setMember_addr(rs.getString("member_addr"));
			} else {
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return dto;
	}

}
