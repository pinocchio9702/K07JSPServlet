<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%!
public int getBaesu(int first, int second, int baesu){
	
	int result = 0;
	
	for(int i= first; i<second; i++){
		if(i % baesu == 0){
			result += i;
		}
	}
	
	return result;
}


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MethodDefine.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<h2>선언부에서 메소드 정의</h2>
	<h3>스크립트렛에서 결과값 출력</h3>
	<%
	/*
	연습문제] 1부터 100사이의 숫자중 3의배수의 합을
			반환하는 함수를 선언 후 결과를 출력하시오.
			함수명 : getBaesu()
	*/
	
		int habResult = getBaesu(1, 100, 3);
		out.println("1~100사이의 3의 배수의 합 :" + habResult);
	
	%>
	
	<h3>표현식에서 결과값 출력</h3>
	1~200사이의 숫자중 5의 배수의 합은?
		<%=getBaesu(1, 200, 5) %>
</body>
</html>