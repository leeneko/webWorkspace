package com.Service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.message.MessageDAO;

public class MessageAllDeleteService implements com.inter.Command {

	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		response.setCharacterEncoding("EUC-KR");
		
		PrintWriter out = response.getWriter();
		String email = request.getParameter("email");
		MessageDAO dao = new MessageDAO();
		int cnt = dao.messageAllDelete(email);
		String nextPage = "main.jsp";
		
		if (cnt > 0) {
			out.print("<script>");
			out.print("alert('메세지 삭제 성공');");
			out.print("</script>");
		} else {
			out.print("<script>");
			out.print("alert('메세지 삭제 실패');");
			out.print("</script>");
		}
		return nextPage;
	}

}
