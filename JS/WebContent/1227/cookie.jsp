<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	Cookie cookie = new Cookie("id", "pbk");
	response.addCookie(cookie);
%>
${cookie.id }<br>
${cookie.id.name }<br>
${cookie.id.value }<br>
</body>
</html>