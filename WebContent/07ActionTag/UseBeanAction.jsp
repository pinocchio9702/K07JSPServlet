<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UseBeanAction.jsp</title> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<h2>userBean 액션태그</h2>
	
	<h3>userBean 액션태그로 좁은의미 자바빈 객체 생성하기</h3>
	
	<%--
	
	1. request영역에 저장된 member객체를 가져온다.
	MemberDTO memberDTO = (MemberDTO)request.getAttribute("member");
	
	if(memberDTO == null){
		2. 만약 객체가 null값이면 객체를 생성한다.
		memberDTO = new MemberDTO();
		3. 생성한 객체를 request영역에 저장한다.
		request.setAttribute("member", memberDTO);
	}
	//위 Java코드를 액션태그로 표현하면 아래와 같이된다.
	--%>
	
	<jsp:useBean id="member1" class="model.MemberDTO" scope="request" />
	<!-- 
	userBean의 id속성과 setProperty의 name속성값이 서로 연결되어
	빈을 지정하게되고, setter()를 통해 값이 설정된다.
	즉, DTO클래스 setter()가 없으면 액션태그는 에러를 발생시킨다.
	 -->
	<h3>setProperty 액션태그로 자바빈 객체 속성 지정하기</h3>
	<jsp:setProperty property="id" name="member1" value="KIM"/>
	<jsp:setProperty property="pass" name="member1" value="1234"/>
	<jsp:setProperty property="name" name="member1" value="김희선"/>
	
	<!-- 빈의 getter()를 통해 얻어온 후 출력한다. -->
	<h3>getProperty 액션태그로 자바빈 객체 속성읽기</h3>
	<ul>
		<li>아이디 : 
			<jsp:getProperty property="id" name="member1" />
		</li>
		<li>패스워드 : 
			<jsp:getProperty property="pass" name="member1" />
		</li>
		<li>이름 : 
			<jsp:getProperty property="name" name="member1" />
		</li>
	</ul>
	
	<jsp:forward page="UseBeanActionForward.jsp"></jsp:forward> 
</body>
</html>