<%@page import="com.rgst.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
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
</head>
<body style="background-color: #212529;">
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
					<li class="nav-item"><a class="nav-link js-scroll-trigger" href="#">반려견 매칭</a></li>
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
<%
	RgstDAO rdao = new RgstDAO();
	int num = rdao.count();
	int[] rnd = new int[4]; // 배열 생성
	for (int i = 0; i < rnd.length; i++) {
		rnd[i] = (int)(Math.random()*num) + 1;
		for(int j = 0; j < i; j++) {
			if (rnd[i] == rnd[j]) { // 중복값 제거
				i--;
				break;
			}
		}
	}
	ArrayList<RgstDTO> list = rdao.selectRnd(rnd);
	request.setAttribute("list", list);
%>
	<section style="margin-top: 20px;">
		<div class="row">
			<div class="container">
				<table id="board">
					<thead>
						<tr>
							<td colspan="2" style="color: white;"><h3>가장 맘에 드는 강아지를 클릭해주세요</h3></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>${list.get(0).num }<img src="file/${list.get(0).imgpath }" alt="애완견 이미지" style="max-width: 100%; max-height: 100%;"></td>
							<td>${list.get(1).num }<img src="file/${list.get(1).imgpath }" alt="애완견 이미지" style="max-width: 100%; max-height: 100%;"></td>
						</tr>
						<tr>
							<td>${list.get(2).num }<img src="file/${list.get(2).imgpath }" alt="애완견 이미지" style="max-width: 100%; max-height: 100%;"></td>
							<td>${list.get(3).num }<img src="file/${list.get(3).imgpath }" alt="애완견 이미지" style="max-width: 100%; max-height: 100%;"></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</section>
	<script type="text/javascript">
		$("#board tbody tr td").click(function(){
			var str = "";
			var tdArr = new Array(); // 배열
			// 현재 클릭된 Row(<tr>)
			var tr = $(this);
			var no = tr.text();
			// http://all-record.tistory.com/172
			var link = 'rgstView.jsp?num=' + no;
			location.href=link;
		});
	</script>
</body>
</html>