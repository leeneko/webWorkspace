<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<c:forEach var="li" items="${requestScope.list }">
	<font>이름 : </font>${li.name }<br>
	<font>나이 : </font>${li.age }<br>
	<font>전화번호 : </font>${li.tel }<br>
	<br>
</c:forEach>

</body>
</html>