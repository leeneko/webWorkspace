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
	
		Cookie cook = new Cookie("id", id); // 쿠기 객체 생성 new Cookie(key, value);
		response.addCookie(cook); // Client 측에 쿠키 저장
	%>
</body>
</html>