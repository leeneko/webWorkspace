package com.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.core.Command;
import com.member.MemberDTO;

public class BoardDelete implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String result = "";
		HttpSession session = request.getSession();
		MemberDTO mdto = (MemberDTO) session.getAttribute("memberdto");
		String sessionPw = mdto.getMember_pw();
		String confirmPw = request.getParameter("pwd");
		BoardDTO bdto = (BoardDTO) session.getAttribute("bdto");
		int num = bdto.getBoard_num();
		if (sessionPw.equals(confirmPw)) {
			BoardDAO dao = new BoardDAO();
			int cnt = dao.delete(num);
			if (cnt > 0) {
				result = "s";
			}
		} else {
			result = "f";
		}
		return result;
	}

}
