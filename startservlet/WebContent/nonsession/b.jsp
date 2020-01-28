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
String id = request.getParameter("id");
%>
<h1><%=id %> 회원님의 장바구니 목록입니다.</h1>
<h3> 장바구니 목록입니다. </h3>
</body>
</html>