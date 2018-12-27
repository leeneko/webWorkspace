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
	if (session.getAttribute("id") == null) { // 로그인에 실패한 상태
		System.out.println("로그인 실패");
		PrintWriter script = response.getWriter();
		script.print("<script>");
		script.print("alert('현재 로그인이 되어있지 않습니다.');");
		script.print("location.href='index.jsp';");
		script.print("</script>");
		script.close();
	} else {
		System.out.println(id + "님이 로그인하셨습니다.");
	}
%>
	<form method="post" action="logout">
		<input type="submit" value="로그아웃" class="logoutButton">
	</form>
</body>
</html>