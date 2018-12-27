package jsp181213;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginService")
public class LoginService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		response.setCharacterEncoding("EUC-KR");
		
		String id = "user";
		String pw = "1234";
		
		String input_id = request.getParameter("id");
		String input_pw = request.getParameter("pw");

		if (id.equals(input_id) && pw.equals(input_pw)) {
			// query string 방식
			HttpSession session = request.getSession();
			session.setAttribute("id", input_id);
			response.sendRedirect("181213main.jsp");
		} else {
			// System.out.println("로그인 실패");
			response.sendRedirect("181213ex01.jsp");
		}
	}

}
