<%@page import="com.BookDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="myCSS.css"> 
</head>
<body>
<%
	request.setCharacterEncoding("EUC-KR");
	response.setCharacterEncoding("EUC-KR");

	BookDTO dto = (BookDTO) request.getAttribute("dto");
	session.setAttribute("dto", dto);
%>
	<div>
		<!-- EL,JSTL을 활용할 것. -->
		<fieldset>
			<legend><h1>${ sessionScope.dto.getId() }님 환영합니다</h1></legend>
			<c:choose>
				<c:when test="${ sessionScope.dto.getNick() == 'admin' }">
					<button>회원관리</button>
					<button>도서관리</button>
					<button>대여현황</button>
					<button>재고관리</button>
				</c:when>
				<c:otherwise>
           			<button>회원관리</button>
          			<button>도서관리</button>
            		<button>대여현황</button>
            		<button>재고관리</button>
				</c:otherwise>
			</c:choose>
		</fieldset>
	</div>
</body>
</html>