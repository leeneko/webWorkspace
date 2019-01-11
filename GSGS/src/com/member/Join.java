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
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		String tel = request.getParameter("tel");
		String name = request.getParameter("name");
		String addr = request.getParameter("addr");
		MemberDTO dto = new MemberDTO(email, pw, tel, name, addr);
		MemberDAO dao = new MemberDAO();
		boolean result = dao.join(dto);
		if (result) {
			return "s"; // 성공
		} else {
			return "f"; // 실패
		}
	}
	
}
