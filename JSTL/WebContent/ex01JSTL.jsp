<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%-- set�±� : ������ ���� ���� --%>
<%
	request.setAttribute("key", "value");
//	session.setAttribute(arg0, arg1);
//	application.setAttribute(name, object);
%>
<c:set var="key" value="value" scope="request"></c:set>
${requestScope.key }

<%-- remove�±� : ������ �ִ� ���� ���� --%>
<c:remove var="key" scope="request"/>

<%-- if�±� : ���� ����(if~else �Ұ�) --%>
<c:set var="num1" value="55" scope="request"></c:set>
<c:set var="num2" value="5" scope="request"></c:set>
<br>
<c:if test="${num1 > num2 }">num1�� �� ū ���Դϴ�.</c:if>

<f:parseNumber var="i" type="Number" value="${num1 }"></f:parseNumber>
<f:parseNumber var="j" type="Number" value="${num2 }"></f:parseNumber>

<br>${i>j }

<br>
<%-- choose�±� : �������� ������ �˻�(switch) --%>
<c:choose>
	<c:when test="${num1>50 }">
		num1�� 50���� Ů�ϴ�.
	</c:when>
	<c:when test="${num1>40 }">
		num1�� 40���� Ů�ϴ�.
	</c:when>
	<c:otherwise>
		num1�� �۽��ϴ�.
	</c:otherwise>
</c:choose>

<br>
<%-- foreach : �ݺ��� --%>
<c:forEach begin="0" end="10" var="i" step="3">
	${i }<br>
</c:forEach>

<br>
<%-- �迭 �ݺ��� --%>
<%
	ArrayList<String> arr = new ArrayList<String>();
	arr.add("������");
	arr.add("��âȯ");
	arr.add("������");
	request.setAttribute("arr", arr);
%>
<c:forEach items="${arr }" var="i">
	${i }
</c:forEach>

<br>
<%-- forTokens�±� : Ư�����ڿ��� �������� �迭�� ���� ��Ƽ� ��� --%>
<c:set var="str" value="������ ������ �輱��"></c:set>
<c:forTokens items="${str }" delims=" " var="i">
	${i }
</c:forTokens>

<br>
<%-- catch�±� : ����ó�� --%>
<c:catch var="k">
	<%=2/0 %>
</c:catch>

<br>
<%-- out�±� : ��� --%>
<c:out value="${k }" default="������ �����ϴ�."></c:out>

</body>
</html>