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
//	String req = (String) request.getAttribute("req");
//	String ses = (String) session.getAttribute("session");
//	String app = (String) application.getAttribute("application");
%>
<%--
	Scope : ${key };
	������ Ȯ���ϰ� �������ִ� ���� ��õ ${requestScope.key }
 --%>
req���� : ${requestScope.req }<br>
ses���� : ${sessionScope.ses }<br>
app���� : ${applicationScope.app }
</body>
</html>