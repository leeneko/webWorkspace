package com;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class JoinCon implements Command {
	private static final long serialVersionUID = 1L;

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		response.setCharacterEncoding("EUC-KR");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String nick = request.getParameter("nick");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		
		BookDTO dto = new BookDTO(id, pw, nick, email, tel);
		BookDAO dao = new BookDAO();
		String nextPage = "";
		
		int result = dao.join(dto);
		if (result > 0) {
			request.setAttribute("dto", dto);
			System.out.println("가입 성공");
			nextPage = "Question5_Login.jsp";
		} else {
			System.out.println("가입 실패");
		}
		
		return nextPage;
	}
    
	
}
