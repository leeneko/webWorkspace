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
	request.setAttribute("id", "jason");
	request.setAttribute("pw", "1234");
	
	// RequestDispacher 객체가 하는 일은 현재 페이지의 request/response 영역을 다음페이지로 넘겨줌
	RequestDispatcher dis = request.getRequestDispatcher("request_receive.jsp"); 
	dis.forward(request, response);
%>
</body>
</html>