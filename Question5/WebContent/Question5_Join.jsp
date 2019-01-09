<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="myCSS.css">
</head>
<body>
	<div>
		<fieldset>
			<legend><h1>회원가입</h1></legend>
				<form action="Join.do">
					<table align="center">
						<tr>
							<td>ID</td>
							<td><input type="text" name="id" required="required" ></td>
							<td rowspan="5" ><input type="submit" value="가입"></td>
						</tr>
						<tr>
							<td>PW</td>
							<td><input type="password" name="pw" required="required"></td>
						</tr>
						<tr>
							<td>NICKNAME</td>
							<td><input type="text" name="nick" required="required"></td>
						</tr>
						<tr>
							<td>EMAIL</td>
							<td><input type="text" name="email" required="required"></td>
						</tr>
						<tr>
							<td>TEL</td>
							<td><input type="text" name="tel" required="required"></td>
						</tr>
					</table>
				</form>
		</fieldset>
	</div>
</body>
</html>