<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, project.AddressDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	ArrayList<AddressDTO> list = (ArrayList<AddressDTO>) request.getAttribute("list");
%>
	<table border="1px">
		<tr>
			<td>����</td>
			<td>�̸�</td>
			<td>����</td>
			<td>��ȭ��ȣ</td>
		</tr>
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