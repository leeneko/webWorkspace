package com.rgst;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class RgstDAO {
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
	
	public ArrayList<RgstDTO> selectAll() {
		getConnection();
		ArrayList<RgstDTO> list = new ArrayList<RgstDTO>();
		try {
			String sql = "SELECT num, title, writer, wdate FROM rgst ORDER BY num";
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			while(rs.next()) {
				list.add(new RgstDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4).substring(0, 10)));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	public String insert(RgstDTO rdto) {
		getConnection();
		String result = "";
		try {
			// INSERT INTO rgst VALUES (num, addr, title, writer, wdate, kind, gender, birth, content, prev, imgpath, dogsize, pers, ap1, ap2, ap3, ap4)
			String sql = "INSERT INTO rgst VALUES (seq_rgst_num.nextval, ?, ?, ?, sysdate, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pst = conn.prepareStatement(sql);
			pst.setString(1, rdto.getAddr());
			pst.setString(2, rdto.getTitle());
			pst.setString(3, rdto.getWriter());
			pst.setString(4, rdto.getKind());
			pst.setString(5, rdto.getGender());
			pst.setString(6, rdto.getBirth());
			pst.setString(7, rdto.getContent());
			pst.setString(8, rdto.getPrev());
			pst.setString(9, rdto.getImgpath());
			pst.setString(10, rdto.getDogsize());
			pst.setString(11, rdto.getPers());
			pst.setString(12, rdto.getAp1());
			pst.setString(13, rdto.getAp2());
			pst.setString(14, rdto.getAp3());
			pst.setString(15, rdto.getAp4());
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
	
	public RgstDTO select(String temp_num) {
		getConnection();
		RgstDTO rdto = new RgstDTO();
		int num = Integer.parseInt(temp_num);
		try {
			String sql = "SELECT * FROM rgst WHERE num = ?";
			pst = conn.prepareStatement(sql);
			pst.setInt(1, num);
			rs = pst.executeQuery();
			if (rs.next()) {
				rdto.setNum(rs.getInt("num"));
				rdto.setAddr(rs.getString("addr"));
				rdto.setTitle(rs.getString("title"));
				rdto.setWriter(rs.getString("writer"));
				rdto.setWdate(rs.getString("wdate"));
				rdto.setKind(rs.getString("kind"));
				rdto.setGender(rs.getString("gender"));
				rdto.setBirth(rs.getString("birth"));
				rdto.setContent(rs.getString("content"));
				rdto.setPrev(rs.getString("prev"));
				rdto.setImgpath(rs.getString("imgpath"));
				rdto.setDogsize(rs.getString("dogsize"));
				rdto.setPers(rs.getString("pers"));
				rdto.setAp1(rs.getString("ap1"));
				rdto.setAp2(rs.getString("ap2"));
				rdto.setAp3(rs.getString("ap3"));
				rdto.setAp4(rs.getString("ap4"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return rdto;
	}
	
	public int count() {
		getConnection();
		int cnt = 0;
		try {
			String sql = "SELECT COUNT(num) FROM rgst";
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			if(rs.next())
				cnt = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
	public ArrayList<RgstDTO> selectRnd(int[] rnd) {
		getConnection();
		ArrayList<RgstDTO> list = new ArrayList<RgstDTO>();
		try {
			// SELECT num, imgpath, dogsize, pers, ap1, ap2, ap3, ap4 FROM rgst WHERE num = 2 OR num = 3 OR num = 4 OR num = 5
			String sql = "SELECT num, imgpath, dogsize, pers, ap1, ap2, ap3, ap4 FROM rgst WHERE num = ? OR num = ? OR num = ? OR num = ?";
			pst = conn.prepareStatement(sql);
			pst.setInt(1, rnd[0]);
			pst.setInt(2, rnd[1]);
			pst.setInt(3, rnd[2]);
			pst.setInt(4, rnd[3]);
			rs = pst.executeQuery();
			while (rs.next()) {
				list.add(new RgstDTO(rs.getInt("num"), rs.getString("imgpath"), rs.getString("dogsize"), rs.getString("pers"), rs.getString("ap1"), rs.getString("ap2"), rs.getString("ap3"), rs.getString("ap4")));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return list;
	}
	
	public ArrayList<RgstDTO> similerSelect(int i, String s1, String s2) {
		getConnection();
		ArrayList<RgstDTO> list = new ArrayList<RgstDTO>();
		try {
			// SELECT num, imgpath FROM rgst WHERE dogsize='소형견' AND ap1='멋짐' AND 8 NOT IN(num)
			String sql = "SELECT num, imgpath FROM rgst WHERE dogsize = ? AND ap1 = ? AND ? NOT IN(num)";
			pst = conn.prepareStatement(sql);
			pst.setString(1, s1);
			pst.setString(2, s2);
			pst.setInt(3, i);
			rs = pst.executeQuery();
			while (rs.next()) {
				list.add(new RgstDTO(rs.getInt("num"), rs.getString("imgpath")));
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			close();
		}
		return list;
	}
}
