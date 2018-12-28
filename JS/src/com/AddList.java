package com;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddList")
public class AddList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<InfoDTO> list = new ArrayList<InfoDTO>();
		list.add(new InfoDTO("정승우", 27, "010-0000-0000"));
		list.add(new InfoDTO("박현기", 26, "010-1111-2222"));
		list.add(new InfoDTO("이홍재", 30, "010-3333-4444"));
		
		request.setAttribute("list", list);
		// response.sendRedirect("view.jsp");
		RequestDispatcher ris = request.getRequestDispatcher("1227/view.jsp");
		ris.forward(request, response);
	}

}
