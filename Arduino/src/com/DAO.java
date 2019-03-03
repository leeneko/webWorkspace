package com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DAO {
	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;
	
	private void getConnection() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "leeneko";
			String password = "15746";

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

	public VO select() {
		getConnection();
		VO vo = new VO();
		try {
			// SELECT * FROM ( SELECT * FROM aorder WHERE io='f' order by ordernum ) WHERE ROWNUM=1;
			String sql = "SELECT * FROM ( SELECT * FROM aorder WHERE io='f' order by ordernum ) WHERE ROWNUM=1";
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			if (rs.next()) {
				vo.setOrderNum(rs.getInt("ordernum"));
				vo.setName(rs.getString("aname"));
				vo.setType1(rs.getString("type1"));
				vo.setRate1(rs.getString("rate1"));
				vo.setType2(rs.getString("type2"));
				vo.setRate2(rs.getString("rate2"));
				vo.setType3(rs.getString("type3"));
				vo.setRate3(rs.getString("rate3"));
				vo.setIo(rs.getString("io"));
			}
			// 클라이언트로부터 해당 주문을 한번 읽어들일 시 io 값을 False > True 로
			// UPDATE aorder SET io = 't' WHERE ordernum = ?
			sql = "UPDATE aorder SET io = 't' WHERE ordernum = ?";
			pst = conn.prepareStatement(sql);
			pst.setInt(1, vo.getOrderNum());
			pst.execute();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return vo;
	}

	public void order(String aname, String type1, String rate1, String type2, String rate2, String type3,
			String rate3) {
		getConnection();
		try {
			// INSERT INTO aorder VALUES ( aorder_seq.nextval, 'sobe', 'soju', '5', 'beer', '5', '', '', 'f');
			String sql = "INSERT INTO aorder VALUES ( aorder_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ? )";
			pst = conn.prepareStatement(sql);
			pst.setString(1, aname);
			pst.setString(2, type1);
			pst.setString(3, rate1);
			pst.setString(4, type2);
			pst.setString(5, rate2);
			pst.setString(6, type3);
			pst.setString(7, rate3);
			pst.setString(8, "f");
			boolean temp = pst.execute();
			if (temp == true)
				System.out.println("성공");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
	}
	
	public ArrayList<VO> selectAll() {
		getConnection();
		ArrayList<VO> li = new ArrayList<VO>();
		try {
			String sql = "SELECT * FROM aorder ORDER BY ordernum";
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			while (rs.next()) {
				VO vo = new VO();
				vo.setOrderNum(rs.getInt("ordernum"));
				vo.setName(rs.getString("aname"));
				vo.setType1(rs.getString("type1"));
				vo.setRate1(rs.getString("rate1"));
				vo.setType2(rs.getString("type2"));
				vo.setRate2(rs.getString("rate2"));
				vo.setType3(rs.getString("type3"));
				vo.setRate3(rs.getString("rate3"));
				vo.setIo(rs.getString("io"));
				li.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return li;
	}
	
}
