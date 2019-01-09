package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;

public class memberDAO {

	public int join(memberVO vo) {
		DBConnection dbconn = new DBConnection();
		int result = 0;
		
		try {
			String sql = "INSERT INTO member VALUES (?, ?, ?, ?)";
			dbconn.conn = dbconn.getConnection();
			dbconn.pst = dbconn.conn.prepareStatement(sql);
			dbconn.pst.setString(1, vo.getId());
			dbconn.pst.setString(2, vo.getPw());
			dbconn.pst.setString(3, vo.getNick());
			dbconn.pst.setString(4, vo.getEmail());
			result = dbconn.pst.executeUpdate();
		} catch (SQLIntegrityConstraintViolationException icve) {
			result = 4;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbconn.close();
		}
		return result;
	}

	public boolean duplicateIdCheck(String id) {
		DBConnection dbconn = new DBConnection();
		boolean result = false;
		
		try {
			String sql = "SELECT id FROM member WHERE ID=?";
			dbconn.conn = dbconn.getConnection();
			dbconn.pst = dbconn.conn.prepareStatement(sql);
			dbconn.pst.setString(1, id);
			dbconn.rs = dbconn.pst.executeQuery();
			if(dbconn.rs.next()) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbconn.close();
		}
		
		return result;
	}
	
}
