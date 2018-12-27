<%@page import="javax.websocket.SendResult"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("EUC-KR");
	response.setCharacterEncoding("EUC-KR");
	
	String id = "user";
	String pw = "1234";
	
	String input_id = request.getParameter("id");
	String input_pw = request.getParameter("pw");

	if (id.equals(input_id) && pw.equals(input_pw)) {
		// query string 방식
		session.setAttribute("id", input_id);
		response.sendRedirect("181213main.jsp");
	} else {
		// System.out.println("로그인 실패");
		response.sendRedirect("181213ex01.jsp");
	}
%>
</body>
</html>