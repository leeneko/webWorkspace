<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<% // 쿠키 삭제
	Cookie cook = new Cookie("id", "");
	cook.setMaxAge(-1); // 삭제 안됨, 혹은 초 단위
%>
</body>
</html>