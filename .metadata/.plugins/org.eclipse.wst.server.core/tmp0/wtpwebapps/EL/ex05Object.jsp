<%@page import="com.dto.MemberDTO"%>
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
	MemberDTO dto = new MemberDTO("hot@naver.com", "1234", "010", "����");

	session.setAttribute("dto", dto);
%>
</body>
</html>