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
	request.setCharacterEncoding("EUC-KR");
	
	String name = request.getParameter("name");
	String[] selects = request.getParameterValues("fruit");
%>
<table border="1px solid black">
	<tr align="center">
		<td>
			�̸�
		</td>
		<td>
			<%= name %>
		</td>
	</tr>
	<tr>
		<td>
			�����ϴ� ����
		</td>
		<td>
			<%
				for (int i = 0; i < selects.length; i++) {
					out.print(selects[i] + " ");
				}
			%>
		</td>
	</tr>
</table>	

</body>
</html>