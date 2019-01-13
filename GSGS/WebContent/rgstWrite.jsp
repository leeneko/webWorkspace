<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>개랑후라이</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<form action="rgst.dog" method="post" enctype="multipart/form-data">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">제목</span>
					</div>
					<input type="text" name="title" class="form-control" placeholder="Title" maxlength="50">
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">품종</span>
					</div>
					<input type="text" name="kind" class="form-control" placeholder="Type" maxlength="50">
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">성별</span>
					</div>
					<div class="form-control">
						MALE <input type="radio" name="gender" value="MALE">
						FEMALE <input type="radio" name="gender" value="FEMALE">
					</div>
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">개월</span>
					</div>
					<input type="text" name="birth" class="form-control" placeholder="Month" maxlength="50">
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">기타 내용</span>
					</div>
					<textarea name="content" class="form-control" maxlength="1000"></textarea>
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">예방접종사항</span>
					</div>
					<input type="text" name="prev" class="form-control" placeholder="1차, 2차접종 완료 등..." maxlength="50">
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">사진</span>
					</div>
					<input type="file" name="imgpath" class="form-control">
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">크기</span>
					</div>
					<select class="form-control" name="dogsize">
						<option value="소형견">소형견</option>
						<option value="중·대형견">중·대형견</option>
					</select>
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">성격</span>
					</div>
					<select class="form-control" name="pers">
						<option value="순둥">순둥</option>
						<option value="재미">재미</option>
						<option value="충성심">충성심</option>
						<option value="똑똑함">똑똑함</option>
						<option value="활발함">활발함</option>
						<option value="조용함">조용함</option>
					</select>
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">생김새</span>
					</div>
					<select class="form-control" name="ap1">
						<option value="귀여움">귀여움</option>
						<option value="복슬복슬">복슬복슬</option>
						<option value="멋짐">멋짐</option>
					</select>
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">얼굴형</span>
					</div>
					<select class="form-control" name="ap2">
						<option value="날카로움">날카로움</option>
						<option value="둥근입">둥근입</option>
					</select>
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">다리</span>
					</div>
					<select class="form-control" name="ap3">
						<option value="긴 다리">긴 다리</option>
						<option value="짧은 다리">짧은 다리</option>
					</select>
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">꼬리</span>
					</div>
					<select class="form-control" name="ap4">
						<option value="긴 꼬리">긴 꼬리</option>
						<option value="짧은 꼬리">짧은 꼬리</option>
					</select>
				</div>
				<div class="input-group mb-3">
					<input type="submit" class="form-control" value="등록">
				</div>
				</form>
			</div>
		<div class="col-sm-2"></div>
	</div>
</div>
</body>
</html>