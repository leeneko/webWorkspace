<%@page import="java.util.ArrayList"%>
<%@page import="com.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table width="100%" border="1px">
		<tr align='center'>
			<td>글번호</td>
			<td>작성자</td>
			<td>제목</td>
			<td>작성일시</td>
			<td>첨부파일</td>
		</tr>
<%
	FileDAO dao = new FileDAO();
	ArrayList<FileDTO> list = dao.selectAll();
	for (int i = 0; i < list.size(); i++) {
		out.print("<tr align='center'>");
		// bnum.nextval, writer, title, content, fileName, sysdate
		out.print("<td>" + list.get(i).getNum() + "</td>");
		out.print("<td>" + list.get(i).getWritter() + "</td>");
		out.print("<td width='40%'><a href='select?num=" + list.get(i).getNum() + "'>" + list.get(i).getTitle() + "</a></td>");
		// out.print("<td>" + list.get(i).getContent() + "</td>");
		out.print("<td>" + list.get(i).getSendate() + "</td>");
		if (list.get(i).getFileName() != null) {
			out.print("<td>o</td>");
		} else {
			out.print("<td></td>");
		}
		out.print("</tr>");
	}
%>
	</table>
</body>
</html>