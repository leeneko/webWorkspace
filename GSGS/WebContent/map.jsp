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
<body id="page-top" style="background-color: #212529;">
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
		<div class="container">
			<a class="navbar-brand js-scroll-trigger" href="index.jsp"><img src="img/logo.png"></a>
			<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav text-uppercase ml-auto">
					<li class="nav-item"><a class="nav-link js-scroll-trigger" href="#">분양등록</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger" href="#">반려견 매칭</a></li>
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
	
	<!-- map content -->
	<section id="board">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2 style="color: white; float: left;">보호소 지도</h2>
					<div id="map" style="width: 100%; height: 350px; position: relative; overflow: hidden;"></div>
					<div class="button-group" style="margin-top: 20px;">
						<div class="row">
							<div class="col-lg-12 text-center">
								<a class="customBtn" onclick="one()">튼튼동물병원</a>
								<a class="customBtn" onclick="two()">신세계동물병원</a>
								<a class="customBtn" onclick="tre()">광주동물보호소</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<!-- daum map -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=88fa273aa6fd31c95d11bd5d4ecc9719"></script>
	<script type="text/javascript">
		var mapContainer = document.getElementById('map'); // 지도를 표시할 div 
		var mapOption = { center: new daum.maps.LatLng(35.1641552, 126.9205893), level: 3 }; // 지도 중심 및 레벨
		var markerPosition = new daum.maps.LatLng(35.1641552, 126.9205893); // 마커 좌표
		var marker = new daum.maps.Marker({ // 마커 생성
			position : markerPosition
		});
		// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		var map = new daum.maps.Map(mapContainer, mapOption);
		marker.setMap(map);
		var mapTypeControl = new daum.maps.MapTypeControl();
		map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);
		var zoomControl = new daum.maps.ZoomControl();
		map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
		function one() {
			mapOption = { center: new daum.maps.LatLng(35.1641552, 126.9205893), level: 3 };
			markerPosition = new daum.maps.LatLng(35.1641552, 126.9205893); // 마커 좌표
			marker = new daum.maps.Marker({ // 마커 생성
				position : markerPosition
			});
			refresh();
		}
		function two() {
			mapOption = { center: new daum.maps.LatLng(35.1475332, 126.9125806), level: 3 };
			markerPosition = new daum.maps.LatLng(35.1475332, 126.9125806); // 마커 좌표
			marker = new daum.maps.Marker({ // 마커 생성
				position : markerPosition
			});
			refresh();
		}
		function tre() {
			mapOption = { center: new daum.maps.LatLng(35.2225606, 126.8817694), level: 3 };
			markerPosition = new daum.maps.LatLng(35.2225606, 126.8817694); // 마커 좌표
			marker = new daum.maps.Marker({ // 마커 생성
				position : markerPosition
			});
			refresh();
		}
		function refresh() {
			var map = new daum.maps.Map(mapContainer, mapOption);
			marker.setMap(map);
		}
	</script>
	
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