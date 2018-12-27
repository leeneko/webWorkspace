package jsp181207;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ex10multable")
public class ex10multable extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String color = request.getParameter("color");
		int input1 = Integer.parseInt(request.getParameter("input1"));
		int input2 = Integer.parseInt(request.getParameter("input2"));
		
		PrintWriter out = response.getWriter();
		out.print("<html><head></head><body>");
		out.print("<table border='1px solid black' bgcolor='" + color + "'>");
		for ( ; input1 <= input2 ; input1++) {
			out.print("<tr>");
			for (int i = 1; i < 10; i++) {
				out.print("<td>" + input1 + "*" + i + "=" + input1 * i + "</td>");
			}
			out.print("</tr>");
		}
		out.print("</table></body></html>");
	}

}
