<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2 style="color:blue">여기는 include2.jsp 실행 내용입니다.<br>
아이디는 <%=request.getParameter("id") %> 값을 전달받았습니다.<br>
이름은 <%=request.getParameter("name") %> 값을 전달받았습니다.<br>
<% 
MemberVO vo = (MemberVO)request.getAttribute("vo");
%>
<%=vo %>
<!-- 
vo라고 사용한 것은 vo.toString()이 호출되어 나오는것과 같음
vo.toString() 에서 toString은 object의 toString을 오버라이딩 또는 상속받아 사용 
즉, 원하는 출력형태로 출력하고 싶으면 ? MemberVO에 가서 원하는 모양으로 오버라이딩 해놓으면 됨
-->
</h2>
<!-- 
1. html form형식
2. 클라이언트 url 요청 (..?id=servletjsp)
3. jsp파일끼리
 -->
</body>
</html>