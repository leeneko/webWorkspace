<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		Cookie cook = new Cookie("cook", "cook!");
		response.addCookie(cook);
		
		session.setAttribute("ses", "session!");
		
		application.setAttribute("app", "application!");
	%>
<center>
	<font face="나눔고딕" size="8">Sign Up</font><br>
	for Our Blogging System Today!<br><br>
	
	<form action="onlyEL.jsp" method="post">
	<table width="600" align="center">
		<tr>
			<td colspan="2" bgcolor="cornflowerBlue"><h3>&nbspStep 1 : Account Information</h3></td>
		</tr>
		<tr bgcolor="whitesmoke" height="40">
			<td align="right">Your Name&nbsp</center></td>
			<td><input type="text" size="40" placeholder="이름을 입력하세요" name="name"></td>
		</tr>
		<tr bgcolor="whitesmoke" height="40">
			<td align="right">Email&nbsp</td>
			<td><input type="text" size="40" name="email"></td>
		</tr>
		<tr bgcolor="whitesmoke" height="40">
			<td align="right">Password&nbsp</td>
			<td><input type="password" size="40" name="password"></td>
		</tr>
		<tr>
			<td colspan="2" bgcolor="cornflowerBlue"><h3>&nbspStep 2 : Billing Details</h3></td>
		</tr>
		<tr bgcolor="whitesmoke" height="40">
			<td align="right">Gender&nbsp</td>
			<td>Man<input type="radio" size="40" name="gender" checked="checked" value="man">Women<input type="radio" size="40" name="gender" value="women"></td>
		</tr>
		<tr bgcolor="whitesmoke" height="40">
			<td align="right">Phone&nbsp</td>
			<td><input type="text" size="40" name="phone"><br>
			<input type="checkbox" name="sendcheck">Yes, text me Update and opecial announcements</td>
		</tr>
		<tr bgcolor="whitesmoke" height="40">
			<td align="right">Country&nbsp</td>
			<td><select name="country">
				<option>Choice..</option>
				<option>South Korea</option>
				<option>U.S.A</option>
			</select></td>
		</tr>	
		<tr bgcolor="whitesmoke" height="40">
			<td align="right">Address&nbsp</td>
			<td><input type="text" size="40" name="address">&nbsp<input type="button" value="find address"></td>
		</tr>
		<tr bgcolor="whitesmoke" height="40">
			<td align="right">Your Birthday&nbsp</td>
			<td><input type="date" name="birth"></td>
		</tr>
		<tr>
			<td colspan="2" bgcolor="cornflowerBlue"><h3>&nbspStep 3 : Your favorite</h3></td>
		</tr>
		<tr bgcolor="whitesmoke" height="40">
			<td align="right">Choice Your Hobby&nbsp</td>
			<td>sport<input type="checkbox" name="hobby" value="운동">study<input type="checkbox" name="hobby" value="공부">reading<input type="checkbox" name="hobby">meeting<input type="checkbox" name="hobby">eating<input type="checkbox" name="hobby"><br>
			except..<input type="text"></td>
		</tr>
		<tr bgcolor="whitesmoke" height="40">
			<td align="right">Favorite Color&nbsp</td>
			<td><input type="color" name="color"></td>
		</tr>
		<tr>
			<td colspan="2" bgcolor="cornflowerBlue"><h3>&nbspStep 4 : Talk us!</h3></td>
		</tr>
		<tr bgcolor="whitesmoke" height="40">
			<td colspan="2"><textarea rows="20" cols="90" name="talk"></textarea></td>
		</tr>
		<tr align="center" bgcolor="whitesmoke">
		<td colspan="2">
			<input type="submit" value="Join"><input type="reset" value="Return">
		</td>
		</tr>
	</table>
</form>
</center>
	
</body>
</html>