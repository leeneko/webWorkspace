package jsp181206;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ex02request")
public class Ex02request extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("EUC-KR");
		PrintWriter out = response.getWriter();
		String client_addr = request.getRemoteAddr();
		// Client IP Address
		String client_host = request.getRemoteHost();
		// Client Name
		int client_port = request.getRemotePort();
		// Client Port
		System.out.println("Ŭ���̾�Ʈ IP : " + client_addr);
		System.out.println("Ŭ���̾�Ʈ name : " + client_host);
		System.out.println("Ŭ���̾�Ʈ ��Ʈ��ȣ : " + client_port);
		
		if (client_addr.equals("211.227.249.166")) {
			out.print("<h1>�ȳ��ϼ���</h1>");
		} else {
			out.print("�ȳ��ϼ���");
		}
	}

}
