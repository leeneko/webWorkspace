<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" import="com.FileDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<table border="1px" width="100%">
<%
	//num, writer, title, content, filename, sendate
	FileDTO dto = (FileDTO) request.getAttribute("dto");
%>
	<tr>
		<td>��ȣ</td>
		<td><%= dto.getNum() %></td>
	</tr>
	<tr>
		<td>�ۼ���</td>
		<td><%= dto.getWritter() %></td>
	</tr>
	<tr>
		<td>����</td>
		<td><%=dto.getTitle() %></td>
	</tr>
	<tr>
		<td>����</td>
		<td><%= dto.getContent() %></td>
	</tr>
	<tr>
		<td>����</td>
		<td><img src="file/<%= dto.getFileName() %>" alt="�̹����� �����ϴ�"></td>
	</tr>
<%--
if(dto.getFileName() != null) {
	out.print("<tr><td>���ϸ�</td><td>" + dto.getFileName() + "</td></tr>");
	String fileName = "\\" + dto.getFileName();
	int subs = dto.getFileName().length() - 3;
	int sube = dto.getFileName().length();
	String extension = dto.getFileName().substring(subs, sube);
	
	if(extension.equals("jpg") || extension.equals("png")) {
		out.print("<tr><td>����</td>");
//		out.print("<td><img src='" + saveDir + "'></td>");
		out.print("<td><img src='file/" + dto.getFileName() + "'></td>");
		out.print("</tr>");
	}
}
--%>
	<tr>
		<td>������¥</td>
		<td><%= dto.getSendate() %></td>
	</tr>
</table>

</body>
</html>