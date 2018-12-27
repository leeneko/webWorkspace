<%--
	에러가 발생시 띄우게 되는 페이지에는 page 지시자의 isErrorpage = "true"로 지정한다.
	지정하지 않으면 default가 false이기 때문에 에러페이지로 인식하지 않는다.
	
	isErrorPage를 true로 지정하면 exception 객체를 이용할 수 있게 된다.
	ex) exception.getMessage();
 --%>
<%@ page isErrorPage="true" %>

<%--
	에러 코드 200번은 정상 페이지라는 의미인데, 가끔 자동으로 500 코드로 세팅되는 경우가 있어
	현재 에러페이지는 정상적인 페이지다라는 세팅을 해주기 위해
	response.setStatus(200); 을 지정 해준다.
 --%>
<%
	response.setStatus(200);
%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
body {
	text-align: center;
}
</style>
</head>
<body>
	<div>
		<img src="img/error.png">
		<h3>Error : 페이지에 접근할 수 없습니다.</h3>
		<h5>에러 내용은 <%= exception.getMessage() %>입니다.</h5>
	</div>
</body>
</html>