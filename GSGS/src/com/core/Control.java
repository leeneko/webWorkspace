package com.core;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.board.BoardDAO;
import com.board.BoardDTO;
import com.board.BoardDelete;
import com.member.*;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.rgst.RgstDAO;
import com.rgst.RgstDTO;

@WebServlet("*.dog")
public class Control extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		
		String uri = request.getRequestURI();
		String path = request.getContextPath();
		String com = uri.substring(path.length() + 1);
		String nextPage = "";
		
		if (com.equals("MemberCheck.dog")) {
			Command idCheck = new IdCheck();
			idCheck.execute(request, response);
		}
		if (com.equals("join.dog")) {
			Command join = new Join();
			String result = join.execute(request, response);
			if (result.equals("s")) {
				out.println("<script>alert('계정 등록에 성공했습니다.'); location.href='index.jsp';</script>");
				out.flush();
			} else {
				out.println("<script>alert('계정 등록에 실패했습니다.'); location.href='index.jsp';</script>");
				out.flush();
			}
		}
		if (com.equals("login.dog")) {
			Command login = new Login();
			String result = login.execute(request, response);
			if (result.equals("s")) {
				out.println("<script>alert('로그인에 성공했습니다.'); location.href='index.jsp';</script>");
				out.flush();
			} else {
				out.println("<script>alert('로그인에 실패했습니다. 아이디와 비밀번호를 확인해주세요.'); location.href='index.jsp';</script>");
				out.flush();
			}
		}
		if (com.equals("logout.dog")) {
			session.invalidate();
			nextPage = "index.jsp";
		}
		if (com.equals("delete.dog")) {
			Command delete = new Delete();
			String result = delete.execute(request, response);
			if (result.equals("s")) {
				session.invalidate();
				out.println("<script>alert('회원 탈퇴에 성공했습니다.'); location.href='index.jsp';</script>");
				out.flush();
			} else {
				out.println("<script>alert('회원 탈퇴에 실패했습니다. 비밀번호를 확인해주세요.'); location.href='deletemember.jsp';</script>");
				out.flush();
			}
		}
		if (com.equals("edit.dog")) {
			Command edit = new Edit();
			String result = edit.execute(request, response);
			if (result.equals("s")) {
				out.println("<script>alert('회원 정보 수정에 성공했습니다.'); location.href='index.jsp';</script>");
				out.flush();
			} else {
				out.println("<script>alert('회원 정보 수정에 실패했습니다.'); location.href='editmember.jsp';</script>");
				out.flush();
			}
		}
		if (com.equals("upload.dog")) {
			// D:\webWorkspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\GSGS\file
			String saveDir = request.getServletContext().getRealPath("file");
			int maxSize = 5 * 1024 * 1024;
			String encoding = "UTF-8";
			MultipartRequest multi = new MultipartRequest(request, saveDir, maxSize, encoding, new DefaultFileRenamePolicy());
			// 분류, 제목, 작성자, 내용, 이미지(category, title, writer, content, imgpath)
			String category = multi.getParameter("category");
			String board_title = multi.getParameter("board_title");
			MemberDTO memberdto = (MemberDTO) session.getAttribute("memberdto");
			String board_writer = memberdto.getMember_name();
			String board_content = multi.getParameter("board_content");
			String board_imgpath = multi.getFilesystemName("board_imgpath");
			BoardDTO dto = new BoardDTO(category, board_title, board_writer, board_content, board_imgpath);
			BoardDAO dao = new BoardDAO();
			String result = dao.insertBoard(dto);
			if (result.equals("s")) {
				out.println("<script>alert('게시글 등록에 성공했습니다.'); location.href='index.jsp';</script>");
				out.flush();
			} else {
				out.println("<script>alert('게시글 등록에 실패했습니다.');</script>");
				out.flush();
			}
		}
		if (com.equals("bdelete.dog")) {
			Command bdelete = new BoardDelete();
			String result = bdelete.execute(request, response);
			if (result.equals("s")) {
				out.println("<script>alert('게시글 삭제에 성공했습니다.'); location.href='index.jsp';</script>");
				out.flush();
			} else {
				int tnum = ((BoardDTO) session.getAttribute("bdto")).getBoard_num();
				out.println("<script>alert('게시글 삭제에 실패했습니다.'); location.href='boardView.jsp?num=" + tnum + "';</script>");
				out.flush();
			}
		}
		if (com.equals("rgst.dog")) {
			// D:\webWorkspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\GSGS\file
			String saveDir = request.getServletContext().getRealPath("file");
			int maxSize = 5 * 1024 * 1024;
			String encoding = "UTF-8";
			MultipartRequest multi = new MultipartRequest(request, saveDir, maxSize, encoding, new DefaultFileRenamePolicy());
			// getParameter 제목, 품종, 성별, 개월, 기타 내용, 예방접종사항, 사진, 크기, 성격, 생김새, 얼굴형, 다리, 꼬리
			// INSERT INTO rgst VALUES (num, addr, title, writer, wdate, kind, gender, birth, content, prev, imgpath, dogsize, pers, ap1, ap2, ap3, ap4)
			MemberDTO mdto = (MemberDTO) session.getAttribute("memberdto");
			String addr = mdto.getMember_addr();
			String title = multi.getParameter("title");
			String writer = mdto.getMember_name();
			String kind = multi.getParameter("kind");
			String gender = multi.getParameter("gender");
			String birth = multi.getParameter("birth");
			String content = multi.getParameter("content");
			String prev = multi.getParameter("prev");
			String imgpath = multi.getFilesystemName("imgpath");
			String dogsize = multi.getParameter("dogsize");
			String pers = multi.getParameter("pers");
			String ap1 = multi.getParameter("ap1");
			String ap2 = multi.getParameter("ap2");
			String ap3 = multi.getParameter("ap3");
			String ap4 = multi.getParameter("ap4");
			RgstDTO rdto = new RgstDTO(addr, title, writer, kind, gender, birth, content, prev, imgpath, dogsize, pers, ap1, ap2, ap3, ap4);
			RgstDAO rdao = new RgstDAO(); 
			String result = rdao.insert(rdto);
			if (result.equals("s")) {
				out.println("<script>alert('분양 등록에 성공했습니다.'); location.href='rgst.jsp';</script>");
				out.flush();
			} else {
				out.println("<script>alert('분양 등록에 실패했습니다.'); location.href='index.jsp';</script>");
				out.flush();
			}
		}
		
		RequestDispatcher dis = request.getRequestDispatcher(nextPage);
		try {
			dis.forward(request, response);
		} catch (IllegalStateException e) {
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
    
	
}
