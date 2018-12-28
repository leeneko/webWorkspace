<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%--
	<c:forEach var="i" begin="1" end="10" step="1">
		${i }
	</c:forEach>
--%>
<%
	ArrayList<String> list = new ArrayList<String>();
	list.add("참치");
	list.add("광어");
	list.add("우럭");
	list.add("광어");
	list.add("소라");
	request.setAttribute("list", list);
%>
	<c:forEach var="item" items="${list }">
		${item }
	</c:forEach>
</body>
</html>