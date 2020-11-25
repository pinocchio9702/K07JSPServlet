<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PopupMain.jsp</title>
<style>
	div#popup{
		position: absolute; top: 100px; left: 200px;
		width: 300px; height: 200px; color: yellow;
		border: 0px solid gray; background-color: gray;
	}
	div#popup>div{
		position: relative; background-color: #ffffff; top: 50px;
		border: 1px solid gray; padding: 10px; color: black;
	}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<h2>파업 메인페이지</h2>
	페이지를 방문하면 레이어 파업이 뜨게 됩니다. <br/>
	페이지를 방문하면 레이어 파업이 뜨게 됩니다. <br/>
	페이지를 방문하면 레이어 파업이 뜨게 됩니다. <br/>
	페이지를 방문하면 레이어 파업이 뜨게 됩니다. <br/>
	페이지를 방문하면 레이어 파업이 뜨게 됩니다. <br/>
	페이지를 방문하면 레이어 파업이 뜨게 됩니다. <br/>
	페이지를 방문하면 레이어 파업이 뜨게 됩니다. <br/>
	<%
	String isPopup = "on";
	//생성되는 모든 쿠키를 가져온다.
	Cookie[] cookies = request.getCookies();
	//쿠키의 갯수만큼 반복...
	if(cookies != null){
		//쿠키명과 값을 가져온다.
		for(Cookie c : cookies){
			String cookieName = c.getName();
			String cookieValue = c.getValue();
			//쿠키명중 팝업닫기 관련 함목이 있다면 저장된 값을 가져온다.
			if(cookieName != null && cookieName.equals("PopupClose")){
				//변수 값이 off로 변경된다.
				isPopup = cookieValue;
			}
		}
	}
	System.out.println(isPopup);//쿠키값을 로그를 통해 확인
	if(isPopup.equals("on")){//쿠키값이 on이면 레이어팝업창을 띄어줌
	%>
	<script>
	function popClose() {
		
		//팝업창의 아이디 속성을 통해 닫아준다.
		var popup = document.getElementById("popup");
		popup.style.display = "none";
		
		/*
		오늘하루 열지 않음 체크박스를 체크한 후 닫기를 누루면
		JS를 통해 폼값을 전송한다. target을 iframe으로
		설정하여 페이지 이동이 없는것처럼(비동기) 보이게 한다.
		*/
		
		var frm = document.popFrm;
		if(frm.isToday.checked == true){
			console.log("isToday check..")
			frm.action = 'PopupCookie.jsp';
			frm.target = 'hiddenFrame';
			frm.submit(); //폼값이 여기서 전송됨
		}
	}
	</script>
	<div id="popup">
		<h2>공지사항</h2>
		<p>
			중얼중얼~가타부타~블라블라</br>
			중얼중얼~가타부타~블라블라</br>
			중얼중얼~가타부타~블라블라</br>
		</p>
		<div>
		<form name="popFrm">
			<input type="checkbox" name="isToday" value="1" />
			오늘 하루 열지 않음
			<input type="button" value="닫기" onclick="popClose();">
		</form>
		</div>
	</div>
	<!-- 폼값은 여기로 전송된다. -->
	<iframe name="hiddenFrame" style="display: none;"></iframe>
<%
}
%>
</body>
</html>