package com;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.memberDAO;

public class IdCheck implements Command {

	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		memberDAO dao = new memberDAO();
		
		boolean result = dao.duplicateIdCheck(id);
		
		response.setContentType("text/html;charset=euc-kr");
		PrintWriter out = response.getWriter();
		
		if (result)
			out.print("0");
		else
			out.print("1");
		
		out.close();
		
		return null;
	}

}
