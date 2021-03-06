package member;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.memberDAO;
import DAO.memberVO;

@WebServlet("/join")
public class Join extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		response.setCharacterEncoding("EUC-KR");
		PrintWriter out = response.getWriter();
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String nick = request.getParameter("nick");
		String email = request.getParameter("email");
		
		memberDAO dao = new memberDAO();
		memberVO vo = new memberVO(id, pw, nick, email);
		
		int result = dao.join(vo);
		
		System.out.println(result);
		
		if (result > 0) {
			out.print("<script>");
			out.print("alert('가입 성공');");
			out.print("</script>");
		} else {
			out.print("<script>");
			out.print("alert('가입 실패');");
			out.print("</script>");
			response.sendRedirect("index.jsp");
		}
	}
    
}
