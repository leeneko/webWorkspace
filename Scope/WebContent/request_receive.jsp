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
	String id = (String) request.getAttribute("id");
	String pw = (String) request.getAttribute("pw");
	
	out.print("request���� �Ѿ�� ID : " + id);
	out.print("<br>request���� �Ѿ�� PW : " + pw);
%>
</body>
</html>