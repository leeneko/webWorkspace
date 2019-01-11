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

	public int delete(String sessionId, String pwConfirm) {
		int cnt = 0;
		getConnection();
		try {
			// DELETE dog_member WHERE member_email='user@user.user' AND member_pw='!Q2w3e4r'
			String sql = "DELETE dog_member WHERE member_email=? AND member_pw=?";
			pst = conn.prepareStatement(sql);
			pst.setString(1, sessionId);
			pst.setString(2, pwConfirm);
			cnt = pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	public int edit(MemberDTO dto) {
		int cnt = 0;
		getConnection();
		try {
			//UPDATE dog_member SET member_pw='1q2w3e$R', member_tel='010-1111-1234', member_name='유저', member_addr='변경될 주소' WHERE member_email='user@user.user'
			String sql = "UPDATE dog_member SET member_pw=?, member_tel=?, member_name=?, member_addr=? WHERE member_email=?";
			pst = conn.prepareStatement(sql);
			pst.setString(1, dto.getMember_pw());
			pst.setString(2, dto.getMember_tel());
			pst.setString(3, dto.getMember_name());
			pst.setString(4, dto.getMember_addr());
			pst.setString(5, dto.getMember_email());
			cnt = pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

}
