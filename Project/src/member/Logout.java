package member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/logout")
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			response.setContentType("text/html; charset=EUC-KR");
			request.setCharacterEncoding("EUC-KR");
			javax.servlet.http.HttpSession session = request.getSession();
			java.io.PrintWriter out = response.getWriter();
			
			System.out.println(session.getAttribute("id") + "님이 로그아웃하셨습니다.");
			session.invalidate();
			response.sendRedirect("index.jsp");
			
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
