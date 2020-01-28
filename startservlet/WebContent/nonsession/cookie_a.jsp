<%@page import="java.net.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String id= null;
String name = null;
//즉, 쿠키가 없으면? 로그임 한번도 안함
	
if(request.getCookies()==null){
	id = request.getParameter("id");//처음 로그인한 정보
	//memeber id 존재, pw 맞는지 확인한 과정 생략
	//쿠키 생성 + response --> 즉, 2번 생성? 2번 response
	Cookie c = new Cookie("cookieid",id);//지속적으로 저장할 공간에 해당 로그인 정보 저장
	//브라우져가 종료되더라도 쿠키가 남아있도록 설정 가능(기본은 원래 브라우져 종료시 삭제)
	//c.setMaxAge(60);//매개변수 단위는 초단위
	
	//쿠키의 특징? 
	//서버에서 생성, 생성되어진 값은 브라우저에 저장
	//브라우저는 자바객체를 모름(즉, 자바객체 전송 x)
	//쿠키 하나에 저장되어지는 크기는 4kb로 한정되어져있음
	//1사이트에서는 쿠키는 20개까지 만들수 있음
	//브라우저 내부에서는 쿠키 300개까지 저장할 수 있음
	//브라우저 내부로 한글 데이터 보낼때? 위에 contentType은 브라우져 본문에 보내는 부분
	//쿠키는 숨겨서 보내짐(브라우져 내부) - 즉, 따로 한글 데이터 인코딩 해줘야함(java.net.URLEncdoer)
	//또한, 그렇다면 읽어올때 한글 데이터 디코딩 해줘야함
	Cookie c2 = new Cookie("cookiename",URLEncoder.encode("김한글"));
	response.addCookie(c);
	response.addCookie(c2);
	//브라우저 종료시? 로그인한 정보는 사라짐(즉, 브라우져 종료전까지 a,b,c는 같이 공유함)
}
else{
	Cookie[] coo = request.getCookies();
	for(int i=0;i<coo.length;i++){
		if(coo[i].getName().equals("cookieid")){
			id=coo[i].getValue();
		}
		if(coo[i].getName().equals("cookiename")){
			name=URLDecoder.decode(coo[i].getValue());
		}
	}
}
%>
<h1> 아이디 <%=id %>인 <%=name%>회원님의 메뉴는 다음과 같습니다.</h1>
<h3>
<ul>
<li><a href="cookie_c.jsp?">게시물 작성</a></li>
<li><a href="cookie_b.jsp?id=<%=id%>">장바구니 목록</a></li>
<li>로그아웃</li>
</ul>
</h3>
</body>
</html>