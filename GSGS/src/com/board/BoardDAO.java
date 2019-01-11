package com.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BoardDAO {
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
	
	public ArrayList<BoardDTO> selectAll() {
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		getConnection();
		try {
			String sql = "SELECT * FROM board";
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			while (rs.next()) {
				String category = rs.getString("category");
				int board_num = rs.getInt("board_num");
				String board_title = rs.getString("board_title");
				String board_writer = rs.getString("board_writer");
				String board_date = rs.getString("board_date"); // 2019-01-11 19:44:33
				board_date = board_date.substring(0, 10);
				String board_content = rs.getString("board_content");
				String board_imgpath = rs.getString("board_imgpath");
				int board_views = rs.getInt("board_views");
				list.add(new BoardDTO(category, board_num, board_title, board_writer, board_date, board_content, board_imgpath, board_views));
			}
		} catch (Exception e) {
			
		} finally {
			
		}
		return list;
	}
}
