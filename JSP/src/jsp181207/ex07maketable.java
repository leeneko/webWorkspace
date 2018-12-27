package jsp181207;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ex07maketable")
public class ex07maketable extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("EUC-KR");
		PrintWriter out = response.getWriter();
		out.println("<html><head><title>방 만들기</title></head><body>");
		out.println("<table border='1px solid black'>");
		out.println("<tr>");
		for (int i = 1; i <= Integer.parseInt(request.getParameter("input")); i++) {
			out.println("<td>" + i + "</td>");
		}
		out.println("</tr>");
		out.println("</table>");
		out.println("</body></html>");
	}

}
