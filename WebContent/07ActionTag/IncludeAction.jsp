<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IncludeAction.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<%
//인클루드 할 페이지 경로를 String으로 설정
String directivePath = "./include/DirectivePage.jsp";
String actionTagPath = "./include/ActionTagPage.jsp";

//페이지 영역, 리쿼스트 영역에 속성을 저장
pageContext.setAttribute("pageVar", "페이지영역에 저장");
request.setAttribute("requestVar", "리퀘스트영역에 저장");
%>

<h2>include 액션태그</h2>

<h3>include 지시어로 페이지 포함하기</h3>

<!-- 
지시어(디렉티브)를 통한 include는 표현식을 사용할 수 없다.
반드시 문자열로 기술해야 한다.
 -->
 
<%--@ include file="<%=directivePath --%>

<%@ include file="./include/DirectivePage.jsp"%>

<!-- 
액션태그
 -->
<h3>include 액션태그 페이지 포함하기</h3>
<jsp:include page="<%=actionTagPath %>" />
<jsp:include page="./include/ActionTagPage.jsp" />

<h2>각각의 포함된 페이지안에서 선언한 변수 사용하기</h2>
<!-- 
 include지시어 액션태그의 차이점
 지시어
 	-jsp소스를 그대로 포함시킨 후 페이지를 실행(컴파일)한다.
 	-즉, 현재페이지와 같은 페이지를 의미한다.
 액션태크
 	-jsp소스를 먼저 실행한 후 실행된 결과를 포함시킨다.
 	-따라서 기존페이지에서 선언된 변수는 포함시킨 페이지에서
 	사용할 수 없다.
 	-다른 페이지를 의미하므로 page영역은 공유되지 않는다.
 	-하지만 forward와 같이 request영역은 공유된다.
 -->
<h3>디렉티브 페이지에서 선언한 변수 사용</h3>
변수 출력 : <%=dirString %>

<h3>액션태그 페이지에서 선언한 변수 사용</h3>
변수 출력 : <%--=actionString --%>



</body>
</html>