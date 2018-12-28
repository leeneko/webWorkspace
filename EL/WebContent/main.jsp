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
		<c:when test="${sessionScope.dto == null }">
			<a href="login.html"><button>로그인</button></a>
			<a href="join.html"><button>회원가입</button></a>
		</c:when>
		<c:otherwise>
			<h2>${sessionScope.name }님 환영합니다.</h2>
			<a href=""><button>개인정보 수정</button></a>
			<a href="LogoutService"><button>로그아웃</button></a>
		</c:otherwise>
	</c:choose>
</body>
</html>