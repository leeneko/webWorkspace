<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body onload="pValue()">
	<div id="wrap">
		<br>
		<b><font size="4" color="gray">아이디 중복체크</font></b>
		<hr size="1" width="460">
		<br>
		<div id="chk">
			<form id="checkForm">
				<input type="text" name="idInput" id="userId">
				<input type="button" value="중복확인" onclick="idCheck()">
			</form>
			<br>
			<input id="cancelBtn" type="button" value="취소" onclick="window.close()">
			<br>
			<input id="useBtn" type="button" value="사용하기" onclick="sendCheckValue()">
		</div>
	</div>
	
	<script>
		
	</script>
</body>
</html>