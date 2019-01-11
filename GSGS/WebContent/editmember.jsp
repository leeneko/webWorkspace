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
			<a class="navbar-brand js-scroll-trigger" href="index.jsp">개랑후라이</a>
			<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav text-uppercase ml-auto">
					<li class="nav-item"><a class="nav-link js-scroll-trigger" href="#services">게시판</a></li>
					<!--
						<li class="nav-item"><a class="nav-link js-scroll-trigger" href="#portfolio">Portfolio</a></li>
						<li class="nav-item"><a class="nav-link js-scroll-trigger" href="#about">About</a></li>
						<li class="nav-item"><a class="nav-link js-scroll-trigger" href="#team">Team</a></li>
						<li class="nav-item"><a class="nav-link js-scroll-trigger" href="#contact">Contact</a></li>
					-->
					<li class="nav-item"><a class="nav-link" href="logout.dog">로그아웃</a></li>
					<li class="nav-item"><a class="nav-link" href="deletemember.jsp">회원탈퇴</a></li>
				</ul>
			</div>
		</div>
	</nav>
	
	<!-- member edit form -->
	<div style="background-color: #212529;">
		<header class="masthead">
			<div class="container">
				<div class="intro-text">
					<div class="intro-lead-in"></div>
					<div class="intro-heading text-uppercase">회원 정보 수정</div>
				</div>
			</div>
		</header>
		<section id="services">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 text-center">
						<div>
							<form id="edit-member-form" name="joinForm" action="edit.dog" method="post" role="form" onsubmit="return check();">
								<div class="form-group" align="center">
									<input type="text" name="email" id="email" tabindex="2" class="form-control" placeholder="이메일" maxlength="50" value="${sessionScope.memberdto.member_email }" disabled>
									<input type="hidden" id="idDuplication" value="idCheck">
								</div>
								<div class="form-group">
									<input type="password" name="pw" id="pw" tabindex="2" class="form-control" placeholder="비밀번호" maxlength="16">
								</div>
								<div class="form-group">
									<input type="password" name="cpw" id="cpw" tabindex="2" class="form-control" placeholder="비밀번호 확인" maxlength="16" onblur="pwCpw()">
									<p id="pwchk" style="color: red;"></p>
								</div>
								<div class="form-group">
									<input type="tel" name="tel" id="tel" tabindex="2" class="form-control" placeholder="010-0000-0000" value="${sessionScope.memberdto.member_tel }"> 
								</div>
								<div class="form-group">
									<input type="text" name="name" id="name" tabindex="2" class="form-control" placeholder="이름" value="${sessionScope.memberdto.member_name }">
								</div>
								<div class="form-group">
									<input type="text" name="addr" id="addr" tabindex="2" class="form-control" placeholder="주소" maxlength="50"  value="${sessionScope.memberdto.member_addr }">
								</div>
								<div class="form-group">
									<input type="submit" name="register-submit" id="register-submit" tabindex="2" class="btn btn-primary" value="Register Now">
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	
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