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

<h2 style="color:blue">여기는 forward2.jsp 실행 내용입니다.<br>
아이디는 <%=request.getParameter("id") %> 값을 전달받았습니다.<br>
이름은 <%=request.getParameter("name") %> 값을 전달받았습니다.<br>
<% MemberVO vo = (MemberVO)request.getAttribute("vo");%>
<%=vo %>

</h2>

</body>
</html>