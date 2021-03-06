package com.Service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.inter.Command;
import com.member.MemberDAO;
import com.member.MemberDTO;

public class JoinService implements Command {
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		response.setCharacterEncoding("EUC-KR");
		
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		String tel = request.getParameter("tel");
		String address = request.getParameter("address");
		
		MemberDTO dto = new MemberDTO(email, pw, tel, address);
		MemberDAO dao = new MemberDAO();
		String nextPage = "";
		
		int result = dao.join(dto);
		if (result > 0) {
			request.setAttribute("dto", dto);
			nextPage = "joinSuccess.jsp";
		} else {
			System.out.println("가입 실패");
			nextPage = "main.jsp";
		}
		
		return nextPage;
	}
}
