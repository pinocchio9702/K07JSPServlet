<%@page import="model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
//폼값 받기
String id = request.getParameter("user_id");
String pw = request.getParameter("user_pw");

//web.xml에 저장된 컨텍스트 초기화 파라미터 가져옴
String drv = application.getInitParameter("JDBCDriver");
String url = application.getInitParameter("ConnectionURL");

//DAO객체 생성 및 디비 연결
MemberDAO dao = new MemberDAO(drv, url);

//폼값으로 받은 아이디, 패스워드를 통해 로그인 처리 함수 호출
boolean isMember = dao.isMember(id, pw);/*
			해당 함수는 count()를 사용하므로 로그인시 사용한
			아이디, 패스워드 외의 정보를 얻어올수 없다.
		
		*/
if(isMember == true){
	//로그인 성공시 세션영역에 속성에 아래 속성을 저장한다.
	session.setAttribute("USER_ID", id);
	session.setAttribute("USER_PW", pw);
	
	response.sendRedirect("Login.jsp");
}
else{
	request.setAttribute("ERROR_MSG","넌 회원이 아니시군");
	request.getRequestDispatcher("Login.jsp").forward(request, response);
}
%>
