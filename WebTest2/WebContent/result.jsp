<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<c:choose>
	<c:when test="${cookie.id.value != null }">
		<h1>${cookie.id.value }�� ȯ���մϴ�.</h1>
	</c:when>
	<c:otherwise>
		<h1>�α��ο� ���� �߽��ϴ�.</h1>
	</c:otherwise>
</c:choose>

</body>
</html>