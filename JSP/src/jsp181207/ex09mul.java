package jsp181207;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ex08mul
 */
@WebServlet("/ex09mul")
public class ex09mul extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int temp = Integer.parseInt(request.getParameter("input"));
		
		PrintWriter out = response.getWriter();
		out.println("<table border='1px solid black'>");
		for (int i = 1; i < 10; i++) {
			out.println("<tr><td>" + temp + "*" + i + "=" + (temp * i) + "</td></tr>");
		}
		out.println("</table>");
	}

}
