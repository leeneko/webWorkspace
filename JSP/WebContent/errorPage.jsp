<%--
	������ �߻��� ���� �Ǵ� ���������� page �������� isErrorpage = "true"�� �����Ѵ�.
	�������� ������ default�� false�̱� ������ ������������ �ν����� �ʴ´�.
	
	isErrorPage�� true�� �����ϸ� exception ��ü�� �̿��� �� �ְ� �ȴ�.
	ex) exception.getMessage();
 --%>
<%@ page isErrorPage="true" %>

<%--
	���� �ڵ� 200���� ���� ��������� �ǹ��ε�, ���� �ڵ����� 500 �ڵ�� ���õǴ� ��찡 �־�
	���� ������������ �������� �������ٶ�� ������ ���ֱ� ����
	response.setStatus(200); �� ���� ���ش�.
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
		<h3>Error : �������� ������ �� �����ϴ�.</h3>
		<h5>���� ������ <%= exception.getMessage() %>�Դϴ�.</h5>
	</div>
</body>
</html>