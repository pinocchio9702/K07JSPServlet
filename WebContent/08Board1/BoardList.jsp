<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>게시판리스트</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<script src='https://kit.fontawesome.com/a076d05399.js'></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
<div class="container">
	<div class="row">		
		<div class="col-12">			 
			<!-- 
				.bg-primary, .bg-success, .bg-info, .bg-warning, .bg-danger, .bg-secondary, 
				.bg-dark, .bg-light
			-->
			<nav class="navbar navbar-expand-sm bg-light navbar-dark">
				<!-- Brand/logo -->
				<a class="navbar-brand" href="#">
					<img src="http://www.ikosmo.co.kr/images/common/logo_center_v2.jpg" style="width:150px;">
				</a>
				
				<!-- Links -->
				<ul class="navbar-nav">
					<li class="nav-item">
						<a class="nav-link text-dark" href="#">자유게시판</a>
					</li>
					<li class="nav-item">
						<a class="nav-link text-dark" href="#">자료실</a>
					</li>
					<li class="nav-item">
						<a class="nav-link text-dark" href="#">방명록</a>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle text-dark" href="#" id="navbardrop" data-toggle="dropdown">
							Menu
						</a>
						<div class="dropdown-menu">
							<a class="dropdown-item text-dark" href="#">SubMenu 1</a>
							<a class="dropdown-item text-dark" href="#">SubMenu 2</a>
							<a class="dropdown-item text-dark" href="#">SubMenu 3</a>
						</div>
					</li>
				</ul>

				<form class="form-inline mt-3 ml-3" method="get" action="">
					<div class="input-group mb-3">
						<input type="text" class="form-control" placeholder="Search">
						<div class="input-group-append">
							<button class="btn btn-warning" type="submit"><i class='fas fa-search' style='font-size:20px'></i></button>
						</div>
					</div>
				</form>
				<ul class="navbar-nav ml-auto" >
					<!-- <li class="nav-item">
						<a class="nav-link text-dark" href="#"><i class='fas fa-edit' style='font-size:20px'></i>회원가입</a>
					</li>
					<li class="nav-item">
						<a class="nav-link text-dark" href="#"><i class='fa fa-cogs' style='font-size:20px'></i>회원정보수정</a>
					</li> -->
					<li class="nav-item">
						<a class="nav-link text-dark" href="#"><i class='fas fa-sign-in-alt' style='font-size:20px'></i>로그인</a>
					</li>
					<li class="nav-item">
						<a class="nav-link text-dark" href="#"><i class='fas fa-sign-out-alt' style='font-size:20px'></i>로그아웃</a>
					</li>
				</ul>
			</nav>
		</div>
	</div>
	<div class="row">		
		<div class="col-3">
			<div style="height: 100px; line-height: 100px; margin:10px 0; text-align: center; 
				color:#ffffff; background-color:rgb(133, 133, 133); border-radius:10px; font-size: 1.5em;">
				웹사이트제작
			</div>
			<div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
				<a class="nav-link active" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="true">자유게시판</a>
				<a class="nav-link" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false">자료실</a>
				<a class="nav-link" id="v-pills-messages-tab" data-toggle="pill" href="#v-pills-messages" role="tab" aria-controls="v-pills-messages" aria-selected="false">방명록</a>				
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Menu</a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">Sub Menu 1</a>
						<a class="dropdown-item" href="#">Sub Menu 2</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Sub Menu 3</a>
						<a class="dropdown-item" href="#">Sub Menu 4</a>
					</div>
				</li>
			</div>
		</div>
		<div class="col-9 pt-3">
			<h3>게시판 - <small>이런저런 기능이 있는 게시판입니다.</small></h3>
			
			<div class="row">
				<!-- 검색부분 -->
				<form class="form-inline ml-auto">	
					<div class="form-group">
						<select name="keyField" class="form-control">
							<option value="">제목</option>
							<option value="">작성자</option>
							<option value="">내용</option>
						</select>
					</div>
					<div class="input-group">
						<input type="text" name="keyString"  class="form-control"/>
						<div class="input-group-btn">
							<button type="submit" class="btn btn-warning">
								<i class='fa fa-search' style='font-size:20px'></i>
							</button>
						</div>
					</div>
				</form>	
			</div>
			<div class="row mt-3">
				<!-- 게시판리스트부분 -->
				<table class="table table-bordered table-hover table-striped">
				<colgroup>
					<col width="60px"/>
					<col width="*"/>
					<col width="120px"/>
					<col width="120px"/>
					<col width="80px"/>
					<col width="60px"/>
				</colgroup>				
				<thead>
				<tr style="background-color: rgb(133, 133, 133); " class="text-center text-white">
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
					<th>첨부</th>
				</tr>
				</thead>				
				<tbody>
				<!-- <%for(int i=1 ; i<=5 ; i++){ %> -->
				<!-- 리스트반복 -->
				<tr>
					<td class="text-center">번호</td>
					<td class="text-left"><a href="ViewSkin.jsp">제목</a></td>
					<td class="text-center">작성자</td>
					<td class="text-center">작성일</td>
					<td class="text-center">조회수</td>
					<td class="text-center"><i class="material-icons" style="font-size:20px">attach_file</i></td>
				</tr>
				<tr>
					<td class="text-center">번호</td>
					<td class="text-left"><a href="ViewSkin.jsp">제목</a></td>
					<td class="text-center">작성자</td>
					<td class="text-center">작성일</td>
					<td class="text-center">조회수</td>
					<td class="text-center"><i class="material-icons" style="font-size:20px">attach_file</i></td>
				</tr>
				<tr>
					<td class="text-center">번호</td>
					<td class="text-left"><a href="ViewSkin.jsp">제목</a></td>
					<td class="text-center">작성자</td>
					<td class="text-center">작성일</td>
					<td class="text-center">조회수</td>
					<td class="text-center"><i class="material-icons" style="font-size:20px">attach_file</i></td>
				</tr>
				<tr>
					<td class="text-center">번호</td>
					<td class="text-left"><a href="ViewSkin.jsp">제목</a></td>
					<td class="text-center">작성자</td>
					<td class="text-center">작성일</td>
					<td class="text-center">조회수</td>
					<td class="text-center"><i class="material-icons" style="font-size:20px">attach_file</i></td>
				</tr>
				<tr>
					<td class="text-center">번호</td>
					<td class="text-left"><a href="ViewSkin.jsp">제목</a></td>
					<td class="text-center">작성자</td>
					<td class="text-center">작성일</td>
					<td class="text-center">조회수</td>
					<td class="text-center"><i class="material-icons" style="font-size:20px">attach_file</i></td>
				</tr>
				<tr>
					<td class="text-center">번호</td>
					<td class="text-left"><a href="ViewSkin.jsp">제목</a></td>
					<td class="text-center">작성자</td>
					<td class="text-center">작성일</td>
					<td class="text-center">조회수</td>
					<td class="text-center"><i class="material-icons" style="font-size:20px">attach_file</i></td>
				</tr>
				 
				<!-- <% } %> -->
				</tbody>
				</table>
			</div>
			<div class="row">
				<div class="col text-right">
					<!-- 각종 버튼 부분 -->
					<button type="button" class="btn">Basic</button>
					<button type="button" class="btn btn-primary">글쓰기</button>
					<button type="button" class="btn btn-secondary">수정하기</button>
					<button type="button" class="btn btn-success">삭제하기</button>
					<button type="button" class="btn btn-info">답글쓰기</button>
					<button type="button" class="btn btn-warning">리스트보기</button>
					<button type="button" class="btn btn-danger">전송하기</button>
					<button type="button" class="btn btn-dark">Reset</button>
					<button type="button" class="btn btn-light">Light</button>
					<button type="button" class="btn btn-link">Link</button>
				</div>
			</div>
			<div class="row mt-3">
				<div class="col">
					<!-- 페이지번호 부분 -->
					<ul class="pagination justify-content-center">
						<li class="page-item"><a href="#" class="page-link"><i class="fas fa-angle-double-left"></i></a></li>
						<li class="page-item"><a href="#" class="page-link"><i class="fas fa-angle-left"></i></a></li>
						<li class="page-item"><a href="#" class="page-link">1</a></li>		
						<li class="page-item active"><a href="#" class="page-link">2</a></li>
						<li class="page-item"><a href="#" class="page-link">3</a></li>
						<li class="page-item"><a href="#" class="page-link">4</a></li>		
						<li class="page-item"><a href="#" class="page-link">5</a></li>
						<li class="page-item"><a href="#" class="page-link"><i class="fas fa-angle-right"></i></a></li>
						<li class="page-item"><a href="#" class="page-link"><i class="fas fa-angle-double-right"></i></a></li>
					</ul>
				</div>				
			</div>		
		</div>
	</div>
	<div class="row border border-dark border-bottom-0 border-right-0 border-left-0"></div>
	<div class="row mb-5 mt-3">		 
		<div class="col-2">
			<h3>겸이아빠&trade;</h3>
		</div>
		<div class="col-10 text-center">
			Email : nakjasabal@naver.com&nbsp;&nbsp;
			Mobile : 010-7906-3600&nbsp;&nbsp;
			Address : 서울시 금천구 가산동 426-5 월드메르디앙2차 1강의실
			<br/>
			copyright &copy; 2019 한국소프트웨어인재개발원.
			All right reserved.
		</div>
	</div>

</div>
</body>
</html>

<!-- 
	<i class='fas fa-edit' style='font-size:20px'></i>
	<i class='fa fa-cogs' style='font-size:20px'></i>
	<i class='fas fa-sign-in-alt' style='font-size:20px'></i>
	<i class='fas fa-sign-out-alt' style='font-size:20px'></i>
	<i class='far fa-edit' style='font-size:20px'></i>
	<i class='fas fa-id-card-alt' style='font-size:20px'></i>
	<i class='fas fa-id-card' style='font-size:20px'></i>
	<i class='fas fa-id-card' style='font-size:20px'></i>
	<i class='fas fa-pen' style='font-size:20px'></i>
	<i class='fas fa-pen-alt' style='font-size:20px'></i>
	<i class='fas fa-pen-fancy' style='font-size:20px'></i>
	<i class='fas fa-pen-nib' style='font-size:20px'></i>
	<i class='fas fa-pen-square' style='font-size:20px'></i>
	<i class='fas fa-pencil-alt' style='font-size:20px'></i>
	<i class='fas fa-pencil-ruler' style='font-size:20px'></i>
	<i class='fa fa-cog' style='font-size:20px'></i>

	아~~~~힘들다...ㅋ
 -->