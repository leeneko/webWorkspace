<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("EUC-KR");
	String id = (String) session.getAttribute("id");
	if (session.getAttribute("id") == null) { // �α��ο� ������ ����
		System.out.println("�α��� ����");
		PrintWriter script = response.getWriter();
		script.print("<script>");
		script.print("alert('���� �α����� �Ǿ����� �ʽ��ϴ�.');");
		script.print("location.href='index.jsp';");
		script.print("</script>");
		script.close();
	} else {
		System.out.println(id + "���� �α����ϼ̽��ϴ�.");
	}
%>
	<form method="post" action="logout">
		<input type="submit" value="�α׾ƿ�" class="logoutButton">
	</form>
</body>
</html>