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
	response.sendRedirect와 같음
--%>

<%--
<%@ include file="ex01.jsp" %>
<c:import url="https://www.daum.net"></c:import>
include : 내부 페이지만 가능
import : 내부, 외부 가능
--%>

<c:url value="https://search.daum.net/search?" var="daum">
	<c:param name="q" value="이동국"></c:param>
</c:url>
<c:redirect url="${daum }"></c:redirect>
</body>
</html>