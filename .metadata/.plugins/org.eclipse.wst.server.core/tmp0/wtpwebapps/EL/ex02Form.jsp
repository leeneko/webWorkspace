<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%--
	String id = request.getParameter("id");
	String address = request.getParameter("address");

	ID : <%= id %> Address : <%= address %>
--%>
<%--
	EL : ${}
	Form : ${param. }
 --%>
ID : ${param.id } Address : ${param.address }<br>
Hobby : ${paramValues.hobby[0] } ${paramValues.hobby[1] } ${paramValues.hobby[2] }
</body>
</html>