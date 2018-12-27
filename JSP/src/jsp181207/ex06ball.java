package jsp181207;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

@WebServlet("/ex06ball")
public class ex06ball extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
		res.setCharacterEncoding("EUC-KR");
		int input = Integer.parseInt(req.getParameter("input"));
		
		PrintWriter out = res.getWriter();
		out.print("<html><body>");
		out.print("���� ���� ���� : " + input);
		out.print("<br>������ ũ�� : 5");
		out.print("<br>���� ���� �� �ִ� ���� �� : ");
		if (input % 5 == 0) {
			out.print(input / 5);
		} else {
			out.print(input / 5 + 1);
		}
		out.print("</body></html>");
	}

}
