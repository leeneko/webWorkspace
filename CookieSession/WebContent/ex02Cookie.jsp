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
		String id = request.getParameter("id");
	
		Cookie cook = new Cookie("id", id); // ��� ��ü ���� new Cookie(key, value);
		response.addCookie(cook); // Client ���� ��Ű ����
	%>
</body>
</html>