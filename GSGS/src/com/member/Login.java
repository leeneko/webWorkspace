package com.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.core.Command;

public class Login implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		MemberDTO dto = new MemberDTO();
		MemberDAO dao = new MemberDAO();
		dto = dao.login(id, pw);
		
		String result = "";
		
		try {
			if (dto.getMember_email().equals(id) && dto.getMember_pw().equals(pw)) {
				javax.servlet.http.HttpSession session = request.getSession();
				session.setAttribute("memberdto", dto);
				return "s";
			}
		} catch (NullPointerException npe) {
			
		}
		return result;
	}
}
