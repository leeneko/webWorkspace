<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<!-- 검색한 사이트와 검색할 단어를 출력하시오.(choose/url/redirect) -->
	<c:choose>
		<c:when test="${param.site=='daum' }">
			<c:url value="https://search.daum.net/search?" var="daum">
				<c:param name="q" value="${param.search }"></c:param>
			</c:url>
			<c:redirect url="${daum }"></c:redirect>
		</c:when>
		<c:when test="${param.site=='google' }">
			<c:url value="https://www.google.com/search?" var="google">
				<c:param name="q" value="${param.search }"></c:param>
			</c:url>
			<c:redirect url="${google }"></c:redirect>
		</c:when>
	</c:choose>	
</body>
</html>