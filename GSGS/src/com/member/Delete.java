package com.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.core.Command;

public class Delete implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String result = "";
		HttpSession session = request.getSession();
		MemberDTO dto = (MemberDTO) session.getAttribute("memberdto");
		String sessionId = dto.getMember_email();
		String pwConfirm = request.getParameter("pw");
		MemberDAO dao = new MemberDAO();
		int cnt = dao.delete(sessionId, pwConfirm);
		if (cnt > 0) { // 삭제 성공
			result = "s";
		} else { // 삭제 실패
			result = "f";
		}
		return result;
	}

}
