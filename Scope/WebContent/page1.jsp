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
	pageContext.setAttribute("page", "pageOK");
	request.setAttribute("req", "requestOK");
	session.setAttribute("session", "sessionOK");
	application.setAttribute("app", "applicationOK");
	
	RequestDispatcher ris = request.getRequestDispatcher("page2.jsp");
	ris.forward(request, response);
%>

<%= pageContext.getAttribute("page") %><br>
<%= request.getAttribute("req") %><br>
<%= session.getAttribute("session") %><br>
<%= application.getAttribute("app") %><br>
</body>
</html>