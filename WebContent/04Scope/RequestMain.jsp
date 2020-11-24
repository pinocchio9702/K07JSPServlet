<%@page import="java.net.URLEncoder"%>
<%@page import="model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
	//리쿼스트 영역에 속성 저장하기
	request.setAttribute("requestNumber", 999);
	request.setAttribute("requestString", "여기는 리퀘스트 영역입니다.");
	request.setAttribute("requestMember1", new MemberDTO(
			"Hong", "1234", "홍길동", null));
	
%>
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
<h2>리퀘스트 영역에 저장된 속성값 읽기</h2>
	<ul>
		<li>Integer타입 : 
			<%=request.getAttribute("requestNumber") %></li>
		<li>String타입 :
			<%=request.getAttribute("requestString") %></li>
			
		<%
		MemberDTO member = (MemberDTO)request.getAttribute("requestMember1"); 
		%>
		
		<li>MemberDTO타입 :
			아이디 : <%=member.getId() %>.
			패스워드 : <%=member.getPass() %>,
			이름 : <%=member.getName() %>,
			가입일 : <%=member.getRegidate() %>
		</li>
	</ul>
	
	<h2>리퀘스트 영역에 저장된 속성 삭체후 출력하기</h2>
	<%
		request.removeAttribute("NoKeyValue");//키 없으나 에러발생 x
		request.removeAttribute("requestNumber");
		request.removeAttribute("requestString");
		
	%>
	<ul>
		<li>Integer타입 :
			<%=request.getAttribute("requestNumber") %></li>
		<li>String타입 : 
			<%=request.getAttribute("requestString") %></li>
		<li>MemberDTO타입 : 
			아이디 : <%=member.getId() %>,
			패스워드 : <%=member.getPass() %>,
			이름 : <%=member.getName() %>,
			가입일 : <%=member.getRegidate() %>
		</li>
	</ul>
	
	<h3>forward()를 추가한 페이지 전달</h3>
	<%
	  RequestDispatcher dis = request
				.getRequestDispatcher("RequestResult.jsp?param=포워드방식");
	dis.forward(request, response);
	
	%>
	
	<h3>sendRedirect()를 사용한 페이지 이동</h3>
	<%
	 /* request.getRequestDispatcher("RequestResult.jsp?param =" +
				URLEncoder.encode("리다이렉트방식", "UTF-8"));
	*/
	%>
</body>
</html>