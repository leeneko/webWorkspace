<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<!-- set�±׸� �̿��� 4������ ������ ����� ���ϴ� avg���� �����Ͻÿ�.(scope : request) -->
	
	<!-- choose�±׸� �̿��� avg ���� �̿���
		avg 90�� �̻� : ���������� ������ A�Դϴ�.
		avg 80�� �̻� : ���������� ������ B�Դϴ�.
		avg 70�� �̻� : ���������� ������ C�Դϴ�.
		������ : ���������� ������ D�Դϴ�.
		
		���� ���� ��µǰ� �Ͻÿ�.
	 -->
	
	<c:set var="name" value="${param.name }" scope="request"></c:set>
	<c:set var="java" value="${param.java }" scope="request"></c:set>
	<c:set var="iot" value="${param.iot }" scope="request"></c:set>
	<c:set var="web" value="${param.web }" scope="request"></c:set>
	<c:set var="android" value="${param.android }" scope="request"></c:set>
	
	<c:set var="avg" value="${(java + iot + web + android) / 4 }"></c:set>
	
	<c:choose>
		<c:when test="${avg>=90 }">${name }���� ������ A�Դϴ�.</c:when>
		<c:when test="${avg>=80 }">${name }���� ������ B�Դϴ�.</c:when>
		<c:when test="${avg>=70 }">${name }���� ������ C�Դϴ�.</c:when>
		<c:otherwise>${name }���� ������ D�Դϴ�.</c:otherwise>
	</c:choose>
</body>
</html>