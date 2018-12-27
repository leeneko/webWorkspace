<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<% // 쿠키 검색
Cookie[] cook = request.getCookies();

for (int i = 0; i < cook.length; i++) {
	out.print(cook[i].getName() + "<br>");
	out.print(cook[i].getValue() + "<br>");
}
%>
</body>
</html>