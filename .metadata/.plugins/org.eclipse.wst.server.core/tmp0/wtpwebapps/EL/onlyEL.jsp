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
	<td colspan="2" bgcolor="cornflowerBlue" align="center"><h3>EL실습</h3></td>
	</tr>
	<tr>
	<td>쿠키값</td>
	<td>${cookie.cook.value }</td>
	</tr>
	<tr>
	<td>세션값</td>
	<td>${sessionScope.ses }</td>
	</tr>
	<tr>
	<td>어플리케이션값</td>
	<td>${applicationScope.app }</td>
	</tr>
	<tr>
	<td>이름</td>
	<td>${param.name }</td>
	</tr>
	<tr>
	<td>이메일</td>
	<td>${param.email }</td>
	</tr>
	<tr>
	<td>성별</td>
	<td>${param.gender }</td>
	</tr>		
	<tr>			
	<td>전화번호</td>
	<td>${param.phone }</td>
	</tr>		
	<tr>
	<td>나라</td>
	<td>${param.country }</td>
	</tr>		
	<tr>
	<td>주소</td>
	<td>${param.address }</td>
	</tr>		
	<tr>
	<td>생일</td>
	<td>${param.birth }</td>
	</tr>		
	<tr>
	<td>취미</td>
	<td>${paramValues.hobby[0] } ${paramValues.hobby[1] } ${paramValues.hobby[2] } ${paramValues.hobby[3] } ${paramValues.hobby[4] }</td>
	</tr>		
	<tr>		
	<td>색깔</td>
	<td>${param.color }</td>
	</tr>		
	<tr>
	<td>하고싶은 말</td>
	<td>${param.talk }</td>
	</tr>	
	</table>
</body>
</html>