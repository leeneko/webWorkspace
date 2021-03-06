package com.Service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.MemberDAO;
import com.member.MemberDTO;

public class LoginService implements com.inter.Command {

	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		response.setCharacterEncoding("EUC-KR");
		
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		
		MemberDTO dto = new MemberDTO(email, pw);
		MemberDAO dao = new MemberDAO();
		MemberDTO get_dto = dao.login(dto);
		
		PrintWriter out = response.getWriter();
		
		String nextPage = "main.jsp";
		
		if(get_dto != null) {
			if (dto.getEmail().equals(get_dto.getEmail())) {
				if (dto.getPw().equals(get_dto.getPw())) {
					HttpSession session = request.getSession();
					session.setAttribute("email", get_dto.getEmail());
					session.setAttribute("tel", get_dto.getTel());
					session.setAttribute("address", get_dto.getAddress());
				}
			}
		} else {
			out.print("<script>");
			out.print("alert('로그인 실패');");
			out.print("</script>");
		}
		
		return nextPage;
	}
	
}
