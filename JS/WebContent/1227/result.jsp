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
	이름 : ${param.name }<br>
	나이 : ${param.age }<br>
	성별 : ${param.gender }<br>
	취미 : ${paramValues.sports[0] } ${paramValues.sports[1] } ${paramValues.sports[2] }<br>
</body>
</html>