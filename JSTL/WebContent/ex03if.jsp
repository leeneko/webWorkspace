<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<c:set var="num1" value="${param.num1 }" scope="request"></c:set>
<c:set var="num2" value="${param.num2 }" scope="request"></c:set>
<c:if test="${(num1 + num2) % 2 == 0 }">¦��</c:if>
<c:if test="${(num1 + num2) % 2 == 1 }">Ȧ��</c:if>
</body>
</html>
