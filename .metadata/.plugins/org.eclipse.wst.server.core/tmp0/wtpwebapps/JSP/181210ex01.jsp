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
		int result = 0;
		for (int i = 1; i <= 100; i++) {
			result += i;
		}
	%>
	<h2>1~100까지의 합은 <%= result %> 입니다.</h2>
</body>
</html>