<%@page import="model.MyFileDAO"%>
<%@page import="model.MyFileDTO"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	//한글깨짐처리(post로 폼값전송시 깨짐 부분 처리)
request.setCharacterEncoding("UTF-8");

//파일 업로드를 위한 MultipartRequest객체의 파라미터 준비
/*
	1. 파일이 업로드될 서버의 물리적경로 가져오기
	: 운영체제별로 서버의 물리적 경로는 다르기때문에 파일이 업로드되는
	정확한 위치를 가져오기 위해서 반드시 필요한 정보이다.
*/
String saveDirectory = application.getRealPath("/Upload");

/*
	2. 업로드할 파일의 최대용량 설정(바이트단위)
	: 만약 파일이 여러개 업로드 된다면 각각의 용량을 합친 용량이
	최대용량이 된다. 
	Ex) 500Kb * 2 = 1000Kb
*/
int maxPostSize = 1024* 5000;

//3.인코딩 방식 설정
String encording = "UTF-8";

/*
	4.파일명 중복처리
	: 파일명이 중복되는 경우 자동인덱스를 부여하여 파일명을 수정해준다.
	Ex) apple.png, apple1.png, ...와 같은 인덱스를 부여한다.
*/
FileRenamePolicy policy = new DefaultFileRenamePolicy();

//전송된 폼값을 정하기 위한 변수 설정
//멀티파트 객체 생성 및 전송된 폼값을 저장하기 위한 변수 선언
MultipartRequest mr = null;
String name = null;
String title = null;
StringBuffer inter = new StringBuffer();
File oldFile = null;
File newFile = null;
String realFileName = null;


try{
	/*
		1~4번까지 준비한 인자를 이용하여 아래 객체를 생성한다.
		객체가 정상적으로 생성되면 파일업로드는 완료된다.
		만약 예외가 발생한다면 주로 최대용량초과 혹은 디렉토리 경로가
		잘못된 경우이다.
	*/
	mr = new MultipartRequest(request, saveDirectory, maxPostSize, encording, policy);
	
	//////////////추가부분 start/////////////////////////////
	
	//서버에 저장된 파일명 가져오기
	String fileName = mr.getFilesystemName("chumFile1");
	
	/*
	파일명을 변경하기 위해 현재날짜와 시간을 얻어온다.
	특히 서식중 대문자 S는 초를 1/10000단위로 가져오게 된다.
	*/
	String nowTime = new SimpleDateFormat("yyyy_MM_dd_H_m_s_S").format(new Date());
	
	/*
	파일의 확장자를 가져오기 위해 파일명의 마지막에 있는 점의 위치를 찾는다.
	따라서 lastIndexof()를 통해 찾아서 확장자를 따낸다. 
	*/
	int idx = -1;
	//점의 인덱스 번호를 idx에 저장
	idx = fileName.lastIndexOf(".");
	//시간을 통해 얻은 문자열과 확장자를 합쳐준다.
	realFileName = nowTime + fileName.substring(idx, fileName.length());
	
	/*
	서버의 물리적경로와 생성된 파일명을 통해 File객체를 생성한다.
	파일객체.separator : 파일경로를 나타낼때 윈도우와 리눅스는 각각
		\ 혹은 / 와 같이 os에 따라 구분기호가 틀린데, 해당 OS에 맞는
		구분기호를 구해주는 역할을 한다.
	*/
	oldFile = new File(saveDirectory + oldFile.separator + fileName);
	newFile = new File(saveDirectory + oldFile.separator + realFileName);
	
	//저장된 파일명을 변경한다.
	oldFile.renameTo(newFile);
	//////////////추가부분 end/////////////////////////////
	
	
	name = mr.getParameter("name");
	title = mr.getParameter("title");
	String[] interArr = mr.getParameterValues("inter");
	
	for(String s : interArr){
		inter.append(s + ",&nbsp;");
	}
	/////////////////////////////////////////////////////////////
	//DTO객체 생성한 후 폼값 저장
	MyFileDTO dto = new MyFileDTO();
	dto.setName(name);
	dto.setTitle(title);
	dto.setInter(inter.toString());
	dto.setOfile(mr.getOriginalFileName("chumFile1"));//원본 파일 명
	dto.setSfile(realFileName);//서버에 저장된 파일명
	 
	//DAO객체 생성후 DB연결 및 insert처리
	MyFileDAO dao = new MyFileDAO(application);
	dao.myfileInsert(dto);
	
	//DB처리후 페이지 이동
	response.sendRedirect("FileList.jsp");
	/////////////////////////////////////////////////////////////
	
	
}
catch(Exception e){
	request.setAttribute("errorMessage", "파일업로드오류");
	request.getRequestDispatcher("FileUploadMain.jsp")
	.forward(request, response);
}
%>
