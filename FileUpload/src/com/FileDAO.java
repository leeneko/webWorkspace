package com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class FileDAO {
	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;

	public void getConnection() {
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
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void close() {
		try {
			if (rs != null) { rs.close(); }
			if (pst != null) { pst.close(); }
			if (conn != null) { conn.close(); }
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public int insertBoard(FileDTO dto) {
		int cnt = 0;
		getConnection();
		try {
			// INSERT INTO web_board VALUES(bnum.nextval, writer, title, content, fileName, sysdate)
			String sql = "INSERT INTO web_board VALUES(bnum.nextval, ?, ?, ?, ?, sysdate)";
			pst = conn.prepareStatement(sql);
			pst.setString(1, dto.getWritter());
			pst.setString(2, dto.getTitle());
			pst.setString(3, dto.getContent());
			pst.setString(4, dto.getFileName());
			cnt = pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
	public ArrayList<FileDTO> selectAll() {
		ArrayList<FileDTO> list = new ArrayList<FileDTO>();
		getConnection();
		try {
			String sql = "SELECT * FROM web_board";
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			while (rs.next()) {
				list.add(new FileDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6)));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	public FileDTO select(int userSelect) {
		FileDTO dto = new FileDTO();
		getConnection();
		try {
			String sql = "SELECT * FROM web_board WHERE num = ?";
			pst = conn.prepareStatement(sql);
			pst.setInt(1, userSelect);
			rs = pst.executeQuery();
			if (rs.next()) {
				// num, writer, title, content, filename, sendate
				dto.setNum(rs.getInt("num"));
				dto.setWritter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setFileName(rs.getString("filename"));
				dto.setSendate(rs.getString("sendate"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return dto;
	}
}
