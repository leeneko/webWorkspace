package project;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/View")
public class View extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		ArrayList<AddressDTO> list = (ArrayList<AddressDTO>) request.getAttribute("list");
		PrintWriter out = response.getWriter();
		out.print("<table border='1px'><tr><td>순서</td><td>이름</td><td>나이</td><td>전화번호</td></tr>");
		for (int i = 0; i < list.size(); i++) {
			out.print("<tr>");
			
			out.print("<td>" + i + "</td>");
			out.print("<td>" + list.get(i).getName() + "</td>");
			out.print("<td>" + list.get(i).getAge() + "</td>");
			out.print("<td>" + list.get(i).getTell() + "</td>");
			
			out.print("</tr>");
		}
		out.print("</table>");
	}

}
