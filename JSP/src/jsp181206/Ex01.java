package jsp181206;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ex01")
public class Ex01 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String local_addr = request.getLocalAddr();
		// Server IP Address
		String local_name = request.getLocalName();
		// Server Name
		int local_port = request.getLocalPort();
		// Server Port
		System.out.println("서버 IP : " + local_addr);
		System.out.println("서버 name : " + local_name);
		System.out.println("서버 포트번호 : " + local_port);
		
		String client_addr = request.getRemoteAddr();
		// Client IP Address
		String client_host = request.getRemoteHost();
		// Client Name
		int client_port = request.getRemotePort();
		// Client Port
		System.out.println("클라이언트 IP : " + client_addr);
		System.out.println("클라이언트 name : " + client_host);
		System.out.println("클라이언트 포트번호 : " + client_port);
		
		Locale locale = request.getLocale();
		System.out.println("지역 : " + locale);
		String protocol = request.getProtocol();
		System.out.println("프로토콜 : " + protocol);
	}

}
