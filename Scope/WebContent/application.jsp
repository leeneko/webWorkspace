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
	if (application.getAttribute("num") == null) {
		application.setAttribute("num", "1");
	} else {
		String num = (String) application.getAttribute("num");
		int parseNum = Integer.parseInt(num);
		parseNum++;
		application.setAttribute("num", parseNum + "");
	}
%>
	오늘의 방문자 수 : <%= application.getAttribute("num") %>
</body>
</html>