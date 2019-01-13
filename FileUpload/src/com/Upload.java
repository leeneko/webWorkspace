package com;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/Upload")
public class Upload extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		response.setCharacterEncoding("EUC-KR");
		
		String saveDir = request.getServletContext().getRealPath("file");
//		System.out.println(saveDir);
//		D:\webWorkspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\FileUpload\file
		int maxSize = 5 * 1024 * 1024; // 5MB
		String encoding = "EUC-KR";
		
		// request 객체, 저장될 위치, 파일 최대 크기, 인코딩 방식, 중복값 처리 방식
		MultipartRequest multi = new MultipartRequest(request, saveDir, maxSize, encoding, new DefaultFileRenamePolicy());
		String writter = multi.getParameter("writter");
		String title = multi.getParameter("title");
		String content = multi.getParameter("content");
		String fileName= multi.getFilesystemName("fileName");
		
//		System.out.println("작성자 : " + writter);
//		System.out.println("제목 : " + title);
//		System.out.println("내용 : " + content);
//		System.out.println("파일명 : " + fileName);
		
		FileDTO dto = new FileDTO(writter, title, content, fileName);
		FileDAO dao = new FileDAO();
		int cnt = dao.insertBoard(dto);
		if(cnt > 0) {
			RequestDispatcher dis = request.getRequestDispatcher("board.jsp");
			dis.forward(request, response);
		} else {
			RequestDispatcher dis = request.getRequestDispatcher("upload.html");
			dis.forward(request, response);
		}
	}

}
