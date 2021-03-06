package com.Service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.MemberDAO;

public class DeleteMemberService implements com.inter.Command {

	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		response.setCharacterEncoding("EUC-KR");
		
		String email = request.getParameter("email");
		
		MemberDAO dao = new MemberDAO();
		boolean result = dao.deleteMember(email);
		PrintWriter out = response.getWriter();
		
		String nextPage = "";
		
		if (result) {
			out.print("<script>");
			out.print("alert('삭제 성공');");
			out.print("</script>");
			nextPage = "selectMember.jsp";
		} else {
			out.print("<script>");
			out.print("alert('삭제 실패');");
			out.print("</script>");
			nextPage = "main.jsp";
		}
		return nextPage;
	}

}
