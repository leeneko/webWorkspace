<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<% pageContext.setAttribute("num", 38); %>
<% request.setAttribute("num", 123); %>
<% session.setAttribute("num", 500); %>
${sessionScope.num+500 }<br>
${pageContextScope.num > 1000 }<br>
${num eq 38 }<br>
${num ne 37 }<br>
${empty num }<br>
${not empty num }<br>
${37 gt 36 && 38 lt 36 }<br>
${37 ge 36 or 38 le 36 }<br>
</body>
</html>