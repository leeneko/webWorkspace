<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.io.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%@ page import="com.project.MemberDTO" %>
<%
	request.setCharacterEncoding("EUC-KR");
	ArrayList<MemberDTO> list = (ArrayList<MemberDTO>) session.getAttribute("list");
%>
<table border="1px solid black">
	<tr><td>순서</td><td>이름</td><td>나이</td><td>전화번호</td></tr>
<%
	for (int i = 0; i < list.size(); i++) {
		out.print("<tr>");
		
		out.print("<td>" + i + "</td>");
		out.print("<td>" + list.get(i).getName() + "</td>");
		out.print("<td>" + list.get(i).getAge() + "</td>");
		out.print("<td>" + list.get(i).getTell() + "</td>");
		
		out.print("</tr>");
	}
%>
</table>
</body>
</html>