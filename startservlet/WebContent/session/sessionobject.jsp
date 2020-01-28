<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
session내장객체 : javax.servlet.http.HttpSession이라는 API타입
javax.servlet.http.HttpSession session = ...(); - page지시문과 밀접한 연관(session은 true로 되어있음-기본)
즉, session속성 안쓸꺼면 false로 바꾸면 된다
 -->
<%--  <%javax.servlet.http.HttpSession session = request.getSession(); %> --%>
 <!-- javax.servlet.http는 자동 import되어있음 -->
 <%HttpSession session = request.getSession(); %>
 <!-- page지시문에 true로 내장객체로 만들면 위의 문장은 에러 
 내장객체라면 servlet도 사용가능-->
 <%=session.getCreationTime() %>
</body>
</html>