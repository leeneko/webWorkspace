package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.Service.*;
import com.inter.Command;

@WebServlet("*.do")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		response.setCharacterEncoding("EUC-KR");
		
		String uri = request.getRequestURI();
		String path = request.getContextPath();
		String com = uri.substring(path.length() + 1);
		
		String nextPage = "main.jsp";
		
		if(com.equals("Logout.do")) {
			HttpSession session = request.getSession();
			session.invalidate();
		} else if(com.equals("Login.do")) {
			Command login = new LoginService();
			nextPage = login.execute(request, response);
		} else if (com.equals("Join.do")) {
			Command join = new JoinService();
			join.execute(request, response);
		} else if (com.equals("Delete.do")) {
			new DeleteMemberService().execute(request, response);
		} else if (com.equals("Update.do")) {
			new UpdateService().execute(request, response);
		} else if (com.equals("MessageAllDelete.do")) {
			new MessageAllDeleteService().execute(request, response);
		} else if (com.equals("MessageDelete.do")) {
			new MessageDeleteService().execute(request, response);
		} else if (com.equals("MessageSend.do")) {
			new MessageSendService().execute(request, response);
		}
		
		RequestDispatcher dis = request.getRequestDispatcher(nextPage);
		dis.forward(request, response);
	}

}
