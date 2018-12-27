<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2>page2 입니다</h2>
<%= pageContext.getAttribute("page") %><br>
<%= request.getAttribute("req") %><br>
<%= session.getAttribute("session") %><br>
<%= application.getAttribute("app") %><br>
</body>
</html>