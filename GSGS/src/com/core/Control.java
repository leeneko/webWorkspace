package com.core;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.*;

@WebServlet("*.dog")
public class Control extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String uri = request.getRequestURI();
		String path = request.getContextPath();
		String com = uri.substring(path.length() + 1);
		String nextPage = "";
		
		if (com.equals("MemberCheck.dog")) {
			Command idCheck = new IdCheck();
			idCheck.execute(request, response);
		}
		if (com.equals("join.dog")) {
			Command join = new Join();
			String result = join.execute(request, response);
			if (result.equals("s")) {
				out.println("<script>alert('계정 등록에 성공했습니다.'); location.href='index.jsp';</script>");
				out.flush();
			} else {
				out.println("<script>alert('계정 등록에 실패했습니다.'); location.href='index.jsp';</script>");
				out.flush();
			}
		}
		if (com.equals("login.dog")) {
			Command login = new Login();
			String result = login.execute(request, response);
			if (result.equals("s")) {
				out.println("<script>alert('로그인에 성공했습니다.'); location.href='index.jsp';</script>");
				out.flush();
			} else {
				out.println("<script>alert('로그인에 실패했습니다. 아이디와 비밀번호를 확인해주세요.'); location.href='index.jsp';</script>");
				out.flush();
			}
		}
		if (com.equals("logout.dog")) {
			HttpSession session = request.getSession();
			session.invalidate();
			nextPage = "index.jsp";
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
