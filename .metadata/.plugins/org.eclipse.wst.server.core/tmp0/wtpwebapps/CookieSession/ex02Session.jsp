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
	String id = (String) session.getAttribute("id"); // Object값을 가져옴, 따라서 형변환 필요
%>
접속한 사람의 아이디 : <%= id %>
</body>
</html>