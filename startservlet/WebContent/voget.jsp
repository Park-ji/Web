<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="e.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>/voset 파일로부터 공유받은(전달받은) 객체는 다음과 같습니다.	</h1>
<%-- 
<%= application.getAttribute("member") %>
<!-- 
결과 : vo.MemberVO@1b98529
-> toString메서드가 오버라이딩이 안되어있어서 이렇게 결과가 나옴
 --> 
 --%>
<!-- 
application.getAttribute("member") : Object형식으로 리턴
Object vo =  application.getAttribute("member"); 
MemberVO vo = (MemberVO)application.getAttribute("member"); 
 -->
<% MemberVO vo = (MemberVO)application.getAttribute("member");  %>
<h1> 아이디: <%=vo.getId() %></h1>
<h1> 이름: <%=vo.getName() %></h1>
<h1> 폰: <%=vo.getPhone() %></h1>
<h1> 이메일: <%=vo.getEmail() %></h1>
<h1> 가입일: <%=vo.getIndate() %></h1>
</body>
</html>