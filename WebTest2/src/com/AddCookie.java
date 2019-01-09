package com;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddCookie")
public class AddCookie extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		if (id.equals("smhrd") && pw.equals("1234")) {
			Cookie cook = new Cookie("id", id);
			response.addCookie(cook);
		}
		RequestDispatcher dis = request.getRequestDispatcher("result.jsp");
		dis.forward(request, response);
	}
	
}
