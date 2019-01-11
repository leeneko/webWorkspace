package com.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.core.Command;

public class Join implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		response.setCharacterEncoding("EUC-KR");
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		String addr = request.getParameter("addr");
		MemberDTO dto = new MemberDTO(email, pw, name, tel, addr);
		MemberDAO dao = new MemberDAO();
		boolean result = dao.join(dto);
		if (result) {
			return "s"; // 성공
		} else {
			return "f"; // 실패
		}
	}
	
}
