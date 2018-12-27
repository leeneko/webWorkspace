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
		System.out.println("���� IP : " + local_addr);
		System.out.println("���� name : " + local_name);
		System.out.println("���� ��Ʈ��ȣ : " + local_port);
		
		String client_addr = request.getRemoteAddr();
		// Client IP Address
		String client_host = request.getRemoteHost();
		// Client Name
		int client_port = request.getRemotePort();
		// Client Port
		System.out.println("Ŭ���̾�Ʈ IP : " + client_addr);
		System.out.println("Ŭ���̾�Ʈ name : " + client_host);
		System.out.println("Ŭ���̾�Ʈ ��Ʈ��ȣ : " + client_port);
		
		Locale locale = request.getLocale();
		System.out.println("���� : " + locale);
		String protocol = request.getProtocol();
		System.out.println("�������� : " + protocol);
	}

}
