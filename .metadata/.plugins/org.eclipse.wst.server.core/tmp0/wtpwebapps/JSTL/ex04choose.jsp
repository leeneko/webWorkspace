<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<!-- set태그를 이용해 4가지의 점수의 평균을 구하는 avg값을 선언하시오.(scope : request) -->
	
	<!-- choose태그를 이용해 avg 값을 이용해
		avg 90점 이상 : 차현석님의 학점은 A입니다.
		avg 80점 이상 : 차현석님의 학점은 B입니다.
		avg 70점 이상 : 차현석님의 학점은 C입니다.
		나머지 : 차현석님의 학점은 D입니다.
		
		위와 같이 출력되게 하시오.
	 -->
	
	<c:set var="name" value="${param.name }" scope="request"></c:set>
	<c:set var="java" value="${param.java }" scope="request"></c:set>
	<c:set var="iot" value="${param.iot }" scope="request"></c:set>
	<c:set var="web" value="${param.web }" scope="request"></c:set>
	<c:set var="android" value="${param.android }" scope="request"></c:set>
	
	<c:set var="avg" value="${(java + iot + web + android) / 4 }"></c:set>
	
	<c:choose>
		<c:when test="${avg>=90 }">${name }님의 학점은 A입니다.</c:when>
		<c:when test="${avg>=80 }">${name }님의 학점은 B입니다.</c:when>
		<c:when test="${avg>=70 }">${name }님의 학점은 C입니다.</c:when>
		<c:otherwise>${name }님의 학점은 D입니다.</c:otherwise>
	</c:choose>
</body>
</html>