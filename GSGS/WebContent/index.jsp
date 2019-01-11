<%@page import="com.board.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>개랑후라이</title>
<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom fonts for this template -->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

<!-- Custom styles for this template -->
<link href="css/agency.min.css" rel="stylesheet">
<link href="css/layer.css" rel="stylesheet">
</head>

<body id="page-top">
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
		<div class="container">
			<a class="navbar-brand js-scroll-trigger" href="#page-top"><img src="img/logo.png"></a>
			<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav text-uppercase ml-auto">
					<li class="nav-item"><a class="nav-link js-scroll-trigger" href="#board">게시판</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger" href="#">반려견 매칭</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger" href="map.jsp">보호소</a></li>
					<!--
						<li class="nav-item"><a class="nav-link js-scroll-trigger" href="#team">Team</a></li>
						<li class="nav-item"><a class="nav-link js-scroll-trigger" href="#contact">Contact</a></li>
					-->
					<c:choose>
						<c:when test="${sessionScope.memberdto == null }">
							<li class="nav-item"><a href="#loginlayer" class="btn-example nav-link">로그인 / 회원가입</a></li>
						</c:when>
						<c:otherwise>
							<li class="nav-item"><a class="nav-link" href="logout.dog">로그아웃</a></li>
							<li class="nav-item"><a class="nav-link" href="editmember.jsp">정보수정</a></li>
							<li class="nav-item"><a class="nav-link" href="deletemember.jsp">회원탈퇴</a></li>
						</c:otherwise>
					</c:choose>
					<div style="width: 30px;"></div>
					<li class="nav-item">
						<a href="http://pf.kakao.com/_FCGSj/chat">
							<img src="https://developers.kakao.com/assets/img/about/logos/plusfriend/consult_small_yellow_pc.png"/>
						</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="dim-layer">
	    <div class="dimBg"></div>
	    <div id="loginlayer" class="pop-layer">
	        <div class="pop-container">
	            <div class="pop-conts">
	                <!--content //-->
	                <table width="100%">
	                	<tr align="center">
	                		<td><a href="#" id="login-form-link">로그인</a></td>
	                		<td><a href="#" id="register-form-link">회원가입</a></td>
	                	</tr>
	                </table>
	                <hr>
	                <form id="login-form" name="loginForm" action="login.dog" method="post" role="form" style="display: block;">
						<div class="form-group">
							<input type="text" name="id" id="username" tabindex="1" class="form-control" placeholder="이메일">
						</div>
						<div class="form-group">
							<input type="password" name="pw" id="password" tabindex="1" class="form-control" placeholder="비밀번호">
						</div>
						<div class="form-group">
							<input type="submit" name="login-submit" id="login-submit" tabindex="1" class="btn btn-primary" value="Log In">
						</div>
					</form>
	                <form id="register-form" name="joinForm" action="join.dog" method="post" role="form" style="display: none;" onsubmit="return check();">
						<div class="form-group" align="center">
							<input type="text" name="email" id="email" tabindex="2" class="form-control" placeholder="이메일" maxlength="50" onfocus="inputIdChk()" onblur="idChk()">
							<p id="chk" style="color: red;"></p>
							<input type="hidden" id="idDuplication" value="idUncheck">
						</div>
						<div class="form-group">
							<input type="password" name="pw" id="pw" tabindex="2" class="form-control" placeholder="비밀번호" maxlength="16">
						</div>
						<div class="form-group">
							<input type="password" name="cpw" id="cpw" tabindex="2" class="form-control" placeholder="비밀번호 확인" maxlength="16" onblur="pwCpw()">
							<p id="pwchk" style="color: red;"></p>
						</div>
						<div class="form-group">
							<input type="tel" name="tel" id="tel" tabindex="2" class="form-control" placeholder="010-0000-0000"> 
						</div>
						<div class="form-group">
							<input type="text" name="name" id="name" tabindex="2" class="form-control" placeholder="이름">
						</div>
						<div class="form-group">
							<input type="text" name="addr" id="addr" tabindex="2" class="form-control" placeholder="주소" maxlength="50">
						</div>
						<div class="form-group">
							<input type="submit" name="register-submit" id="register-submit" tabindex="2" class="btn btn-primary" value="Register Now">
						</div>
					</form>
	                <div class="btn-r">
	                    <a href="#" class="btn-layerClose">Close</a>
	                </div>
	                <!--// content-->
	            </div>
	        </div>
	    </div>
	</div>

	<!-- Header -->
	<header class="masthead">
		<div class="container">
			<div class="intro-text">
			<c:choose>
				<c:when test="${sessionScope.memberdto == null }">
					<div class="intro-lead-in">당신의 반려견을 찾아보세요</div>
					<div class="intro-heading text-uppercase"></div>
					<a href="#loginlayer" class="btn-example" style="background-color: #fec810; color: white;
					font-size: 18px; padding: 20px 40px; border-radius: .25rem; line-height: 1.5;
					border: 1px solid transparent; box-sizing: border-box;">
						<b>로그인 / 회원가입</b>
					</a>
				</c:when>
				<c:otherwise>
					<div class="intro-lead-in">${sessionScope.memberdto.member_name } 님 어서오세요.</div>
					<div class="intro-heading text-uppercase">우하하하하</div>
					<a href="#" class="" style="background-color: #fec810; color: white;
					font-size: 18px; padding: 20px 40px; border-radius: .25rem; line-height: 1.5;
					border: 1px solid transparent; box-sizing: border-box;">
						<b>반려견 매칭</b>
					</a>
				</c:otherwise>
			</c:choose>	
			</div>
		</div>
	</header>
<%
	BoardDAO bdao = new BoardDAO();
	ArrayList<BoardDTO> list = bdao.selectAll();
	request.setAttribute("list", list);
%>
	<!-- Services -->
	<section id="board">
		<div class="container">
			<h2>전체 게시판</h2>
			<div class="table-responsive">          
				<table class="table" id="allBoard">
					<thead>
						<tr>
							<th>#</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일자</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${requestScope.list }" var="i">
						<tr>
							<td>${i.board_num }</td>
							<td>${i.board_title }</td>
							<td>${i.board_writer }</td>
							<td>${i.board_date }</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
			<div style="float: left;"></div>
		</div>
	</section>

	<!-- Clients -->
	<section class="py-5">
		<div class="container">
			<div class="row">
				<div class="col-md-3 col-sm-6">
					<a href="#"> <img class="img-fluid d-block mx-auto"
						src="img/logos/envato.jpg" alt="">
					</a>
				</div>
				<div class="col-md-3 col-sm-6">
					<a href="#"> <img class="img-fluid d-block mx-auto"
						src="img/logos/designmodo.jpg" alt="">
					</a>
				</div>
				<div class="col-md-3 col-sm-6">
					<a href="#"> <img class="img-fluid d-block mx-auto"
						src="img/logos/themeforest.jpg" alt="">
					</a>
				</div>
				<div class="col-md-3 col-sm-6">
					<a href="#"> <img class="img-fluid d-block mx-auto"
						src="img/logos/creative-market.jpg" alt="">
					</a>
				</div>
			</div>
		</div>
	</section>

	<!-- Footer -->
	<footer style="background-color: #212529;">
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<span  style="color: white;">Copyright &copy; Your Website 2018</span>
				</div>
				<div class="col-md-4">
					<ul class="list-inline social-buttons">
						<li class="list-inline-item"><a href="#"> <i
								class="fab fa-twitter"></i>
						</a></li>
						<li class="list-inline-item"><a href="#"> <i
								class="fab fa-facebook-f"></i>
						</a></li>
						<li class="list-inline-item"><a href="#"> <i
								class="fab fa-linkedin-in"></i>
						</a></li>
					</ul>
				</div>
				<div class="col-md-4">
					<ul class="list-inline quicklinks">
						<li class="list-inline-item"><a href="#">Privacy Policy</a></li>
						<li class="list-inline-item"><a href="#">Terms of Use</a></li>
					</ul>
				</div>
			</div>
		</div>
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Plugin JavaScript -->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Contact form JavaScript -->
	<script src="js/jqBootstrapValidation.js"></script>
	<script src="js/contact_me.js"></script>

	<!-- Custom scripts for this template -->
	<script src="js/agency.min.js"></script>
	<script src="js/layer.js"></script>
</body>

</html>
