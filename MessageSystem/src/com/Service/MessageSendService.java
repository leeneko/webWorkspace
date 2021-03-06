package com.Service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.message.MessageDAO;
import com.message.MessageDTO;

public class MessageSendService implements com.inter.Command {

	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		response.setCharacterEncoding("EUC-KR");
		
		HttpSession session = request.getSession();
		
		String name = (String) session.getAttribute("email");
		String email = request.getParameter("email");
		String content = request.getParameter("content");
		
		MessageDTO dto = new MessageDTO(name, email, content);
		MessageDAO dao = new MessageDAO();
		
		int cnt = dao.sendMessage(dto);
		String nextPage = "main.jsp";
		PrintWriter out = response.getWriter();
		
		if (cnt > 0) {
			out.print("<script>");
			out.print("alert('메세지 전송 성공');");
			out.print("</script>");
		} else {
			out.print("<script>");
			out.print("alert('메세지 전송 실패');");
			out.print("</script>");
		}
		return nextPage;
	}

}
