package com.Service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.MemberDAO;
import com.member.MemberDTO;

public class UpdateService implements com.inter.Command {

	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		response.setCharacterEncoding("EUC-KR");
		
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		String pw = (String) request.getParameter("pw");
		String tel = (String) request.getParameter("tel");
		String address = (String) request.getParameter("address");
		
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = new MemberDTO(email, pw, tel, address);
		int cnt = dao.update(dto);
		
		String nextPage = "";
		
		if (cnt > 0) {
			session.setAttribute("email", dto.getEmail());
			session.setAttribute("tel", dto.getTel());
			session.setAttribute("address", dto.getAddress());
			nextPage = "main.jsp";
		} else {
			nextPage = "update.jsp";
		}
		return nextPage;
	}

}
