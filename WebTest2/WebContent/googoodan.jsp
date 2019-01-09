<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	String temp = request.getParameter("dan");
	int dan = Integer.parseInt(temp);
%>
	<table border="1px black solid">
		<tr align="center">
			<td colspan="9"><%= dan %>단</td>
		</tr>
		<tr>
		<% for (int i = 1; i <= 9; i++) { %>
			<td><%= dan %>*<%=i %>=<% out.print(dan*i); %></td>
		<% } %>
		</tr>
	</table>
</body>
</html>