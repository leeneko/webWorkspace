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
	
	// RequestDispacher ��ü�� �ϴ� ���� ���� �������� request/response ������ ������������ �Ѱ���
	RequestDispatcher dis = request.getRequestDispatcher("request_receive.jsp"); 
	dis.forward(request, response);
%>
</body>
</html>