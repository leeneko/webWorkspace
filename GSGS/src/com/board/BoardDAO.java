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
		getConnection();
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		try {
			String sql = "SELECT * FROM board ORDER BY board_num";
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
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	public BoardDTO select(String num) {
		getConnection();
		BoardDTO dto = new BoardDTO();
		try {
			// 조회수 증가
			// UPDATE board SET board_views = board_views+1 WHERE board_num = 4
			String readSql = "UPDATE board SET board_views = board_views+1 WHERE board_num = ?";
			pst = conn.prepareStatement(readSql);
			pst.setInt(1, Integer.parseInt(num));
			pst.executeUpdate();
			
			String sql = "SELECT * FROM board WHERE board_num = ?";
			pst = conn.prepareStatement(sql);
			pst.setInt(1, Integer.parseInt(num));
			rs = pst.executeQuery();
			if (rs.next()) {
				dto.setCategory(rs.getString("category"));
				dto.setBoard_num(rs.getInt("board_num"));
				dto.setBoard_title(rs.getString("board_title"));
				dto.setBoard_writer(rs.getString("board_writer"));
				dto.setBoard_date(rs.getString("board_date"));
				dto.setBoard_content(rs.getString("board_content"));
				dto.setBoard_imgpath(rs.getString("board_imgpath"));
				dto.setBoard_views(rs.getInt("board_views"));
			}
		} catch (NumberFormatException nfe) {
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return dto;
	}

	public String insertBoard(BoardDTO dto) {
		getConnection();
		String result = "";
		try {
			// INSERT INTO board VALUES ('분류T', seq_board_num.nextval, '제목T', '작성자T', sysdate, '내용T', '이미지주소T', 0)
			String sql = "INSERT INTO board VALUES (?, seq_board_num.nextval, ?, ?, sysdate, ?, ?, 0)";
			pst = conn.prepareStatement(sql);
			pst.setString(1, dto.getCategory());
			pst.setString(2, dto.getBoard_title());
			pst.setString(3, dto.getBoard_writer());
			pst.setString(4, dto.getBoard_content());
			if (dto.getBoard_imgpath() == null) {
				pst.setString(5, "이미지없음");
			} else {
				pst.setString(5, dto.getBoard_imgpath());
			}
			int cnt = pst.executeUpdate();
			if (cnt > 0) {
				result = "s";
			} else {
				result = "f"; 
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}

	public int delete(int num) {
		getConnection();
		int result = 0;
		try {
			// DELETE board WHERE board_num = 4
			String sql = "DELETE board WHERE board_num = ?";
			pst = conn.prepareStatement(sql);
			pst.setInt(1, num);
			result = pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
}
