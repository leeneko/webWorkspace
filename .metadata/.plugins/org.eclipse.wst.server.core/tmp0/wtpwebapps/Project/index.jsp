<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<title>INDEX</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" type="text/css" href="main.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</head>
	<body>
		<!-- Navbar -->
		<%@ include file="nav.jsp" %>
		
		<!-- body -->
		<!-- xs 768px �̸�, sm 768px �̻�, md 992px �̻�, lg 1200px �̻� -->
		<div class="row">
			<div class="col-sm-6">
				<div align="center">
					<img class="img-responsive" src="img/mainimage.png" width="67%" height="67%">
				</div>
			</div>
			
			<div class="col-sm-6">
				<div class="col-md-6 col-md-offset-3">
				<div class="panel panel-login">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-6">
								<a href="#" class="active" id="login-form-link">Login</a>
							</div>
							<div class="col-xs-6">
								<a href="#" id="register-form-link">Register</a>
							</div>
						</div>
						<hr>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
								<form id="login-form" action="login" method="post" role="form" style="display: block;">
									<div class="form-group">
										<input type="text" name="id" id="username" tabindex="1" class="form-control" placeholder="Username" value="">
									</div>
									<div class="form-group">
										<input type="password" name="pw" id="password" tabindex="2" class="form-control" placeholder="Password">
									</div>
									<div class="form-group text-center">
										<input type="checkbox" tabindex="3" class="" name="remember" id="remember">
										<label for="remember"> Remember Me</label>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-login" value="Log In">
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-lg-12">
												<div class="text-center">
													<a href="https://phpoll.com/recover" tabindex="5" class="forgot-password">Forgot Password?</a>
												</div>
											</div>
										</div>
									</div>
								</form>
								<form id="register-form" name="joinForm" action="join" method="post" role="form" style="display: none;" onsubmit="return check();">
									<div class="form-group" align="center">
										<input type="text" name="id" id="username" tabindex="1" class="form-control" placeholder="Username" maxlength="12" onkeydown="inputIdChk()" onkeyup="idChk()">
										<p id="chk" style="color: red;"></p>
										<input type="hidden" name="idDuplication" value="idUncheck">
									</div>
									<div class="form-group">
										<input type="password" name="pw" id="pw" tabindex="1" class="form-control" placeholder="Password" maxlength="16">
									</div>
									<div class="form-group">
										<input type="password" name="cpw" id="cpw" tabindex="1" class="form-control" placeholder="Confirm Password" maxlength="16">
									</div>
									<div class="form-group">
										<input type="text" name="nick" id="nick" tabindex="1" class="form-control" placeholder="Nick Name" value="" maxlength="12">
									</div>
									<div class="form-group">
										<input type="email" name="email" id="email" tabindex="1" class="form-control" placeholder="Email Address" value="" maxlength="25">
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="register-submit" id="register-submit" tabindex="4" class="form-control btn btn-register" value="Register Now">
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			</div>
		</div>
		
<script>
function idChk() {
	document.getElementById("chk").innerHTML = "���̵� �ߺ�";
	
}

$(function() {
	$('#login-form-link').click(function(e) {
		$("#login-form").delay(100).fadeIn(100);
		$("#register-form").fadeOut(100);
		$('#register-form-link').removeClass('active');
		$(this).addClass('active');
		e.preventDefault();
	});

	$('#register-form-link').click(function(e) {
		$("#register-form").delay(100).fadeIn(100);
		$("#login-form").fadeOut(100);
		$('#login-form-link').removeClass('active');
		$(this).addClass('active');
		e.preventDefault();
	});
});

var idRules = /^(?=.*[a-zA-Z0-9]).{4,12}$/;
var pwRules = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*+-=]).{8,16}$/;
var nickRules = /^(?=.*[a-zA-Z0-9]).{2,12}$/
var emailRules = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+$/;

function check() {
	if (!document.joinForm.id.value.match(idRules)) {
		// ���̵� ��ȿ�� �˻�
		alert("4���� �̻�, 12���� ����, ����, ���ڷ� ���̵� �Է����ּ���.");
		document.joinForm.id.focus();
		return false;
	}
	
	if (document.joinForm.idDuplication.value != "idCheck") {
		alert("���̵� �ߺ�üũ�� ���ּ���.");
		return false;
	}
			
	if (!document.joinForm.pw.value.match(pwRules)) {
		// ��й�ȣ ��ȿ�� �˻�
		alert("8���� �̻�, 16���� ����, ����, ����, Ư������(!@#$%^&*+=-)�� ȥ���Ͽ� �Է����ּ���.");
		document.joinForm.pw.focus();
		return false;
	}
			
	if (document.joinForm.pw.value != document.joinForm.cpw.value) {
		// ��й�ȣ�� ��й�ȣ Ȯ���� ���� ����
		alert("��й�ȣ�� ��й�ȣ Ȯ���� Ȯ���Ͽ� �Է����ּ���.");
		document.joinForm.pw.focus();
		return false;
	}
	
	if (!document.joinForm.nick.value.match(nickRules)) {
		// �г��� ��ȿ�� �˻�
		alert("2���� �̻�, 12���� ����, ����, ���ڷ� �г����� �Է����ּ���.");
		document.joinForm.nick.focus();
		return false;
	}
	
	if (!document.joinForm.email.value.match(emailRules)) {
		alert("�Է����ֽ� �̸����� Ȯ�����ּ���.");
		document.joinForm.email.focus();
		return false;
	}
	
}

function inputIdChk() {
	document.joinForm.idDublication.value = "idUncheck";
}
</script>
		
		<!-- footer -->
		<%@ include file="footer.jsp" %>
	</body>
</html>