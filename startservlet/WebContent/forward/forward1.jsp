<%@page import="vo.MemberVO"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% request.setCharacterEncoding("utf-8"); %>
<h1>forward1.jsp 실행중입니다.</h1>
<!-- out 버퍼 저장  -->
<% 
MemberVO vo = new MemberVO();
vo.setId(request.getParameter("id"));
vo.setPw("1111");
vo.setName("이자바");
vo.setPhone("010-222-3333");
vo.setEmail("a@b.om");
vo.setIndate("2019-12-09");
request.setAttribute("vo", vo);
%>
<jsp:forward page="forward2.jsp">
<jsp:param value="포워드 처리중" name="name"/>
<jsp:param value="아이디" name="id"/>
</jsp:forward>
<!-- out 버퍼 저장 내용 삭제/forward : 다시 froward1.jsp 리턴 x
즉, forward는 위에서 다 실행할것 하고 맨 마지막에 실행함 -->
<h3>forward 이후의 forward1.jsp 실행합니다.</h3>




</body>
</html>








