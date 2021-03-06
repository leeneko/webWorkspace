package com.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
	
	public int join(MemberDTO dto) {
		getConnection();
		int cnt = 0;
		try {
			String sql = "insert into web_member values(?,?,?,?)";
			pst = conn.prepareStatement(sql);
			pst.setString(1, dto.getEmail());
			pst.setString(2, dto.getPw());
			pst.setString(3, dto.getTel());
			pst.setString(4, dto.getAddress());

			cnt = pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
		
	}
	
	public MemberDTO login(MemberDTO dto) {
		
		getConnection();
		MemberDTO get_dto = new MemberDTO();
		
		try {
			String sql = "select * from web_member where email = ?";
			pst = conn.prepareStatement(sql);
			pst.setString(1, dto.getEmail());
			
			rs = pst.executeQuery();
		
			if(rs.next()) {
				get_dto.setEmail(rs.getString("email"));
				get_dto.setPw(rs.getString("pw"));
				get_dto.setTel(rs.getString("tel"));
				get_dto.setAddress(rs.getString("address"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return get_dto;
		
	}

	public int update(MemberDTO dto) {
		getConnection();
		int cnt = 0;
		try {
			String sql = "UPDATE web_member SET pw = ?, tel = ?, address = ? WHERE email = ?";
			pst = conn.prepareStatement(sql);
			pst.setString(1, dto.getPw());
			pst.setString(2, dto.getTel());
			pst.setString(3, dto.getAddress());
			pst.setString(4, dto.getEmail());
			
			cnt = pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	public ArrayList<MemberDTO> selectAllMember() {
		getConnection();
		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
		
		try {
			String sql = "SELECT * FROM web_member";
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			while (rs.next()) {
				list.add(new MemberDTO(rs.getString("email"), rs.getString("pw"), rs.getString("tel"), rs.getString("address")));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return list;
	}

	public boolean deleteMember(String email) {
		getConnection();
		boolean result = false;
		try {
			String sql = "DELETE FROM web_member WHERE email=?";
			pst = conn.prepareStatement(sql);
			pst.setString(1, email);
			result = pst.execute();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	
}
