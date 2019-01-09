package com;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginCon implements Command {
	private static final long serialVersionUID = 1L;

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		response.setCharacterEncoding("EUC-KR");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		BookDTO dto = new BookDTO(id, pw);
		BookDAO dao = new BookDAO();
		String nextPage = "";
		
		int result = dao.login(dto);
		if (result > 0) {
			request.setAttribute("dto", dto);
			nextPage = "Question5_Main.jsp";
		} else {
		}
		
		return nextPage;
	}
    
	
}
