package com.core;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.MemberDAO;

public class IdCheck implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String email = request.getParameter("email");
		MemberDAO dao = new MemberDAO();
		boolean result = dao.duplicateEmail(email);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(result) { out.print("0"); }
		else { out.print("1"); }
		out.close();
		return null;
	}

}
