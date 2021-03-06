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
<%-- set태그 : 영역에 값을 저장 --%>
<%
	request.setAttribute("key", "value");
//	session.setAttribute(arg0, arg1);
//	application.setAttribute(name, object);
%>
<c:set var="key" value="value" scope="request"></c:set>
${requestScope.key }

<%-- remove태그 : 영역에 있는 값을 삭제 --%>
<c:remove var="key" scope="request"/>

<%-- if태그 : 단일 조건(if~else 불가) --%>
<c:set var="num1" value="55" scope="request"></c:set>
<c:set var="num2" value="5" scope="request"></c:set>
<br>
<c:if test="${num1 > num2 }">num1이 더 큰 값입니다.</c:if>

<f:parseNumber var="i" type="Number" value="${num1 }"></f:parseNumber>
<f:parseNumber var="j" type="Number" value="${num2 }"></f:parseNumber>

<br>${i>j }

<br>
<%-- choose태그 : 여러가지 조건을 검사(switch) --%>
<c:choose>
	<c:when test="${num1>50 }">
		num1은 50보다 큽니다.
	</c:when>
	<c:when test="${num1>40 }">
		num1은 40보다 큽니다.
	</c:when>
	<c:otherwise>
		num1은 작습니다.
	</c:otherwise>
</c:choose>

<br>
<%-- foreach : 반복문 --%>
<c:forEach begin="0" end="10" var="i" step="3">
	${i }<br>
</c:forEach>

<br>
<%-- 배열 반복문 --%>
<%
	ArrayList<String> arr = new ArrayList<String>();
	arr.add("박종진");
	arr.add("임창환");
	arr.add("봉수연");
	request.setAttribute("arr", arr);
%>
<c:forEach items="${arr }" var="i">
	${i }
</c:forEach>

<br>
<%-- forTokens태그 : 특정문자열을 기준으로 배열에 값을 담아서 출력 --%>
<c:set var="str" value="차현석 박종진 김선민"></c:set>
<c:forTokens items="${str }" delims=" " var="i">
	${i }
</c:forTokens>

<br>
<%-- catch태그 : 예외처리 --%>
<c:catch var="k">
	<%=2/0 %>
</c:catch>

<br>
<%-- out태그 : 출력 --%>
<c:out value="${k }" default="오류가 없습니다."></c:out>

</body>
</html>