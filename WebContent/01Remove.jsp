<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<!-- 
	remove태그 : set으로 선언한 변수를 제거할때 사용하는 태그
		영역에 저장된 속성을 제거하므로, 로그아웃에서 사용할 수도 있다.
 -->
	<h2>remove 태그</h2>
	<c:set var="pageVar" value="페이지영역" />
	<c:set var="pageVar" value="리쿼스트영역1번" scope="request" />
	<c:set var="requestVar" value="리쿼스트영역2번" scope="request" />
	<c:set var="sessionVar" value="세션영역" scope="session" />
	<c:set var="appVar" value="어플리케이션영역" scope="application" />
	
	<!-- 
	xxScope
	 -->
	<h3>삭제전 출력하기</h3>
	<ul>
		<li>페이지 : ${pageVar }</li>
		<li>리쿼스트1 : ${requestScope.pageVar }</li>
		<li>리쿼스트2 : ${requestVar }</li>
		<li>세션 : ${sessionVar }</li>
		<li>어플리케이션 : ${appVar }</li>
	</ul>
	
	<!-- 
		속성멸은 존재하지만, 영역설정이 잘못된 경우라도 아무것도 삭제되지 않는다.
		영역 혹은 변수명의 설정이 잘못되더라도 에러는 발생하지 않는다.
	 -->
	<h3>remove로 삭제하기</h3>
	<c:remove var="requestVar" scope="session" />
	
	<!-- 
		영역에 동리한 이름의 속성이 존재하는 경우에는 모든 영역의
		속성이 한꺼번에 삭제되므로 사용에 주의해야 한다.
	 -->
	<h3>remove로 삭제하기</h3>
	<c:remove var="requestVar"/>
	
	<h3>영역이 다른 속성명 삭제후 출력하기</h3>
	<ul>
		<li>페이지 : ${pageVar }</li>
		<li>리퀘스트1 : ${requestScope.pageVar }</li>
		<li>리퀘스트2 : ${requestVar }</li>
		<li>세션 : ${sessionVar }</li>
		<li>리퀘스트2 : ${appVar }</li>
	</ul>
	
	<h3>스코프 미지정 후 같은 속성명 삭제후 출력하기</h3>
	<ul>
		<li>페이지 : ${pageVar }</li><!-- 삭제됨 -->
		<li>리쿼스트1 : ${requestScope.pageVar }</li><!-- 삭제됨 -->
		<li>리쿼스트2 : ${requestVar }</li>
		<li>세션 : ${sessionVar }</li>
		<li>어플리케이션 : ${appVar }</li>
	</ul>
	
	
	
	
	
</body>
</html>