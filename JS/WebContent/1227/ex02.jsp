<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<c:set var="num" value="100" scope="session" />
	<c:out value="${sessionScope.num }" />
	<c:set var="num2" value="${num+50 }" />
	
	<br>
	<c:if test="${num > 50 }">
		��
	</c:if>
	
	<br>
	<c:choose>
		<c:when test="${test > 100 }">
			100 �̻��Դϴ�.
		</c:when>
		<c:when test="${test > 50 }">
			100 �̸� 50 �̻��Դϴ�.
		</c:when>
		<c:otherwise>
			50 �̸��Դϴ�.
		</c:otherwise>
	</c:choose>
</body>
</html>