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
			<a href="login.html"><button>�α���</button></a>
			<a href="join.html"><button>ȸ������</button></a>
		</c:when>
		<c:otherwise>
			<h2>${sessionScope.name }�� ȯ���մϴ�.</h2>
			<a href=""><button>�������� ����</button></a>
			<a href="LogoutService"><button>�α׾ƿ�</button></a>
		</c:otherwise>
	</c:choose>
</body>
</html>