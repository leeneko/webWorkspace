<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
tr{
	background-color: whitesmoke;
	height: 40px;
	text-align: center;
}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%request.setCharacterEncoding("euc-kr");%>
	
	<table width="400px" align="center">
	<tr>
	<td colspan="2" bgcolor="cornflowerBlue" align="center"><h3>EL�ǽ�</h3></td>
	</tr>
	<tr>
	<td>��Ű��</td>
	<td>${cookie.cook.value }</td>
	</tr>
	<tr>
	<td>���ǰ�</td>
	<td>${sessionScope.ses }</td>
	</tr>
	<tr>
	<td>���ø����̼ǰ�</td>
	<td>${applicationScope.app }</td>
	</tr>
	<tr>
	<td>�̸�</td>
	<td>${param.name }</td>
	</tr>
	<tr>
	<td>�̸���</td>
	<td>${param.email }</td>
	</tr>
	<tr>
	<td>����</td>
	<td>${param.gender }</td>
	</tr>		
	<tr>			
	<td>��ȭ��ȣ</td>
	<td>${param.phone }</td>
	</tr>		
	<tr>
	<td>����</td>
	<td>${param.country }</td>
	</tr>		
	<tr>
	<td>�ּ�</td>
	<td>${param.address }</td>
	</tr>		
	<tr>
	<td>����</td>
	<td>${param.birth }</td>
	</tr>		
	<tr>
	<td>���</td>
	<td>${paramValues.hobby[0] } ${paramValues.hobby[1] } ${paramValues.hobby[2] } ${paramValues.hobby[3] } ${paramValues.hobby[4] }</td>
	</tr>		
	<tr>		
	<td>����</td>
	<td>${param.color }</td>
	</tr>		
	<tr>
	<td>�ϰ����� ��</td>
	<td>${param.talk }</td>
	</tr>	
	</table>
</body>
</html>