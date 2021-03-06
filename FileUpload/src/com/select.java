package com;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/select")
public class select extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		response.setCharacterEncoding("EUC-KR");
		
		int userSelect = Integer.parseInt((String) request.getParameter("num"));
		FileDAO dao = new FileDAO();
		FileDTO dto = dao.select(userSelect);
		request.setAttribute("dto", dto);
		
		RequestDispatcher dis = request.getRequestDispatcher("boardView.jsp");
		dis.forward(request, response);
	}

}
