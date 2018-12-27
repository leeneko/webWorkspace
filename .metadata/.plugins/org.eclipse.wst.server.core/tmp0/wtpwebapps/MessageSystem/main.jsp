<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="com.message.MessageDAO, com.message.MessageDTO, java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<body>
<%
String email = (String) session.getAttribute("email");
String tel = (String) session.getAttribute("tel");
String address = (String) session.getAttribute("address");
%>
	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<header id="header" class="alt"> <a href="index.html" class="logo"><strong>
		<%
			if (application.getAttribute("num") == null) {
				application.setAttribute("num", 1);
			} else {
				int num = 0;
				num = (Integer) application.getAttribute("num");
				application.setAttribute("num", num+1);
				out.print("���� �湮�� �� : " + num);
			}
		%>
		</strong></a>
		<nav>
		
		<c:choose>
			<c:when test="${empty email }">
				<a href='#menu'>�α���</a>
			</c:when>
			<c:otherwise>
				<a href='update.jsp'>������������</a>
				<c:choose>
					<c:when test="${email=='������' }">
						<a href='selectMember.jsp'>��üȸ������</a>
						<a href='selectMessage.jsp'>��ü�޼�������</a>
					</c:when>
				</c:choose>
				<a href='Logout.do'>�α׾ƿ�</a>
			</c:otherwise>
		</c:choose>
		</nav>
		</header>

		<!-- Menu -->
		<nav id="menu">
		<form action="Login.do" method="post">
			<ul class="links">
				<li><h5>�α���</h5></li>
				<li><input type="text" name="email" placeholder="Email�� �Է��ϼ���"></li>
				<li><input type="password" name="pw" placeholder="PW�� �Է��ϼ���"></li>
				<li><input type="submit" value="LogIn" class="button fit"></li>
			</ul>
		</form>
		<form action="Join.do" method="post">
			<ul class="actions vertical">
				<li><h5>ȸ������</h5></li>
				<li><input type="text" name="email" placeholder="Email�� �Է��ϼ���"></li>
				<li><input type="password" name="pw" placeholder="PW�� �Է��ϼ���"></li>
				<li><input type="text" name="tel" placeholder="��ȭ��ȣ�� �Է��ϼ���"></li>
				<li><input type="text" name="address" placeholder="���ּҸ� �Է��ϼ���"></li>
				<li><input type="submit" value="JoinUs" class="button fit"></li>
			</ul>
		</form>
		</nav>
		<!-- Banner -->
		<section id="banner" class="major">
		<div class="inner">
			<header class="major">
				<c:choose>
					<c:when test="${empty email }">
						<h1>�α��� �� ���Ǿ��̵� ������ּ���</h1>
					</c:when>
					<c:otherwise>
						<h1>${email }�� ������ ȯ���մϴ�.</h1>
					</c:otherwise>
				</c:choose>
			</header>
			<div class="content">
				<p>
					�Ʒ��� ���ݱ��� ��� �� ������Դϴ�.<br>
				</p>
				<ul class="actions">
					<li><a href="#one" class="button next scrolly">Ȯ���ϱ�</a></li>
				</ul>
			</div>
		</div>
		</section>

		<!-- Main -->
		<div id="main">

			<!-- One -->
			<section id="one" class="tiles"> <article> <span
				class="image"> <img src="images/pic01.jpg" alt="" />
			</span> <header class="major">
			<h3>
				<a href="#" class="link">HTML</a>
			</h3>
			<p>Ȩ�������� ����� ���� ���</p>
			</header> </article> <article> <span class="image"> <img
				src="images/pic02.jpg" alt="" />
			</span> <header class="major">
			<h3>
				<a href="#" class="link">CSS</a>
			</h3>
			<p>HTML�� ���������ִ� ���</p>
			</header> </article> <article> <span class="image"> <img
				src="images/pic03.jpg" alt="" />
			</span> <header class="major">
			<h3>
				<a href="#" class="link">Servlet/JSP</a>
			</h3>
			<p>Java�� �⺻���� �� �� ���α׷��� ���/��ũ��Ʈ ���</p>
			</header> </article> <article> <span class="image"> <img
				src="images/pic04.jpg" alt="" />
			</span> <header class="major">
			<h3>
				<a href="#" class="link">JavaScript</a>
			</h3>
			<p>HTML�� �⺻���� ������ ������ �� �ִ� ���</p>
			</header> </article> <article> <span class="image"> <img
				src="images/pic05.jpg" alt="" />
			</span> <header class="major">
			<h3>
				<a href="#" class="link">MVC</a>
			</h3>
			<p>�� ������Ʈ �� ���� ���� ����ϴ� ����������</p>
			</header> </article> <article> <span class="image"> <img
				src="images/pic06.jpg" alt="" />
			</span> <header class="major">
			<h3>
				<a href="#" class="link">Web Project</a>
			</h3>
			<p>�������� ����������Ʈ�� �� ����� Ȱ���ϼ���!</p>
			</header> </article> </section>
			<!-- Two -->
			<section id="two">
			<div class="inner">
				<header class="major">
				<h2>������ �� �޼��� Ȯ���ϱ�</h2>
				</header>
				<p></p>
				<ul class="actions">
					<%
						if (email == null) {
							out.print("<li>�α����� ���ּ���.</li>");
						} else {
							MessageDAO dao = new MessageDAO();
							ArrayList<MessageDTO> list = dao.messageSelect(email);
							request.setAttribute("list", list);
//							for (int i = 0; i < list.size(); i++) {
//								out.print("<li>" + (i + 1) + " ");
//								out.print(list.get(i).getContent() + " ");
//								out.print(list.get(i).getName() + " ");
//								out.print(list.get(i).getDate() + " ");
//								out.print("<li><a href='MessageDeleteCon?num=" + list.get(i).getNum() + "'>����</a></li>");
//								out.print("</li><br>");
//							}
//							out.print("<li><a href='MessageAllDeleteCon?email=" + email + "' class='button next scrolly'>��ü�����ϱ�</a></li>");
						}
					%>
					<c:choose>
						<c:when test="${empty email }">
							<li>�α����� ���ּ���.</li>
						</c:when>
						<c:otherwise>
							<c:forEach items="${list }" var="i">
								<li>${i.getName() }</li>
								<li>${i.getEmail() }</li>
								<li>${i.getContent() }</li>
								<li>${i.getDate() }</li>
								<li><a href='MessageDelete.do?num=${i.getNum() }'>����</a></li>
								<br>
							</c:forEach>
							<li><a href='MessageAllDelete.do?email=${email }' class='button next scrolly'>��ü�����ϱ�</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
			</section>

		</div>

		<!-- Contact -->
		<section id="contact">
		<div class="inner">
			<section>
				<form method="post" action="MessageSend.do">
					<div class="field half first">
						<label for="name">From</label> <input name="name" type="text" id="name" placeholder="������ ��� �̸���" value="<% if(email!=null) { out.print(email); } %>" disabled />
					</div>
					<div class="field half">
						<label for="email">To Email</label> <input name="email" type="text" id="email" placeholder="�޴� ��� �̸���" />
					</div>
	
					<div class="field">
						<label for="message">Message</label>
						<textarea name="content" id="message" rows="6"></textarea>
					</div>
					<ul class="actions">
						<li><input type="submit" value="Send Message" class="special" /></li>
						<li><input type="reset" value="Clear" /></li>
					</ul>
				</form>
			</section>
			<section class="split">
				<section>
					<div class="contact-method">
						<span class="icon alt fa-envelope"></span>
						<h3>Email</h3>
						<c:choose>
							<c:when test="${empty email }">
								<a href='#'>�α��� �� ����� �̸����� ���</a>
							</c:when>
							<c:otherwise>
								<a href='#'>${email }</a>
							</c:otherwise>
						</c:choose>
					</div>
					
				</section>
				<section>
					<div class="contact-method">
						<span class="icon alt fa-phone"></span>
						<h3>Phone</h3>
						<c:choose>
							<c:when test="${empty tel }">
								<a href='#'>�α��� �� ����� ��ȭ��ȣ�� ���</a>
							</c:when>
							<c:otherwise>
								<a href='#'>${tel }</a>
							</c:otherwise>
						</c:choose>
					</div>
				</section>
				<section>
					<div class="contact-method">
						<span class="icon alt fa-home"></span>
						<h3>Address</h3>
						<c:choose>
							<c:when test="${empty tel }">
								<a href='#'>�α��� �� ����� ���ּҸ� ���</a>
							</c:when>
							<c:otherwise>
								<a href='#'>${address }</a>
							</c:otherwise>
						</c:choose>
					</div>
				</section>
			</section>
		</section>

		<!-- Footer -->
		<footer id="footer">
		<div class="inner">
			<ul class="icons">
				<li><a href="#" class="icon alt fa-twitter"><span
						class="label">Twitter</span></a></li>
				<li><a href="#" class="icon alt fa-facebook"><span
						class="label">Facebook</span></a></li>
				<li><a href="#" class="icon alt fa-instagram"><span
						class="label">Instagram</span></a></li>
				<li><a href="#" class="icon alt fa-github"><span
						class="label">GitHub</span></a></li>
				<li><a href="#" class="icon alt fa-linkedin"><span
						class="label">LinkedIn</span></a></li>
			</ul>
			<ul class="copyright">
				<li>&copy; Untitled</li>
				<li>Design: <a href="https://html5up.net">HTML5 UP</a></li>
			</ul>
		</div>
		</footer>

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
