<%@page import="com.member.*"%>
<%@page import="com.rgst.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
					<li class="nav-item"><a class="nav-link js-scroll-trigger" href="#">분양등록</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger" href="#">반려견 매칭</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger" href="#">게시판</a></li>
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
	<section style="margin-top: 60px;">
		<div class="row">
			<div class="container">
				<h3>반려동물 분양(입양) 계약서</h3>
				<p>본 계약서는 반려동물 분양인과 입양인 사이의 계약을 명시하며 분양인은 반려동물 분양 이후 아래와 같은 문제가
					발생시에 피해보상 규정에 따라 보상할 의무가 있습니다.</p>
				<br> ※ 피해 보상 규정 ※
				<hr>
				<p>1) 입양 후 15일 이내 폐사</p>
				<p>반려동물의 입양가 환급.</p>
				<p>2) 입양 후 15일 이내 질병 발생</p>
				<p>분양자가 제반 비용을 부담해 회복시킨 후 입양자에게 인도함.</p>
				<p>다만 회복 기간이 30일을 경과하거나 회복 중 폐사시에는 입양가 환급.</p>
				<br>
				<p>3) 계약서 미교부</p>
				<p>계약 해제 (단, 입양 후 24시간 이내).</p>
				<hr>
				<br>
				<p>피해 보상 규정은 입양자의 과실 치사 또는 관리 미비로 인한 경우에는 해당 사항이 없으므로 배상을 요구할 수 없습니다.</p>
				<br> <br>
				<p>반려동물 분양인(이하 갑)과 입양인(이하 을)은 상호 존중과 신의 성실에 입각하여 갑이 분양한 반려동물에 대해 다음과 같이 갑과 을간의 계약을 체결합니다.</p>
				<br>
				<p>1. 갑은 처음 명시한 견종과 금액으로 분양하고, 을은 입양한 날로부터 15일 이내에 피해 보상 규정을 갑에게 요청할 수 있습니다.</p>
				<br>
				<p>2. 을은 갑에게 약정된 입양 금액을 지불하며, 이 때 피해 보상 규정과 분양에 관한 사후 책임, 그리고 입양 후의 사후 책임 부분을 확인해야 합니다.</p>
				<br>
				<p>3. 갑과 을은 아래의 내용으로 거래하며, 갑이 을에게 제공하는 품종과 계약서의 내용은 반드시 일치해야 합니다.</p>
				<br>
<%
	RgstDAO rdao = new RgstDAO();
	String num = request.getParameter("num");
	RgstDTO rdto = rdao.select(num);
	request.setAttribute("rdto", rdto);
%>
				<p>가. 품종 : ${rdto.kind }</p>
				<p>나. 성별 : ${rdto.gender }</p>
				<p>다. 나이(개월) : ${rdto.birth }</p>
				<p>라. 접종 유무 : ${rdto.prev }</p>
				<p>마. 건강 상태 : </p>
				<p>바. 분양(입양) 금액 : </p>
				<p>사. 기타 : </p>
				<br>
				<p>4. 갑이 제공한 정보와 을이 입양한 반려동물의 정보가 일치하지 않는 때에는 을은 1항에 제시한 기일에 한하여 갑에게 환불 또는 기타 조치를 취할 수 있습니다.</p>
				<br>
				<br>
				<p>※ 협약서 ※</p>
				<hr>
				<p>1) 입양자는 입양 전, 현재의 여건이 반려동물을 키우는데 무리가 없는지 고려해야 하며 임신, 이사, 학업, 장시간의 부재, 훈련 미숙, 기타 등을 이유로 파양하지 않겠음을 약속해야 합니다.</p>
				<br>
				<p>2) 입양자는 생물을 입양하는 만큼 반려동물이 살아가는 동안 아플 수도 있으며, 그로 인해 상당한 병원비가 지출될 수도 있음을 인지하고 있어야 합니다.</p>
				<p>최소한의 처치라도 해 줄 수 있는 경제적인 여력이 있어야 하며 병원비 지출에 대한 부담을 이유로 유기, 혹은 안락사를 선택하지 않을 것을 약속해야 합니다.</p>
				<br>
				<p>3) 입양자는 반려동물을 입양하기 전, 양육에 필요한 최소한의 제반 물품 - 하우스, 배변처리용품, 사료 - 를 모두 준비한 상태여야 합니다.</p>
				<br>
				<p>4) 입양자는 반려동물을 키우는 데 필요한 정보를 수집하고 학습하여 적절한 양육 환경을 조성하고 교육과 훈련에 필요한 기본적인 지식과 의지를 가지고 있어야 합니다.</p>
				<br>
				<p>5) 입양 후 1년 이내에 부득이하게 파양하게 될 경우, 원 분양자에게 통보하고 다음 입양자에 대한 정보를 알려야 하며 재분양으로 수익을 낼 목적을 가지거나 좋은 분양처에 대한 고민없이 재분양을 해서는 안 됩니다.</p>
				<br>
				<p>6) 협약서의 사항에 동의하지 않을 경우 분양하지 않겠으며, 분양(입양) 확정시 입양자는 협약에 동의한 것으로 보아 이를 어겼을 시 분양자와의 분쟁을 감수하겠다는 의사로 간주합니다.</p>
				<hr>
				<br>
				<p>5. 본 계약서 또는 협약서에 명시되지 않은 사항은 일반 상 관례에 따릅니다. 상기와 같은 계약을 체결하였음을 증명하기 위하여 본 계약서 2통을 작성하고 각각 기명 날인 후 분양자와 입양자가 1통씩 보관합니다.</p>
				<br>
				<br>
<% SimpleDateFormat formatter = new SimpleDateFormat("yyyy년 MM월 dd일"); String todate = formatter.format(new Date()); %>
				<p><%=todate %></p>
				<br>
				<br>
				<p>[갑]</p>
				<p>주소 : ${memberdto.member_addr }</p>
				<p>연락처 : ${memberdto.member_tel }</p>
				<p>성명 : ${memberdto.member_name }  (인)</p>
				<br>
<%
	MemberDAO mdao = new MemberDAO();
	MemberDTO otherMember = mdao.select(rdto.getWriter());
	request.setAttribute("oMem", otherMember);
%>
				<p>[을]</p>
				<p>주소 : ${oMem.member_addr }</p>
				<p>연락처 : ${oMem.member_tel }</p>
				<p>성명 : ${oMem.member_name } (인)</p>
				<button type="button" class="btn btn-warning" onclick="location.href='out.dog'">분양하기</button>
			</div>
		</div>
	</section>
</body>
</html>