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
%>
	�̸� : ${param.name }<br>
	���� : ${param.age }<br>
	���� : ${param.gender }<br>
	��� : ${paramValues.sports[0] } ${paramValues.sports[1] } ${paramValues.sports[2] }<br>
</body>
</html>