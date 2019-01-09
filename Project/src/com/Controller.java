package com;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("*.do")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		response.setCharacterEncoding("EUC-KR");
		
		String uri = request.getRequestURI();
		String path = request.getContextPath();
		String com = uri.substring(path.length() + 1);
		String nextPage = "";
		
		if(com.equals("Logout.do")) {
			HttpSession session = request.getSession();
			session.invalidate();
		} if (com.equals("MemberIdCheckAction.do")) {
			Command idCheck = new IdCheck();
			idCheck.execute(request, response);
		}

		RequestDispatcher dis = request.getRequestDispatcher(nextPage);
		try {
			dis.forward(request, response);
		} catch (IllegalStateException e) {
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

    
}
