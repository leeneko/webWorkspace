package jsp181210;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Exam03")
public class Exam03 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		response.setCharacterEncoding("EUC-KR");
		
		String[] games = request.getParameterValues("games");
		
		PrintWriter out = response.getWriter();
		out.print("<html><body>");
		for (int i = 0; i < games.length; i++) {
			out.print(games[i] + " ");
		}
		out.print("</body></html>");
	}

}
