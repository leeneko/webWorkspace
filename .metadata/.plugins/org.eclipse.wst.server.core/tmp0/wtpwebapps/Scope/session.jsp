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
	if (session.getAttribute("num")==null) {
		session.setAttribute("num", "1");
	} else {
		int num = Integer.parseInt((String) session.getAttribute("num"));
		num++;
		session.setAttribute("num", num + "");
	}
	out.print(session.getAttribute("num"));
%>
</body>
</html>