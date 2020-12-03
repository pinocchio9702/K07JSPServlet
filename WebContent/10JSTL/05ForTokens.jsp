<%@page import="java.util.StringTokenizer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>05ForTokens.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<h2>forTokens 태그</h2>
	<!-- 
	StringTokenizer클래스
		: 문자열 토근(구분자)로 나눠서 출력할떄 사용한다.
		countTokens() : 토근의 갯수를 반환한다.
		hasMoreTokens() : 
	 -->
	<%
	String colors = "red,green,blue,gray";
	
	StringTokenizer tokens = new StringTokenizer(colors, ",");
	out.println("<h3>StringTokenizer클래스사용</h3>");
	out.println("<h4>토긑수: " + tokens.countTokens() + "</h4>");
	while(tokens.hasMoreTokens()){
		String token = tokens.nextToken();
		out.println("<h5 style='color:" +token+"'>토근</h5>");
	}
	/*
	String클래스의 split() 메소드
		: 문자열을 구분자로 잘라서 문자열배열로 반환해주낟.
		Javascript에도 동일한 함수가 존재하고, 다른 웹프로그래밍
		언어에서도 많이 사용된다.
	*/
	String[] colorArr = colors.split(",");
	out.println("<h3>String클래스사용</h3>");
	for(String color : colorArr){
		out.println("<h5 style'color:" + color+"'>TOKEN</h5>");
	}
	%>
	
	<!-- 
	forTokens태그의 속성
		items : 구분자를 포함한 문자열
		delims(delimiter) : 구분자(여러가지 특수기호를 사용할 수 있다.)
		var : 구분자를 통해 잘라낸 토근을 저장한다.
	 -->
	<h3>JSTL의 fortokens태그 사용</h3>
	<c:forTokens items="<%=colors %>" delims=",">
		<h5 style="color${color};">JSTL 조아요</h5>
	</c:forTokens>
	
	
	
	
	
	
	
	
</body>
</html>