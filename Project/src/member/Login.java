package member;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Login
 */
@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		response.setCharacterEncoding("EUC-KR");
		
		// input processing
		javax.servlet.http.HttpSession session = request.getSession();
		int checked = -1;
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		String checkId = "";
		String checkPw = "";

		// DB connection
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "leeneko";
		String password = "15746";

		Connection conn;
		PreparedStatement pstmt;
		ResultSet rs;

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, password);
			pstmt = conn.prepareStatement("SELECT id, pw FROM MEMBER WHERE id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				checkId = rs.getString("id");
				checkPw = rs.getString("pw");
			}
			conn.close();

			// ID, password check
			if (id.equals(checkId)) {
				if (pw.equals(checkPw)) { // login success
					checked = 1;
				} else { // invalid pw
					checked = 0;
				}
			} else { // invalid id, pw
				checked = -1;
			}
			
			PrintWriter script = response.getWriter();
			// result processing
			if (checked == 0) {
				script.println("<script>");
				script.println("alert('비밀번호를 확인해주세요.')");
				script.println("location.href='index.jsp';");
				script.println("</script>");
				script.close();
			} else if (checked == -1) {
				script.println("<script>");
				script.println("alert('아이디와 비밀번호를 확인해주세요.')");
				script.println("location.href='index.jsp';");
				script.println("</script>");
				script.close();
			} else {
				session.setAttribute("id", id);
				script.println("<script>");
				script.println("location.href='main.jsp';");
				script.println("</script>");
				script.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
