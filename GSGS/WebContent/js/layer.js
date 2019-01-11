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

$('.btn-example').click(function() {
	var $href = $(this).attr('href');
	layer_popup($href);
});

function layer_popup(el) {
	var $el = $(el); //레이어의 id를 $el 변수에 저장
	var isDim = $el.prev().hasClass('dimBg'); //dimmed 레이어를 감지하기 위한 boolean 변수

	isDim ? $('.dim-layer').fadeIn() : $el.fadeIn();

	var $elWidth = ~~($el.outerWidth()), $elHeight = ~~($el.outerHeight())
	docWidth = $(document).width(), docHeight = $(document).height();

	// 화면의 중앙에 레이어를 띄운다.
	if ($elHeight < docHeight || $elWidth < docWidth) {
		$el.css({
			marginTop : -$elHeight / 2,
			marginLeft : -$elWidth / 2
		})
	} else {
		$el.css({
			top : 0,
			left : 0
		});
	}

	$el.find('a.btn-layerClose').click(function() {
		isDim ? $('.dim-layer').fadeOut() : $el.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
		return false;
	});

	$('.layer .dimBg').click(function() {
		$('.dim-layer').fadeOut();
		return false;
	});

}

function inputIdChk() {
	document.joinForm.idDuplication.innerHTML = "idUncheck";
}

function pwCpw() {
	var pw = document.joinForm.pw.value;
	var cpw = document.joinForm.cpw.value;
	
	if (pw != cpw) {
		document.getElementById("pwchk").innerHTML = "비밀번호와 비밀번호 확인을 확인해주세요";
	} else {
		document.getElementById("pwchk").innerHTML = "";
	}
}

var emailRules = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+$/;
var pwRules = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*+-=]).{8,16}$/;

function check() {
	if (!document.joinForm.email.value.match(emailRules)) {
		alert("이메일을 확인 후 다시 입력해주세요.");
		document.joinForm.email.focus();
		return false;
	}
	
	if (!document.joinForm.pw.value.match(pwRules)) {
		alert("8글자 이상, 16글자 이하, 영문, 숫자, 특수문자(!@#$%^&*+=-)를 혼합하여 입력해주세요.");
		document.joinForm.pw.focus();
		return false;
	}
	
	if (document.joinForm.name.value == "") {
		alert("이름을 입력해주세요.");
		document.joinForm.name.focus();
		return false;
	}
	
	if (document.joinForm.addr.value == "") {
		alert("주소를 입력해주세요.");
		document.joinForm.addr.focus();
		return false;
	}
}
var httpRequest = null;
// httpRequest 객체 생성
function getXMLHttpRequest() {
	var httpRequest = null;
	if (window.ActiveXObject) {
		try {
			httpRequest = new ActiveXObject("Msxml2.XMLHTTP");
		} catch (e) {
			try {
				httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
			} catch (e2) {
				httpRequest = null;
			}
		}
	} else if (window.XMLHttpRequest) {
		httpRequest = new window.XMLHttpRequest();
	}
	return httpRequest;
}

function callback() {
	if (httpRequest.readyState == 4) {
		// 결과 값을 가져온다.
		var resultText = httpRequest.responseText;
		if (resultText == 0) {
			document.getElementById("chk").innerHTML = "중복된 아이디가 있습니다. 사용이 불가능합니다.";
		} else if (resultText == 1) {
			document.getElementById("chk").innerHTML = "사용 가능한 아이디입니다.";
			document.joinForm.idDublication.value = "idCheck";
		}
	}
}

function idChk() {
	// document.joinForm.chk.innerHTML = "아이디 중복";
	var email = document.joinForm.email.value;
	if (!document.joinForm.email.value.match(emailRules)) {
		
	} else {
		var param = "email=" + email;
		httpRequest = getXMLHttpRequest();
		httpRequest.onreadystatechange = callback;
		httpRequest.open("POST", "MemberCheck.dog", true);
		httpRequest.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
		httpRequest.send(param);
	}
}

$("#allBoard tr").click(function(){
	var str = "";
	var tdArr = new Array(); // 배열
	// 현재 클릭된 Row(<tr>)
	var tr = $(this);
	var td = tr.children();
	// tr.text()는 클릭된 Row 즉, tr에 있는 모든 값을 가져온다.
	
});