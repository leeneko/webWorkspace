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
	list.add("��ġ");
	list.add("����");
	list.add("�췰");
	list.add("����");
	list.add("�Ҷ�");
	request.setAttribute("list", list);
%>
	<c:forEach var="item" items="${list }">
		${item }
	</c:forEach>
</body>
</html>