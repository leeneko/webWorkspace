package com.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.core.Command;

public class Edit implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String email = ((MemberDTO) session.getAttribute("memberdto")).getMember_email();
		String pw = request.getParameter("pw");
		String tel = request.getParameter("tel");
		String name = request.getParameter("name");
		String addr = request.getParameter("addr");
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = new MemberDTO(email, pw, tel, name, addr);
		int count = dao.edit(dto);
		if (count > 0) {
			session.setAttribute("memberdto", dto);
			return "s";
		} else {
			return "f";
		}
	}

}
