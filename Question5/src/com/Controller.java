package com;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.do")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		response.setCharacterEncoding("EUC-KR");
		
		String uri = request.getRequestURI();
		String path = request.getContextPath();
		String com = uri.substring(path.length() + 1);
		
		String nextPage = "Question5_Login.jsp"; // 메인페이지
		if (com.equals("Join.do")) {
			Command join = new JoinCon();
			join.execute(request, response);
		} else if (com.equals("Login.do")) {
			Command login = new LoginCon();
			nextPage = login.execute(request, response);
		}
		
		RequestDispatcher dis = request.getRequestDispatcher(nextPage);
		dis.forward(request, response);
	}
    
}
