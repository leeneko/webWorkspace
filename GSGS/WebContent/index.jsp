<%@page import="com.board.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- jQuery  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    
<!-- bootstrap JS -->
<script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>

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

<style type="text/css">
.masthead {
	background-image: url(img/1.gif) !important;
}
</style>

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
					<li class="nav-item"><a class="nav-link js-scroll-trigger" href="rgst.jsp">분양</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger" href="matching.jsp">반려견 매칭</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger" href="map.jsp">보호소</a></li>
					<!--
						<li class="nav-item"><a class="nav-link js-scroll-trigger" href="#team">Team</a></li>
						<li class="nav-item"><a class="nav-link js-scroll-trigger" href="#contact">Contact</a></li>
					-->
					<c:choose>
						<c:when test="${sessionScope.memberdto == null }">
							<li class="nav-item"><a href="#loginlayer" class="btn-example nav-link">로그인</a></li>
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
							<div id="chk" class="alert alert-danger" style="display: none; align: center;">중복된 <strong>이메일</strong>가 있습니다.</div>
							<input type="hidden" id="idDuplication" value="idUncheck">
						</div>
						<div class="form-group">
							<input type="password" name="pw" id="pw" tabindex="2" class="form-control" placeholder="비밀번호" maxlength="16">
						</div>
						<div class="form-group">
							<input type="password" name="cpw" id="cpw" tabindex="2" class="form-control" placeholder="비밀번호 확인" maxlength="16" onblur="pwCpw()">
							<div id="pwchk" class="alert alert-danger" style="display: none; align: center;">비밀번호와 비밀번호 확인을 확인해주세요</div>
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
					<a href="#loginlayer" class="btn btn-example nav-link btn-primary btn-xl text-uppercase">
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
	<section id="board" style="">
		<div class="container">
			<h2>전체 게시판</h2>
			<div class="table-responsive">          
				<table class="table" id="board-table">
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
			<c:choose>
				<c:when test="${sessionScope.memberdto == null }"></c:when>
				<c:otherwise>
					<div style="float: right;"><input type="button" class="btn btn-warning" value="글쓰기" onclick="location.href='boardWrite.jsp'"></div>
				</c:otherwise>
			</c:choose>	
		</div>
	</section>
	<script type="text/javascript">
		$("#board-table tbody tr").click(function(){
			var str = "";
			var tdArr = new Array(); // 배열
			// 현재 클릭된 Row(<tr>)
			var tr = $(this);
			var td = tr.children();
			// http://all-record.tistory.com/172
			var no = td.eq(0).text();
			var link = 'boardView.jsp?num=' + no;
			location.href=link;
		});
	</script>
	
	<!-- Clients -->
	<section class="py-5">
		<div class="container">
			<div class="row">
				<div id="carouselExampleControls" class="carousel slide"
					data-ride="carousel">
					<div class="carousel-inner">
						<div class="carousel-item active">
							<a
								href="http://map.daum.net/link/map/튼튼동물병원,35.1641552,126.9205893"><img
								src="img/aa.png" class="d-block w-100" alt=""></a>
						</div>
						<div class="carousel-item">
							<a
								href="http://map.daum.net/link/map/신세계동물병원,35.1475332, 126.9125806"><img
								src="img/bb.png" class="d-block w-100" alt=""></a>
						</div>
						<div class="carousel-item">
							<a
								href="http://map.daum.net/link/map/광주동물보호소,35.2225606, 126.8817694"><img
								src="img/cc.png" class="d-block w-100" alt=""></a>
						</div>
					</div>
					<a class="carousel-control-prev" href="#carouselExampleControls"
						role="button" data-slide="prev"> <span
						class="carousel-control-prev-icon" aria-hidden="true"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="carousel-control-next" href="#carouselExampleControls"
						role="button" data-slide="next"> <span
						class="carousel-control-next-icon" aria-hidden="true"></span> <span
						class="sr-only">Next</span>
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
