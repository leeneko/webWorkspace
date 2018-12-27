<%@page import="com.member.MemberDAO, com.member.MemberDTO, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Forty by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="assets/css/main.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		
	</head>
	<style>
	
	</style>
	<body style="text-align: center;">

			<div id="wrapper">
					<nav id="Update">	
						<table>
							<caption><h2>회원관리페이지</h2></caption>
							<tr>
								<td>Email</td>
								<td>HP</td>
								<td>Addr</td>
								<td></td>					
							</tr>
							<%
								MemberDAO dao = new MemberDAO();
								ArrayList<MemberDTO> list = dao.selectAllMember();
								request.setAttribute("list", list);
//								for (int i = 0; i < list.size(); i++) {
//									out.print("<tr>");
//									out.print("<td>" + list.get(i).getEmail() + "</td>");
//									out.print("<td>" + list.get(i).getTel() + "</td>");
//									out.print("<td>" + list.get(i).getAddress() + "</td>");
//									out.print("<td><a href='DeleteCon?email=" + list.get(i).getEmail() + "'>삭제</a></td>");
//									out.print("</tr>");
//								}
							%>
							
							<c:forEach items="${list }" var="i">
								<tr>
									<td>${i.getEmail() }</td>
									<td>${i.getTel() }</td>
									<td>${i.getAddress() }</td>
									<td><a href="Delete.do?email=${i.getEmail() }">삭제</a></td>
								</tr>
							</c:forEach>
						</table>
					</nav>			
			</div>
		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="assets/js/main.js"></script>
	</body>
</html>

