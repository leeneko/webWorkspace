import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginService")
public class LoginService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		memDAO dao = new memDAO();
		memDTO dto = dao.login(request.getParameter("id"));
		
		HttpSession session = request.getSession();
		session.setAttribute("dto", dto);
		session.setAttribute("name", dto.getName());
		
		if (request.getParameter("pw").equals(dto.getPw())) {
			response.sendRedirect("main.jsp");
		} else {
			response.sendRedirect("login.html");
		}
	}

}
