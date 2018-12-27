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
	영역을 확실하게 지정해주는 것을 추천 ${requestScope.key }
 --%>
req영역 : ${requestScope.req }<br>
ses영역 : ${sessionScope.ses }<br>
app영역 : ${applicationScope.app }
</body>
</html>