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
//	Cookie[] cook = request.getCookies();
//	for (int i = 0; i < cook.length; i++) {
//		out.print(cook[i]);
//	}
%>
	${cookie.cook.value }
</body>
</html>