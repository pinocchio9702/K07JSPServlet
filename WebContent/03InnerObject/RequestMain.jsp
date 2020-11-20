<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RequestMain.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<h2>전송방식(Post, Get) 테스트</h2>
	
	<h3>Get방식 전송</h3>
	<a href="RequestInfo.jsp?paramNum=123&paramEng=Hello&paramHan=안녕">
		Get방식</a>
	<form action="RequestInfo.jsp" method="post">
		문자열입력 : <input type="text" name="paramHan" />
		<input type="submit" value="post방식" />
	</form>
</body>
</html>