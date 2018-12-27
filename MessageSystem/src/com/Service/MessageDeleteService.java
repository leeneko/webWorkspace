package com.Service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.message.MessageDAO;

public class MessageDeleteService implements com.inter.Command {

	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		response.setCharacterEncoding("EUC-KR");
		PrintWriter out = response.getWriter();
		String num = request.getParameter("num");
		MessageDAO dao = new MessageDAO();
		boolean result = dao.messageDelete(num);
		String nextPage = "main.jsp";
		if (result) { // 성공
			out.print("<script>");
			out.print("alert('삭제 성공');");
			out.print("</script>");
		} else { // 실패
			out.print("<script>");
			out.print("alert('삭제 실패');");
			out.print("</script>");
		}
		return nextPage;
	}

}
