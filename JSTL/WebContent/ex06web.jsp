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
	<c:redirect url="http://www.naver.com"></c:redirect>
	response.sendRedirect�� ����
--%>

<%--
<%@ include file="ex01.jsp" %>
<c:import url="https://www.daum.net"></c:import>
include : ���� �������� ����
import : ����, �ܺ� ����
--%>

<c:url value="https://search.daum.net/search?" var="daum">
	<c:param name="q" value="�̵���"></c:param>
</c:url>
<c:redirect url="${daum }"></c:redirect>
</body>
</html>