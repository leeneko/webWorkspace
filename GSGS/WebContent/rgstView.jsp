<%@page import="java.util.ArrayList"%>
<%@page import="com.rgst.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<body>
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav" style="background-color: #212529;">
		<div class="container">
			<a class="navbar-brand js-scroll-trigger" href="index.jsp"><img
				src="img/logo.png"></a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav text-uppercase ml-auto">
					<li class="nav-item"><a class="nav-link js-scroll-trigger" href="#services">분양등록</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger" href="#services">반려견 매칭</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger" href="#services">게시판</a></li>
					<c:choose>
						<c:when test="${sessionScope.memberdto == null }">
							<li class="nav-item"><a href="#loginlayer" class="btn-example nav-link">로그인</a></li>
						</c:when>
						<c:otherwise>
							<li class="nav-item"><a class="nav-link" href="logout.dog">로그아웃</a></li>
							<li class="nav-item"><a class="nav-link" href="editmember.jsp">정보수정</a></li>
							<li class="nav-item"><a class="nav-link" href="delete.jsp">회원탈퇴</a></li>
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
					<form id="login-form" name="loginForm" action="login.dog"
						method="post" role="form" style="display: block;">
						<div class="form-group">
							<input type="text" name="id" id="username" tabindex="1"
								class="form-control" placeholder="이메일">
						</div>
						<div class="form-group">
							<input type="password" name="pw" id="password" tabindex="1"
								class="form-control" placeholder="비밀번호">
						</div>
						<div class="form-group">
							<input type="submit" name="login-submit" id="login-submit"
								tabindex="1" class="btn btn-primary" value="Log In">
						</div>
					</form>
					<form id="register-form" name="joinForm" action="join.dog"
						method="post" role="form" style="display: none;"
						onsubmit="return check();">
						<div class="form-group" align="center">
							<input type="text" name="email" id="email" tabindex="2"
								class="form-control" placeholder="이메일" maxlength="50"
								onfocus="inputIdChk()" onblur="idChk()">
							<p id="chk" style="color: red;"></p>
							<input type="hidden" id="idDuplication" value="idUncheck">
						</div>
						<div class="form-group">
							<input type="password" name="pw" id="pw" tabindex="2"
								class="form-control" placeholder="비밀번호" maxlength="16">
						</div>
						<div class="form-group">
							<input type="password" name="cpw" id="cpw" tabindex="2"
								class="form-control" placeholder="비밀번호 확인" maxlength="16"
								onblur="pwCpw()">
							<p id="pwchk" style="color: red;"></p>
						</div>
						<div class="form-group">
							<input type="text" name="name" id="name" tabindex="2"
								class="form-control" placeholder="이름">
						</div>
						<div class="form-group">
							<input type="tel" name="tel" id="tel" tabindex="2"
								class="form-control" placeholder="010-0000-0000">
						</div>
						<div class="form-group">
							<input type="text" name="addr" id="addr" tabindex="2"
								class="form-control" placeholder="주소" maxlength="50">
						</div>
						<div class="form-group">
							<input type="submit" name="register-submit" id="register-submit"
								tabindex="2" class="btn btn-primary" value="Register Now">
						</div>
					</form>
					<div class="btn-r">
						<a href="#" class="btn-layerClose">Close</a>
					</div>
				</div>
			</div>
		</div>
	</div>
<%
	request.setCharacterEncoding("UTF-8");
	String num = request.getParameter("num");
	RgstDAO rdao = new RgstDAO();
	RgstDTO rdto = rdao.select(num);
	request.setAttribute("rdto", rdto);
%>
	<section>
		<div class="container">
			<div class="row">
				<table width="100%">
						<tbody>
						<tr>
							<td align="left"><h5>${rdto.num }</h5></td>
							<td><h5>${rdto.addr }</h5></td>
							<td align="center"><h5>${rdto.writer }</h5></td>
							<td align="right"><h5>${rdto.wdate }</h5></td>
						</tr>
						<tr>
							<td colspan="4"><h3>${rdto.title }</h3></td>
						</tr>
					</tbody>
				</table>
				
				<div class="accordion" id="accordionExample" style="width: 100%;">
					<div class="card">
						<div class="card-header" id="headingOne">
							<h2 class="mb-0">
								<button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
									${rdto.kind }, ${rdto.gender }, ${rdto.birth }
								</button>
							</h2>
						</div>

						<div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
							<div style="text-align: center;"><img src="file/${rdto.imgpath }" alt="분양견 사진" style="max-width: 100%; max-height: 100%; min-width: 77%; min-height: 77%;"></div>
							<div class="card-body">
								${rdto.content }
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header" id="headingTwo">
							<h2 class="mb-0">
								<button class="btn btn-link collapsed" type="button"
									data-toggle="collapse" data-target="#collapseTwo"
									aria-expanded="false" aria-controls="collapseTwo">
									상세 정보</button>
							</h2>
						</div>
						<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
							<div class="card-body">
								예방접종사항 : ${rdto.prev } <hr>
								크기 : ${rdto.dogsize }<hr>
								성격 : ${rdto.pers }<hr>
								생김새 : ${rdto.ap1 }<hr>
								얼굴형 : ${rdto.ap2 }<hr>
								다리 : ${rdto.ap3 }<hr>
								꼬리 : ${rdto.ap4 }<hr>
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header" id="headingThree">
							<h2 class="mb-0">
								<button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
									분양하기
								</button>
							</h2>
						</div>
						<div id="collapseThree" class="collapse"
							aria-labelledby="headingThree" data-parent="#accordionExample">
							<div class="card-body">
								<button type="button" class="btn btn-warning">분양하기</button>
								<button type="button" class="btn btn-dark" onclick="history.back()">뒤로가기</button>
							</div>
						</div>
					</div>
					<div class="card">
						<div class="card-header" id="headingfour">
							<h2 class="mb-0">
								<button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapsefour" aria-expanded="false" aria-controls="collapsefour">
									비슷한 강아지
								</button>
							</h2>
						</div>
						<div id="collapsefour" class="collapse"
							aria-labelledby="headingfour" data-parent="#accordionExample">
							<div class="card-body">
								<!-- 비슷한 강아지 TOP3 -->
<%
	// 크기, 생김새로 찾기(열려있는 게시글은 중복으로, 중복 제거 NOT IN)
	int temp = Integer.parseInt((String) request.getParameter("num"));
	ArrayList<RgstDTO> arr = rdao.similerSelect(temp, rdto.getDogsize(), rdto.getAp1());
	
%>
								<div class="row">
									<div id="carouselExampleControls" class="carousel slide"
										data-ride="carousel">
										<div class="carousel-inner">
											<div class="carousel-item active">
												<img src="..." class="d-block w-100" alt="...">
											</div>
											<div class="carousel-item">
												<img src="..." class="d-block w-100" alt="...">
											</div>
											<div class="carousel-item">
												<img src="..." class="d-block w-100" alt="...">
											</div>
										</div>
										<a class="carousel-control-prev"
											href="#carouselExampleControls" role="button"
											data-slide="prev"> <span
											class="carousel-control-prev-icon" aria-hidden="true"></span>
											<span class="sr-only">Previous</span>
										</a> <a class="carousel-control-next"
											href="#carouselExampleControls" role="button"
											data-slide="next"> <span
											class="carousel-control-next-icon" aria-hidden="true"></span>
											<span class="sr-only">Next</span>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
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