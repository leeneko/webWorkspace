package project;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Address")
public class Address extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("EUC-KR");
		
		ArrayList<AddressDTO> list = new ArrayList<AddressDTO>();
		
		AddressDTO a = new AddressDTO("박현기", 25, "010-0000-0000");
		AddressDTO b = new AddressDTO("이홍재", 25, "010-1111-1111");
		AddressDTO c = new AddressDTO("정승우", 25, "010-2222-2222");
		
		list.add(a);
		list.add(b);
		list.add(c);
		
		request.setAttribute("list", list);
		RequestDispatcher ris = request.getRequestDispatcher("View");
		ris.forward(request, response);
	}

}
