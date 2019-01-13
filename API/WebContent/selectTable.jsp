<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
</head>
<body>
	<!-- http://all-record.tistory.com/172 -->
	<table>
		<tr>
			<td>1111<input type="hidden" name="s" value="1"></td>
		</tr>
		<tr>
			<td>2222<input type="hidden" name="s" value="1"></td>
		</tr>
		<tr>
			<td>3333<input type="hidden" name="s" value="1"></td>
		</tr>
		<tr>
			<td>4444<input type="hidden" name="s" value="1"></td>
		</tr>
	</table>
	
	<script type="text/javascript">
		$("#table tr").click(function(){
			var str = "";
			var tdArr = new Array(); // 배열
			// 현재 클릭된 Row(<tr>)
			var tr = $(this);
			var td = tr.children();
			// http://all-record.tistory.com/172
			var no = td.eq(0).s.value;
			var link = 'boardView.jsp?num=' + no;
			location.href=link;
		});
	</script>
</body>
</html>