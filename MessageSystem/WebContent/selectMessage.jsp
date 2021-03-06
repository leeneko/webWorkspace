<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" import="java.util.*, com.message.MessageDAO, com.message.MessageDTO"%>
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

		<!-- Wrapper -->
			<div id="wrapper">
				<!-- Menu -->
					<nav id="Update">	
						<table>
							<caption><h2>메세지관리페이지</h2></caption>
							<tr>
								<td>Num</td>
								<td>Send Name</td>
								<td>Receive Email</td>
								<td>Content</td>
								<td>date</td>						
							</tr>
							<%
								MessageDAO dao = new MessageDAO();
								ArrayList<MessageDTO> list = dao.selectAllMessage();
								request.setAttribute("list", list);

//								for (int i = 0; i < list.size(); i++) {
//									out.print("<tr>");
//									out.print("<td>" + list.get(i).getNum() + "</td>");
//									out.print("<td>" + list.get(i).getName() + "</td>");
//									out.print("<td>" + list.get(i).getEmail() + "</td>");
//									out.print("<td>" + list.get(i).getContent() + "</td>");
//									out.print("<td>" + list.get(i).getDate() + "</td>");
//									out.print("</tr>");
//								}
							%>
							
							<c:forEach items="${list }" var="i">
								<tr>
									<td>${i.getNum() }</td>
									<td>${i.getName() }</td>
									<td>${i.getEmail() }</td>
									<td>${i.getContent() }</td>
									<td>${i.getDate() }</td>
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

