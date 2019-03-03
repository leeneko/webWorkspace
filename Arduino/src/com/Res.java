package com;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Res")
public class Res extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		if (request.getParameter("aname") != null) {
			String aname = request.getParameter("aname");
			String type1 = request.getParameter("type1");
			String rate1 = request.getParameter("rate1");
			String type2 = request.getParameter("type2");
			String rate2 = request.getParameter("rate2");
			String type3 = request.getParameter("type3");
			String rate3 = request.getParameter("rate3");
			
			DAO dao = new DAO();
			dao.order(aname, type1, rate1, type2, rate2, type3, rate3);
		} else {
			// Failed
		}
	}
    
	
}
