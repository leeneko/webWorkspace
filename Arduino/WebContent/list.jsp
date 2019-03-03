<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sun.xml.internal.bind.v2.schemagen.xmlschema.List"%>
<%@page import="com.VO"%>
<%@page import="com.DAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문목록</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		DAO dao = new DAO();
		ArrayList<VO> li = new ArrayList<VO>();
		li = dao.selectAll();
		PrintWriter pw = response.getWriter();
	%>
	<table width="100%" border="1px solid black">
		<tr>
			<td>주문번호</td>
			<td>술 이름</td>
			<td>재료 1</td>
			<td>비율 1</td>
			<td>재료 2</td>
			<td>비율 2</td>
			<td>재료 3</td>
			<td>비율 3</td>
			<td>제조 여부</td>
		</tr>
		<%
			for (int i = 0; i < li.size(); i++) {
		%>
		<tr> 
			<td><%= li.get(i).getOrderNum() %></td>
			<td><%= li.get(i).getName() %></td>
			<td><%= li.get(i).getType1() %></td>
			<td><%= li.get(i).getRate1() %></td>
			<td><%= li.get(i).getType2() %></td>
			<td><%= li.get(i).getRate2() %></td>
			<td><%= li.get(i).getType3() %></td>
			<td><%= li.get(i).getRate3() %></td>
			<td><%= li.get(i).getIo() %></td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>