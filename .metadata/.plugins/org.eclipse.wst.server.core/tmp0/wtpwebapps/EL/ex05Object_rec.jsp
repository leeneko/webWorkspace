<%@page import="com.dto.MemberDTO"%>
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
<%
	MemberDTO dto = (MemberDTO) session.getAttribute("dto");
%>
<%=dto.getEmail() %>
--%>
${dto.getEmail() }
${dto.getPw() }
${dto.getTel() }
${dto.getAddress() }
</body>
</html>