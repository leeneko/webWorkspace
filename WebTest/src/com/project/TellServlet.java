package com.project;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/TellServlet")
public class TellServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDTO member1 = new MemberDTO("차현석", 23, "010-1111-2222");
		MemberDTO member2 = new MemberDTO("이은비", 22, "010-3333-4444");
		MemberDTO member3 = new MemberDTO("박병관", 17, "010-5555-6666");
		
		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
		list.add(member1);
		list.add(member2);
		list.add(member3);
		
		response.setCharacterEncoding("EUC-KR");
		request.setCharacterEncoding("EUC-KR");
		javax.servlet.http.HttpSession session = request.getSession();
		session.setAttribute("list", list);
		RequestDispatcher ris = request.getRequestDispatcher("view.jsp");
		ris.forward(request, response);
	}
	
}